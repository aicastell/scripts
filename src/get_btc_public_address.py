#! /usr/bin/python3

import sys
import ecdsa

def private_key_to_public_key(private_key_hex):
    private_key_bytes = bytes.fromhex(private_key_hex)
    private_key = ecdsa.SigningKey.from_string(private_key_bytes, curve=ecdsa.SECP256k1)
    public_key = private_key.verifying_key.to_string("compressed")
    return public_key.hex()

if len(sys.argv) != 2:
    print("Error: Provide the private key as input argument (hex format)")
    print("Use: get_btc_private_address.py <private_key_hex>")
    sys.exit(1)

private_key_hex = sys.argv[1]
public_key = private_key_to_public_key(private_key_hex)
print("Public key compressed:", public_key)
