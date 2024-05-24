#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: ./setup_premium_archway.sh <contract-name> <premium-fee> <owner-address> <gas-adjustment>"
    exit 1
fi

# Assign input arguments to variables
CONTRACT_NAME="$1"
PREMIUM_FEE="$2"
SUB_NAME="$3"
GAS_ADJUSTMENT="$4"

SUB_ADDRESS=$(archway accounts get $SUB_NAME --address)

archway contracts premium $CONTRACT_NAME \
--premium-fee $PREMIUM_FEE \
--json \
--log-level debug \
--keyring-backend os \
-f $SUB_ADDRESS \
--gas-adjustment $GAS_ADJUSTMENT
