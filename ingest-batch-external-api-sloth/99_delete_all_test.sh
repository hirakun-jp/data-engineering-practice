#!/bin/bash
#
# cd ~/data-engineering-practice/ingest-batch-external-api-sloth
# chmod +x delete_all_test.sh
# ./delete_all_test.sh

# delete the instane schedule
printf 'yes' | \
gcloud compute instances remove-resource-policies ${VM_NAME_TEST} \
    --resource-policies=${VM_SCHEDULE_NAME_TEST} \
    --zone ${VM_ZONE_ID}
    
# delete the schedule
printf 'yes' | \
gcloud compute resource-policies delete ${VM_SCHEDULE_NAME_TEST} \
    --region=${VM_SCHEDULE_REGION}

# delete the instance
printf 'yes' | \
gcloud compute instances delete ${VM_NAME_TEST} \
    --zone ${VM_ZONE_ID}

# delete the router config
printf 'yes' | \
gcloud compute routers nats delete ${NAT_CONFIG_NAME_TEST} \
    --router-region ${ROUTER_REGION} \
    --router ${NAT_ROUTER_NAME_TEST}

# delete the cloud router instance
printf 'yes' | \
gcloud compute routers delete ${NAT_ROUTER_NAME_TEST} \
    --region ${ROUTER_REGION}

# delete the firewall rules
printf 'yes' | \
gcloud compute firewall-rules delete ${IAP_FIREWALL_RULE_NAME}

# delete the subnetwork
printf 'yes' | \
gcloud compute networks subnets delete ${SUBNET_NAME_TEST} \
    --region=${SUBNET_REGION}

# delete the network
printf 'yes' | \
gcloud compute networks delete ${NETWORK_NAME_TEST}

# delete the bucket
printf 'yes' | \
gcloud storage rm --recursive "gs://${RESULT_BUCKET_TEST}"
