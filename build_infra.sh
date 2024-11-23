#!/bin/bash

TARGET_BASE_PATH="targets/infra-live"

./boilerplate_darwin_amd64 --var-file build_vars_infra.yml --template-url infra_templates/test_nlb --output-folder $TARGET_BASE_PATH/$1/$2 --non-interactive
