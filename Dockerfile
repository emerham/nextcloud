FROM docker.io/library/nextcloud:23.0.0
RUN apt-get update && apt-get upgrade -y; \
    apt-get install -y \
        vim \
        curl; \
    apt-get autoclean; \
    rm -rf /var/lib/apt/lists/*
RUN set -eux; \
    { \
    echo 'redis.session.locking_enabled=1'; \
    echo 'redis.session.lock_retries=-1'; \
    echo 'redis.session.lock_wait_time=10000'; \
    } > /usr/local/etc/php/conf.d/redis-session.ini
