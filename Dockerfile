# Latest version bitcoin for regtest mode
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    wget \
    tar \
    cron \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /bitcoin

RUN wget https://bitcoin.org/bin/bitcoin-core-25.0/bitcoin-25.0-x86_64-linux-gnu.tar.gz \
    && tar -xzvf bitcoin-25.0-x86_64-linux-gnu.tar.gz --strip-components=1 \
    && rm bitcoin-25.0-x86_64-linux-gnu.tar.gz

# Create a cron job
RUN echo "* * * * * root /bitcoin/bin/bitcoin-cli -regtest -generate 1 >> /var/log/cron.log 2>&1" > /etc/cron.d/bitcoin-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/bitcoin-cron

# Apply cron job
RUN crontab /etc/cron.d/bitcoin-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

EXPOSE ${BITCOIN_PORT_REG_1}
EXPOSE ${BITCOIN_PORT_REG_2}
EXPOSE ${BITCOIN_PORT_REG_3}

CMD cron && tail -f /var/log/cron.log & /bitcoin/bin/bitcoind
