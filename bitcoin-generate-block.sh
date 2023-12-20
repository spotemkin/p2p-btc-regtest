#!/bin/sh
# bitcoin-generate-block.sh
while true; do
  echo "Generating a new block..."
  block_hash=$(/bitcoin/bin/bitcoin-cli -regtest -generate 1)
  echo "$block_hash"
  sleep 60
done