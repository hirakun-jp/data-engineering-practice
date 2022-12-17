#!/bin/bash

cd ~
FILE="initialize_on_vm.sh"

if [ -e $FILE ]; then

    today=`date "+%Y%m%d"`
    curl https://www.tiktok.com/ja-JP/ > tiktok-${today}.html
    gsutil cp tiktok-20221214.html "gs://${RESULT_BUCKET_TEST}"
#cd tiktok/
#  python3 -m ingest_tiktok_ranking.py
fi