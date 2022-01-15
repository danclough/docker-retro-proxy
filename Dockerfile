FROM node:alpine
RUN apk add --no-cache git \
    && git clone https://github.com/DrKylstein/retro-proxy.git /proxy \
    && cd /proxy \
    && yarn install \
    && cp example.env .env
WORKDIR /proxy
CMD ["yarn","start"]