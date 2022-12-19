#!/bin/bash

# create the service account
gcloud iam service-accounts create ${VM_SERVICE_ACCOUNT_NAME_TEST} \
    --display-name=${VM_SERVICE_ACCOUNT_NAME_TEST}

# grant the service account an IAM role
gcloud projects add-iam-policy-binding ${GCP_PROJECT_ID} \
    --member="serviceAccount:${VM_SERVICE_ACCOUNT_EMAIL_TEST}" \
    --role="roles/storage.admin"

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
