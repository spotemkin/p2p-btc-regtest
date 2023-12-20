#!/bin/sh
# bitcoin-generate-block.sh
while true; do
  echo "Generating a new block..."
  block_hash=$(/bitcoin/bin/bitcoin-cli -regtest -generate 1)
  echo "$(date): Generated block hash: $block_hash" >> /bitcoin/bitcoin-block-gen.log
  sleep 60
done