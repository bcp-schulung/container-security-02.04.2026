FROM alpine:3.23.3

RUN set -eux; \
    apk upgrade --no-cache; \
    apk add --no-cache nginx

RUN addgroup -S nginx || true
RUN adduser -S -D -H -h /var/lib/nginx -s /sbin/nologin -G nginx nginx || true
RUN mkdir -p /run/nginx /var/lib/nginx/html /etc/nginx/http.d /tmp/client_temp /tmp/proxy_temp /tmp/fastcgi_temp /tmp/uwsgi_temp /tmp/scgi_temp
RUN chown -R nginx:nginx /var/lib/nginx /run/nginx /tmp /etc/nginx
RUN rm -f /etc/nginx/http.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/http.d/default.conf
COPY index.html /var/lib/nginx/html/index.html

USER nginx:nginx

EXPOSE 8080

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
