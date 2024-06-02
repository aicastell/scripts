#!/usr/bin/python3

import os

def generate_private_key():
    # Generar 32 bytes aleatorios para la clave privada
    private_key_bytes = os.urandom(32)
    # Convertir los bytes a formato hexadecimal
    private_key_hex = private_key_bytes.hex()
    return private_key_hex

private_key = generate_private_key()
print("Private key: ", private_key)
