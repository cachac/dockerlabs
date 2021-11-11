### STAGE 1: Build ###
FROM node:14.11.0-alpine3.12 as build

WORKDIR /usr/src/app

ARG NUXT_ENV_APP
ENV NUXT_ENV_APP=$NUXT_ENV_APP

COPY package.json /usr/src/app/package.json
RUN npm install --silent

COPY . /usr/src/app
RUN npm run generate --fail-on-error
RUN npm prune --production

### STAGE 2: NGINX ###
FROM nginx:stable-alpine
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]

# docker build . -f multi.dockerfile -t multidocker:v1 --build-arg NUXT_ENV_APP=v1
# docker build . -f multi.dockerfile -t multidocker:v2 --build-arg NUXT_ENV_APP=v2
# docker build . -f multi.dockerfile -t multidocker:v3 --build-arg NUXT_ENV_APP=v3

# docker run --name multidocker_v1 --network lab --ip 10.0.0.3 -dp 8080:8080 multidocker:v1
# docker run --name multidocker_v2 --network lab --ip 10.0.0.4 -dp 8081:8080 multidocker:v2
# docker run --name multidocker_v3 --network lab --ip 10.0.0.5 -dp 8082:8080 multidocker:v3
