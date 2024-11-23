#!/bin/sh

TARGET_PROJECT=$1

#
# Archiver
#

SERVICE="archiver"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .ArchiverVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .ArchiverVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .ArchiverVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# Console
#
SERVICE="console"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .ConsoleVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# Datastore
#
SERVICE="datastore"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .DatastoreVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# Deliver
#
SERVICE="deliver"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .DeliverVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .DeliverVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .DeliverVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# Inbound
#
SERVICE="inbound"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .InboundVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .InboundVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .InboundVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# Client
#
SERVICE="client"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .ClientVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .ClientVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .ClientVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# Ingester
#
SERVICE="ingester"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .IngesterVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# parser
#
SERVICE="parser"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .ParserVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .ParserVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .ParserVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# preparser
#
SERVICE="preparser"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .PreparserVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .PreparserVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .PreparserVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# resubmit
#
SERVICE="resubmit"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .ResubmitVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .ResubmitVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .ResubmitVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# router
#
SERVICE="router"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .RouterVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .RouterVariables.scalerMin }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .RouterVariables.scalerMax }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml

#
# twinning
#
SERVICE="twinning"
TARGET_BASE_PATH="helm-charts/$SERVICE/values/demo"
cp $TARGET_BASE_PATH/alpha/values.yaml $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .TwinningVariables.replicas }}/g' $TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_linux_amd64 --var-file build_vars.yml --template-url ./$REPO_PATH/$TARGET_BASE_PATH/alpha-template --output-folder $TARGET_BASE_PATH/$TARGET_PROJECT --non-interactive
rm $TARGET_BASE_PATH/alpha-template/values.yaml