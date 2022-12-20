#!/bin/bash

# create the bucket
gsutil mb -c standard -b on -l "${RESULT_BUCKET_REGION}" "gs://${RESULT_BUCKET_TEST}"
