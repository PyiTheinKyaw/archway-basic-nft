#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: ./store_archway.sh <contract_name> <allowed-address-to-instantiate> <gas_adjustment>"
    exit 1
fi

# Assign input arguments to variables
CONTRACT_NAME="$1"
ALLOWED_ACCOUNT="$2"
GAS_ADJUSTMENT="$3"

# ADMIN=$(archwayd keys show justin -a)
SENDER=archway17ju4azaj72tsw5x5fdppqwvh0fvahlyyk3d6mr
ALLOWED_ADDRESS=$(archway accounts get $ALLOWED_ACCOUNT --address)

archway contracts store $CONTRACT_NAME \
--json \
--log-level debug \
--instantiate-permission "any-of" \
--allowed-addresses "$ALLOWED_ADDRESS" \
--keyring-backend os \
-f $SENDER \
--gas-adjustment $GAS_ADJUSTMENT
