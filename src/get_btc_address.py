#!/usr/bin/env python3

import hashlib
import base58
import sys
from Crypto.Hash import RIPEMD160

def ripemd160(x):
    d = RIPEMD160.new()
    d.update(x)
    return d

if len(sys.argv) != 2:
    print("Missing public key")
    sys.exit()

public_key = bytes.fromhex(sys.argv[1])
sha256 = hashlib.sha256(public_key).digest()
ripemd160_hash = ripemd160(sha256).digest()
network_byte = b'\x00'
step3 = network_byte + ripemd160_hash
step4 = hashlib.sha256(step3).digest()
step5 = hashlib.sha256(step4).digest()
checksum = step5[:4]
address = base58.b58encode(step3 + checksum)
print(f"Bitcoin address: {address.decode()}")
