FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY nginx-loadbalancer.conf .
RUN rm /etc/nginx/conf.d/default.conf
RUN mv nginx-loadbalancer.conf default.conf

ARG PORT

EXPOSE $PORT

CMD ["nginx", "-g", "daemon off;"]

# docker build . -f prod.dockerfile --build-arg PORT=8080 -t multiapp:8080
# docker run -p 80:8080  multiapp:v1

# docker build . -f loadbalancer.dockerfile -t loadbalancer
# docker run --name loadbalancer -dp 80:80  loadbalancer



