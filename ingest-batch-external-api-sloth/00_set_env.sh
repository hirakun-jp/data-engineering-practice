#!/bin/bash

export TEST='test'
export GCP_PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export PROJECT_NUMBER=$(gcloud projects describe "${GCP_PROJECT_ID}" --format='get(projectNumber)')
export SYSTEM_NAME='ingest-batch-ext-api-sloth'
export SYSTEM_NAME_ABBREVIATED='ingest-sloth'

export RESULT_BUCKET_REGION='asia-northeast1'
export RESULT_BUCKET_TEST="${SYSTEM_NAME}-result-${TEST}-gcs"

export NETWORK_NAME_TEST="${SYSTEM_NAME}-${TEST}-vpc"
export SUBNET_REGION='asia-northeast1'
export SUBNET_REGION_CODE='as-ne1'
export SUBNET_NAME_TEST="${SYSTEM_NAME}-${SUBNET_REGION_CODE}-${TEST}-subnet"

export IAP_FIREWALL_RULE_NAME="${SYSTEM_NAME}-iap-internal-tcp-22-allow-rule"
export IAP_NETWORK_TAG='iap'

export ROUTER_NETWORK=$NETWORK_NAME_TEST
export ROUTER_REGION=$SUBNET_REGION
export ROUTER_REGION_CODE=$SUBNET_REGION_CODE
export NAT_ROUTER_NAME_TEST="${SYSTEM_NAME}-${ROUTER_REGION_CODE}-${TEST}-nat-router"
export NAT_CONFIG_NAME_TEST="${SYSTEM_NAME}-${TEST}-nat-config"

export VM_SCHEDULE_NAME_TEST="${SYSTEM_NAME}-${TEST}-gce-schedule"
export VM_SCHEDULE_START_OPERATION='0 0 * * *'
export VM_SCHEDULE_STOP_OERATION='30 0 * * *'
export VM_SCHEDULE_REGION=$SUBNET_REGION
export VM_SCHEDULE_TIME_ZONE='Asia/Tokyo'

export VM_NAME_TEST="${SYSTEM_NAME}-${TEST}-gce"
export VM_NETWORK=$NETWORK_NAME_TEST
export VM_SUBNET=$SUBNET_NAME_TEST
export VM_ZONE_ID='asia-northeast1-a'
export VM_ZONE_CODE='as-ne1-a'
export VM_SERVICE_ACCOUNT="${SYSTEM_NAME_ABBREVIATED}-test-gsa@data-engineering-125700.iam.gserviceaccount.com"

export PROD='prod'
export RESULT_BUCKET_PROD="${GCP_PROJECT_ID}-${SYSTEM_NAME}-result-${PROD}-gcs"
export NETWORK_NAME_PROD="${SYSTEM_NAME}-${PROD}-vpc"
export SUBNET_NAME_PROD="${SYSTEM_NAME}-${SUBNET_REGION_CODE}-${PROD}-subnet"
export NAT_ROUTER_NAME_PROD="${SYSTEM_NAME}-${ROUTER_REGION_CODE}-${PROD}-nat-router"
export NAT_CONFIG_NAME_PROD="${SYSTEM_NAME}-${PROD}-nat-config"
export VM_SCHEDULE_NAME_PROD="${SYSTEM_NAME}-${PROD}-gce-schedule"
export VM_NAME_PROD="${SYSTEM_NAME}-${PROD}-gce"
