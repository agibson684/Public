#!/bin/bash

DIR="$(dirname "${BASH_SOURCE[0]}")"

gpg \
  --no-default-keyring \
  --keyring "${DIR}/pillar_pub.key" \
  --trust-model always \
  --encrypt \
  --armor \
  --recipient "Salt Pillar"
