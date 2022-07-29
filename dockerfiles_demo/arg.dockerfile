FROM nginx

ARG AUTOR

ENV AUTOR=$AUTOR

WORKDIR /usr/share/nginx/html

COPY Hello_docker.html .

RUN sed -e s/Docker/"$AUTOR"/ Hello_docker.html > index.html ;

CMD ["nginx", "-g", "daemon off;"]
