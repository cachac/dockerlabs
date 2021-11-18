FROM nginx

WORKDIR /usr/share/nginx/html

COPY Hello_docker.html /usr/share/nginx/html

RUN cp Hello_docker.html index.html

CMD nginx -g 'daemon off;'

#CMD ["nginx", "-g", "daemon off;"]

