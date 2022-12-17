#!/bin/bash

gsutil ls -L "gs://${RESULT_BUCKET_TEST}" 2>/dev/null \
|| gsutil mb -c standard -l "${RESULT_BUCKET_REGION}" "gs://${RESULT_BUCKET_TEST}"
