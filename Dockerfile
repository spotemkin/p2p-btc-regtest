# Latest version bitcoin for regtest mode
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /bitcoin

RUN wget https://bitcoin.org/bin/bitcoin-core-25.0/bitcoin-25.0-x86_64-linux-gnu.tar.gz \
    && tar -xzvf bitcoin-25.0-x86_64-linux-gnu.tar.gz --strip-components=1 \
    && rm bitcoin-25.0-x86_64-linux-gnu.tar.gz

# Copy and set permissions for the cron script
# COPY bitcoin-generate-block.sh /bitcoin/bitcoin-generate-block.sh
# RUN chmod +x /bitcoin/bitcoin-generate-block.sh

EXPOSE ${BITCOIN_PORT_REG_1}
EXPOSE ${BITCOIN_PORT_REG_2}
EXPOSE ${BITCOIN_PORT_REG_3}

# CMD ["/data/bitcoin-start.sh"]
