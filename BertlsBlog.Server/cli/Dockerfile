FROM wordpress:cli
USER root
RUN apk add --no-cache openssl bash
ENV DOCKERIZE_VERSION v0.5.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
WORKDIR /scripts
COPY . .

CMD dockerize -wait tcp://db:3306 -timeout 300s -wait-retry-interval 5s ./entrypoint.sh