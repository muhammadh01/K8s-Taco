FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install -y \
        nano \
	nginx \
	python3-certbot-nginx \
	cron 

COPY /conf.d/*.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
COPY mySite /var/www/html/mySite
 
EXPOSE 80
EXPOSE 443
EXPOSE 7070

ENTRYPOINT ["nginx"]

CMD ["-g","daemon off;"]
