#!/bin/bash

today=`date "+%Y%m%d"`
touch hello-world-${today}.txt
gsutil cp hello-world-${today}.txt "gs://${RESULT_BUCKET_TEST}"
