FROM docker.io/library/nextcloud:latest
RUN set -eux; \
    { \
    echo 'redis.session.locking_enabled=1'; \
    echo 'redis.session.lock_retries=-1'; \
    echo 'redis.session.lock_wait_time=10000'; \
    } > /usr/local/etc/php/conf.d/redis-session.ini
