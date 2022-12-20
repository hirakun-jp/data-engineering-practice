#!/bin/bash

today=`date "+%Y%m%d-%H%M%S"`
touch helloworld-${today}.txt
gsutil cp helloworld-${today}.txt "gs://ingest-batch-ext-api-sloth-result-test-gcs"
rm helloworld-${today}.txt