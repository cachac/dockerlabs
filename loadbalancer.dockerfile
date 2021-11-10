FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx-loadbalancer.conf .
RUN mv nginx-loadbalancer.conf default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

# docker build . -f loadbalancer.dockerfile -t loadbalancer
# docker run -p 80:80  loadbalancer



