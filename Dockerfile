FROM alpine:3.13.5

RUN apk update; \
    apk add --update nodejs npm curl

RUN mkdir /app
ADD . /app/

WORKDIR /app

RUN npm install

EXPOSE 5000

CMD node server.js