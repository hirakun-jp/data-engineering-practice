#!/bin/bash

# transfer tiktok files
gcloud compute scp --tunnel-through-iap --zone ${VM_ZONE_ID} ingest_tiktok_ranking.py ${VM_NAME_TEST}:~/tiktok
