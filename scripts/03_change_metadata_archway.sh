#!/bin/bash
# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: ./change_metadata_archway.sh <contract_name> <owner_name> <administrator> <gas_adjustment>"
    exit 1
fi

# Assign input arguments to variables
CONTRACT_NAME="$1"
OWNER_NAME="$2"
ADMINISTRATOR="$3"
GAS_ADJUSTMENT="$4"

OWNER_ADDRESS=$(archway accounts get $OWNER_NAME --address)
ADMIN_ADDRESS=$(archway accounts get $ADMINISTRATOR --address)

# Configuring the deployed contract (Change Admin, Add reward address)
archway contracts metadata "$CONTRACT_NAME" \
	--json \
	--log-level debug \
	--owner-address $OWNER_ADDRESS \
	--rewards-address $OWNER_ADDRESS \
	--keyring-backend os \
	--gas-adjustment $GAS_ADJUSTMENT\
	-f $ADMIN_ADDRESS
