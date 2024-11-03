#!/bin/bash

TARGET_BASE_PATH="targets"

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/archiver --output-folder $TARGET_BASE_PATH/archiver/values/$1/$2 --non-interactive

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/console --output-folder $TARGET_BASE_PATH/console/values/$1/$2 --non-interactive

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/deliver --output-folder $TARGET_BASE_PATH/deliver/values/$1/$2 --non-interactive

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/inbound --output-folder $TARGET_BASE_PATH/inbound/values/$1/$2 --non-interactive

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/parser --output-folder $TARGET_BASE_PATH/parser/values/$1/$2 --non-interactive

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/preparser --output-folder $TARGET_BASE_PATH/preparser/values/$1/$2 --non-interactive

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/resubmit --output-folder $TARGET_BASE_PATH/resubmit/values/$1/$2 --non-interactive

./boilerplate_darwin_amd64 --var-file build_vars.yml --template-url boilerplate_templates/router --output-folder $TARGET_BASE_PATH/router/values/$1/$2 --non-interactive
