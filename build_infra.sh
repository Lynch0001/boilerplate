#!/bin/sh

#
# Shell script to create new DEMO Cluster project helm chart values files
# Copies, templatizes, and creates new project values file using boilerplate binary at BOILERPLATE_PATH
#
# execution command: ./build.sh new_project
#

TARGET_PROJECT=$1
BOILERPLATE_PATH="/usr/local/bin"
BASE_PATH="infra-live/prod/us-east-1/xib/xib-demo"

# Verify build_infra_vars.yaml project input matches command line project input

sed -i 's/Project: .*/Project: '$TARGET_PROJECT'/g' ./build_infra_vars.yml

#
# create project folder
#
# if needed, create folders
# copy existing terragrunt file to template folder
# templatize terragrunt file
# create new project terragrunt file
# clean up terragrunt in template folder
#

mkdir $BASE_PATH/$TARGET_PROJECT

#
# Project
#

cp $BASE_PATH/project/alpha/terragrunt.hcl $BASE_PATH/project/alpha-template/terragrunt.hcl
sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/project/alpha-template/terragrunt.hcl
$BOILERPLATE_PATH/boilerplate_linux_amd64 --var-file build_infra_vars.yml --template-url ./$BASE_PATH/project/alpha-template --output-folder $BASE_PATH/project/$TARGET_PROJECT --non-interactive
rm $BASE_PATH/project/alpha-template/terragrunt.hcl

#
# Zookeeper
#

SERVICE="zookeeper"

cp $BASE_PATH/alpha/$SERVICE/terragrunt.hcl $BASE_PATH/alpha-template/$SERVICE/terragrunt.hcl
sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/$SERVICE/terragrunt.hcl
$BOILERPLATE_PATH/boilerplate_linux_amd64 --var-file build_infra_vars.yml --template-url ./$BASE_PATH/alpha-template/$SERVICE --output-folder $BASE_PATH/$TARGET_PROJECT/$SERVICE --non-interactive
rm $BASE_PATH/alpha-template/$SERVICE/terragrunt.hcl

#
# Kafka
#

SERVICE="kafka"

cp $BASE_PATH/alpha/$SERVICE/terragrunt.hcl $BASE_PATH/alpha-template/$SERVICE/terragrunt.hcl
sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/$SERVICE/terragrunt.hcl
$BOILERPLATE_PATH/boilerplate_linux_amd64 --var-file build_infra_vars.yml --template-url ./$BASE_PATH/alpha-template/$SERVICE --output-folder $BASE_PATH/$TARGET_PROJECT/$SERVICE --non-interactive
rm $BASE_PATH/alpha-template/$SERVICE/terragrunt.hcl

#
# Artemis
#

SERVICE="artemis-operator-broker"

cp $BASE_PATH/alpha/$SERVICE/artemis-namespace/terragrunt.hcl $BASE_PATH/alpha-template/$SERVICE/artemis-namespace/terragrunt.hcl
cp $BASE_PATH/alpha/$SERVICE/artemis-acceptor-secret/terragrunt.hcl $BASE_PATH/alpha-template/$SERVICE/artemis-acceptor-secret/terragrunt.hcl
cp $BASE_PATH/alpha/$SERVICE/artemis-broker/terragrunt.hcl $BASE_PATH/alpha-template/$SERVICE/artemis-broker/terragrunt.hcl
sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/$SERVICE/artemis-namespace/terragrunt.hcl
sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/$SERVICE/artemis-acceptor-secret/terragrunt.hcl
sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/$SERVICE/artemis-broker/terragrunt.hcl
$BOILERPLATE_PATH/boilerplate_linux_amd64 --var-file build_infra_vars.yml --template-url ./$BASE_PATH/alpha-template/$SERVICE/artemis-namespace --output-folder $BASE_PATH/$TARGET_PROJECT/$SERVICE/artemis-namespace --non-interactive
$BOILERPLATE_PATH/boilerplate_linux_amd64 --var-file build_infra_vars.yml --template-url ./$BASE_PATH/alpha-template/$SERVICE/artemis-acceptor-secret --output-folder $BASE_PATH/$TARGET_PROJECT/$SERVICE/artemis-acceptor-secret --non-interactive
$BOILERPLATE_PATH/boilerplate_linux_amd64 --var-file build_infra_vars.yml --template-url ./$BASE_PATH/alpha-template/$SERVICE/artemis-broker --output-folder $BASE_PATH/$TARGET_PROJECT/$SERVICE/artemis-broker --non-interactive
rm $BASE_PATH/alpha-template/$SERVICE/artemis-namespace/terragrunt.hcl
rm $BASE_PATH/alpha-template/$SERVICE/artemis-acceptor-secret/terragrunt.hcl
rm $BASE_PATH/alpha-template/$SERVICE/artemis-broker/terragrunt.hcl

#
# IBM MQ
#

#
#
#