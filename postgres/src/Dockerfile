FROM postgres:12.1-alpine

ARG POSTGRES_UID=666
ARG POSTGRES_GID=666

COPY init_db.sh  /docker-entrypoint-initdb.d/.

# Forward guest user file permissions
RUN set -x \
      && apk add --update shadow \
      && usermod -u ${POSTGRES_UID} postgres \
      && groupmod -g ${POSTGRES_GID} postgres \
      && rm -rf /var/cache/apk/* \
                /tmp/* \
                /var/tmp/* \
      && chmod 555 /docker-entrypoint-initdb.d/init_db.sh
