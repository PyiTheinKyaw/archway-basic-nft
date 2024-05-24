#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 5 ]; then
    echo "Usage: ./instantiate_archway.sh <contract_name> <code_id> <contract_admin_to_set> <instantiator> <gas_adjustment>"
    exit 1
fi

# Assign input arguments to variables
CONTRACT_NAME="$1"
CODE_ID="$2"
CONTRACT_ADMIN_NAME="$3"
INSTANTIATOR_NAME="$4"
GAS_ADJUSTMENT="$5"

CONTRACT_ADMIN_ADDRESS=$(archway accounts get $CONTRACT_ADMIN_NAME --address)
INSTANTIATOR_ADDRESS=$(archway accounts get $INSTANTIATOR_NAME --address)

archway contracts instantiate $CONTRACT_NAME \
--json \
--log-level debug \
--admin "$CONTRACT_ADMIN_ADDRESS" \
--label "$CONTRACT_NAME" \
--code "$CODE_ID" \
--args-file "scripts/genesis.json" \
--keyring-backend os \
-f $INSTANTIATOR_ADDRESS \
--gas-adjustment $GAS_ADJUSTMENT
