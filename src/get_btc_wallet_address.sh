#! /bin/sh

if [ $# -ne 1 ]; then
    echo "Missing public key"
    exit
fi

NETWORK_BYTE="00"
PUBLIC_KEY=$1
STEP3=$(echo -ne $PUBLIC_KEY | xxd -r -p | openssl ripemd160 | awk '{print $2}')
STEP4=${NETWORK_BYTE}${STEP3}
STEP5=$(echo -ne $STEP4 | xxd -r -p | sha256sum | awk '{print $1}')
STEP6=$(echo -ne $STEP5 | xxd -r -p | sha256sum | awk '{print $1}')
STEP7=$(echo -ne $STEP6 | cut -b 1-8)
STEP8=$(echo -ne $STEP4$STEP7)
STEP9=$(echo -ne $STEP8 | xxd -r -p | base58)

echo "Wallet address: $STEP9"

