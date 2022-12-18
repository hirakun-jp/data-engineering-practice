#!/bin/bash

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
