FROM docker.io/library/nextcloud:23.0.2
RUN apt-get update && apt-get upgrade -y; \
    apt-get install -y \
        vim \
        curl \
        sudo; \
    apt-get autoclean; \
    rm -rf /var/lib/apt/lists/*
RUN set -eux; \
    { \
    echo 'redis.session.locking_enabled=1'; \
    echo 'redis.session.lock_retries=-1'; \
    echo 'redis.session.lock_wait_time=10000'; \
    } > /usr/local/etc/php/conf.d/redis-session.ini
