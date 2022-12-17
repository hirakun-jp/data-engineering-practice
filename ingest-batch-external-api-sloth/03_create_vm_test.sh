#!/bin/bash

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
    --service-account=${VM_SERVICE_ACCOUNT} \
    --network ${VM_NETWORK} \
    --subnet ${VM_SUBNET} \
    --zone ${VM_ZONE_ID} \
    --tags ${IAP_NETWORK_TAG} \
    --no-address \
    --resource-policies=${VM_SCHEDULE_NAME_TEST} \
    --metadata=startup-script=startup-script.sh
