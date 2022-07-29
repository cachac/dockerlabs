### STAGE 1: Build ###
FROM node:latest as build

WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json
RUN npm install --silent

COPY . /usr/src/app
RUN npm run generate --fail-on-error
RUN npm prune --production

# docker build . -f base.dockerfile -t cachac/dockerlabs_base:node14
# docker push  cachac/dockerlabs_base:node14
