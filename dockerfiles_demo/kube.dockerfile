### STAGE 1: Build ###
FROM node:14.11.0-alpine3.12 as build

WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json
RUN npm install --silent

COPY . /usr/src/app
RUN npm run generate --fail-on-error
RUN npm prune --production

### STAGE 2: NGINX ###
FROM nginx:stable-alpine as release
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]

# docker build . -f prod.dockerfile -t dockerlabs
# docker run -p 80:8080  dockerlabs:latest
