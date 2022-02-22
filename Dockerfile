FROM node:14-alpine

RUN apk update; \
    mkdir /app; \
    chown -R node:node /app

COPY --chown=node:node . /app

WORKDIR /app

USER node

RUN npm install

EXPOSE 5000

CMD sh docker-entrypoint.sh