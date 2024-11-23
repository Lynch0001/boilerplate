#!/bin/sh

REPO_PATH="/Users/timothylynch/workspace/boilerplate"
TARGET_BASE_PATH="helm-charts/archiver/values/demo"
#TARGET_PROJECT="bravo"

cp $REPO_PATH/$TARGET_BASE_PATH/alpha/values.yaml $REPO_PATH/$TARGET_BASE_PATH/alpha-template/values.yaml
sed -i '' 's\alpha\{{ .Project }}\g' $REPO_PATH/$TARGET_BASE_PATH/alpha-template/values.yaml
./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url $REPO_PATH/$TARGET_BASE_PATH/alpha-template/ --output-folder $REPO_PATH/$TARGET_BASE_PATH/$1 --non-interactive
#
#./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/console --output-folder $TARGET_BASE_PATH/console/values/$1/$2 --non-interactive
#
#./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/deliver --output-folder $TARGET_BASE_PATH/deliver/values/$1/$2 --non-interactive
#
#./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/inbound --output-folder $TARGET_BASE_PATH/inbound/values/$1/$2 --non-interactive
#
#./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/parser --output-folder $TARGET_BASE_PATH/parser/values/$1/$2 --non-interactive
#
#./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/preparser --output-folder $TARGET_BASE_PATH/preparser/values/$1/$2 --non-interactive
#
#./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/resubmit --output-folder $TARGET_BASE_PATH/resubmit/values/$1/$2 --non-interactive
#
#./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/router --output-folder $TARGET_BASE_PATH/router/values/$1/$2 --non-interactive
