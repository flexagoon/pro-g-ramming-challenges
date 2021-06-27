#!/usr/bin/env python

# The cryptography part of the code is just stolen from here:
# https://www.geeksforgeeks.org/encrypt-and-decrypt-files-using-python

# This script depends on cryptography and requests
# Please install it with `pip install cryptography requests`
from cryptography.fernet import Fernet
from os.path import exists
import sys, requests, urllib

def encrypt():
    fpath = input("Enter your file path: ")

    if not exists(fpath):
        print("File doesn't exist!")
        sys.exit()

    key = Fernet.generate_key()
    fernet = Fernet(key)

    with open(fpath, 'rb') as file:
        original = file.read()

    enc = fernet.encrypt(original)

    with open('encrypted-'+fpath, 'wb') as efile:
        efile.write(enc)

    files = {
        'file': ('encrypted-'+fpath, open('encrypted-'+fpath, 'rb')),
    }

    upreq = requests.post('http://0x0.st/', files=files)

    print("Path to your file:")
    print(upreq.text)
    print("Decryption key:")
    print(key.decode())

def decrypt():
    furl = input("Enter file URL: ")

    try:
        enc = requests.get(furl).content
    except:
        print("Wrong file URL!")
        sys.exit()

    key = input("Enter your key: ")

    try:
        fernet = Fernet(key)
        dec = fernet.decrypt(enc)
    except:
        print("Incorrect key!")
        sys.exit()

    print("File successfully decrypted!")
    fname = input("Enter decrypted file name: ")

    with open(fname, 'wb') as file:
        file.write(dec)

choice = input("Do you want to encrypt or decrypt? (e/d): ")
if choice == "e":
    encrypt()
elif choice == "d":
    decrypt()
else:
    print("Incorrect choice!")
