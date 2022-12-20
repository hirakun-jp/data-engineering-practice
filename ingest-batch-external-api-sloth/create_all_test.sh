#!/bin/bash

# create the bucket
gsutil mb -c standard -b on -l "${RESULT_BUCKET_REGION}" "gs://${RESULT_BUCKET_TEST}"

# create the network
gcloud compute networks create ${NETWORK_NAME_TEST} \
    --subnet-mode=custom

# create the subnetwork
gcloud compute networks subnets create ${SUBNET_NAME_TEST} \
    --network=${NETWORK_NAME_TEST} \
    --region=${SUBNET_REGION} \
    --range=172.16.0.0/24 \
    --enable-private-ip-google-access

# create the firewall rules
gcloud compute firewall-rules create ${IAP_FIREWALL_RULE_NAME} \
    --network=${NETWORK_NAME_TEST} \
    --source-ranges 35.235.240.0/20 \
    --target-tags ${IAP_NETWORK_TAG} \
    --allow tcp:22

# create the cloud router instance
gcloud compute routers create ${NAT_ROUTER_NAME_TEST} \
    --network ${ROUTER_NETWORK} \
    --region ${ROUTER_REGION}

# configure the router
gcloud compute routers nats create ${NAT_CONFIG_NAME_TEST} \
    --router-region ${ROUTER_REGION} \
    --router ${NAT_ROUTER_NAME_TEST} \
    --nat-all-subnet-ip-ranges \
    --auto-allocate-nat-external-ips

# create the service account
gcloud iam service-accounts create ${VM_SERVICE_ACCOUNT_NAME_TEST} \
    --display-name=${VM_SERVICE_ACCOUNT_NAME_TEST}

# grant the service account an IAM role
gsutil iam ch "serviceAccount:${VM_SERVICE_ACCOUNT_EMAIL_TEST}:roles/storage.objectAdmin" "gs://${RESULT_BUCKET_TEST}"

gcloud projects add-iam-policy-binding ${GCP_PROJECT_ID} \
    --member="serviceAccount:${VM_SERVICE_ACCOUNT_EMAIL_TEST}" \
    --role="roles/monitoring.metricWriter"

# create the instance schedule
gcloud compute resource-policies create instance-schedule ${VM_SCHEDULE_NAME_TEST} \
    --vm-start-schedule="${VM_SCHEDULE_START_OPERATION}" \
    --vm-stop-schedule="${VM_SCHEDULE_STOP_OERATION}" \
    --region=${VM_SCHEDULE_REGION} \
    --timezone=${VM_SCHEDULE_TIME_ZONE}

# create the instance
gcloud compute instances create ${VM_NAME_TEST} \
    --machine-type=e2-micro \
    --provisioning-model=STANDARD \
    --service-account=${VM_SERVICE_ACCOUNT_EMAIL_TEST} \
    --scopes https://www.googleapis.com/auth/cloud-platform \
    --network ${VM_NETWORK} \
    --subnet ${VM_SUBNET} \
    --zone ${VM_ZONE_ID} \
    --tags ${IAP_NETWORK_TAG} \
    --no-address \
    --resource-policies=${VM_SCHEDULE_NAME_TEST} \
    --metadata-from-file=startup-script=startup-script.sh
