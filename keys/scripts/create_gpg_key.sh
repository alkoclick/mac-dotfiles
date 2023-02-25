#!/usr/bin/env bash

gpg --batch --gen-key <<EOF
  Key-Type: DSA
  Key-Length: 3072
  Subkey-Type: ECDSA
  Subkey-Curve: nistp256
  Subkey-Length: 3072
  Name-Real: $NAME
  Name-Comment: $ID
  Name-Email: $EMAIL
  Passphrase: $PASSPHRASE
  Expire-Date: 365
EOF
