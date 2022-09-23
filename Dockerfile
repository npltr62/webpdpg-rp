FROM nginx:stable-alpine
LABEL maintainer="Nicolas PELLETIER"
COPY /nginx/build.conf /etc/nginx/conf.d/nginx.conf
RUN apk update && \
    apk add apache2-utils
RUN htpasswd -b -c /etc/nginx/conf.d/.htpasswd admin nicolas
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]