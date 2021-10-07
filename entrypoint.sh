#!/bin/bash

set -euxo pipefail

function marker_url() {
    if [ -z "$INPUT_URL" ]
    then
        curl -s "https://api.github.com/repos/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}" | jq -r '.html_url'
    else
        echo $INPUT_URL
    fi
}

function create_marker() {
    honeymarker -k "$INPUT_APIKEY" -d "$INPUT_DATASET" add -t "$INPUT_TYPE" -m "$INPUT_MESSAGE" -u "$(marker_url)"
}

create_marker
