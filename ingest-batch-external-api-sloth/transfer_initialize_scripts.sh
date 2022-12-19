#!/bin/bash

# transfer initialize files
gcloud compute scp --tunnel-through-iap --zone ${VM_ZONE_ID} initialize_vm.sh ${VM_NAME_TEST}:~/
