terraform {
  source = "git::git@github.com:Lynch0001/aws-alb.git//?ref=XX-asg-attach"
}

locals {
  cluster_vars = read_terragrunt_config(find_in_parent_folders("cluster.hcl"))
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  route53_record_name = "mq-{{ .Project }}.tlynch.net"
}

inputs = merge(
  local.cluster_vars.locals,
  local.env_vars.locals,
  local.region_vars.locals,
  {
    # nlb
    aws_region                 = "us-east-1"
    create_lb                  = true
    enable_deletion_protection = false
    name                       = "mq-dev-{{ .Project }}-nlb"
    internal                   = true
    load_balancer_type         = "network"
    attach_asg                 = true
    #vpc_id # from region, env and cluster files
    #subnets # from region, env and cluster files
    #security_groups # from region, env and cluster files
    autoscaling_groups = ["test-asg-1","test-asg-2","test-asg-3"]
    # nlb listeners
    http_tcp_listeners = [

      {
        port               = 7231
        protocol           = "TCP"
        target_group_index = 0
      },
      {
        port               = 7232
        protocol           = "TCP"
        target_group_index = 1
      },
      {
        port               = 7233
        protocol           = "TCP"
        target_group_index = 2
      },
      {
        port               = 7234
        protocol           = "TCP"
        target_group_index = 3
      },
      {
        port               = 7235
        protocol           = "TCP"
        target_group_index = 4
      }
    ]

    # target groups
    target_groups = [
      # mqa1
      {
        name              = "mq-dev-{{ .Project }}1-target"
        backend_protocol  = "TCP"
        backend_port      = 7231
        create_attachment = false
        preserve_client_ip = false
      },
      # mqa2
      {
        name              = "mq-dev-{{ .Project }}2-target"
        backend_protocol  = "TCP"
        backend_port      = 7232
      },
      # mqa3
      {
        name              = "mq-dev-{{ .Project }}3-target"
        backend_protocol  = "TCP"
        backend_port      = 7233
      },
      # mqa4
      {
        name              = "mq-dev-{{ .Project }}4-target"
        backend_protocol  = "TCP"
        backend_port      = 7234
      },
      # mqa5
      {
        name              = "mq-dev-{{ .Project }}5-target"
        backend_protocol  = "TCP"
        backend_port      = 7235
      }
    ]

#  # create Route53 alias record for nlb
  route53_records = [{
    zone_id = local.env_vars.locals.zone_id
    name    = "${local.route53_record_name}"
    type    = "A"
    routing_policy = "Failover"
    failover_routing_policy = {
      type = "PRIMARY"
    }
    health_check_id = "48eddaa9-9a56-49c8-a035-fff1d615ea5c"
  }]

  # tags
  tags = {
    Terraform = "true"
    Environment = "dev"
    Project = "{{ .Project }}"
  }

  })
