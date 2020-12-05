#! /bin/sh

if [ $# -ne 1 ]; then
    echo "Missing wallet address"
    exit
fi

BTC="0.0"
WALLET_ADDRESS=$1
SATOSHIS=$(wget -qO- blockchain.info/rawaddr/${WALLET_ADDRESS} | jq .final_balance)

if [[ $SATOSHIS ]]; then
    BTC=$(echo "$SATOSHIS / 100000000" | bc -l)
fi

echo "Wallet $WALLET_ADDRESS has $BTC BTC"

