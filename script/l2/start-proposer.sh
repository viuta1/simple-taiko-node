#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROPOSER" == "true" ]; then
    if [ -z "${TXPOOL_LOCALS}" ]; then
        taiko-client proposer \
            --l1.ws ${L1_ENDPOINT_WS} \
            --l2.http http://l2_execution_engine:8545 \
            --taikoL1 ${TAIKO_L1_ADDRESS} \
            --taikoL2 ${TAIKO_L2_ADDRESS} \
            --l1.proposerPrivKey ${L1_PROPOSER_PRIVATE_KEY} \
            --l2.suggestedFeeRecipient ${L2_SUGGESTED_FEE_RECIPIENT} \
            --minimalBlockGasLimit "5000000"
    else
        taiko-client proposer \
            --l1.ws ${L1_ENDPOINT_WS} \
            --l2.http http://l2_execution_engine:8545 \
            --taikoL1 ${TAIKO_L1_ADDRESS} \
            --taikoL2 ${TAIKO_L2_ADDRESS} \
            --l1.proposerPrivKey ${L1_PROPOSER_PRIVATE_KEY} \
            --l2.suggestedFeeRecipient ${L2_SUGGESTED_FEE_RECIPIENT} \
            --txpool.locals ${TXPOOL_LOCALS} \
            --txpool.localsOnly \
            --minimalBlockGasLimit "5000000"
    fi
else
    sleep infinity
fi
