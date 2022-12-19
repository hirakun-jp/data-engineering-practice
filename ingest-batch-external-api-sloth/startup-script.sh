#!/bin/bash

today=`date "+%Y%m%d"`
touch hello-world-${today}.txt
gsutil cp hello-world-${today}.txt "gs://ingest-batch-ext-api-sloth-result-test-gcs"
