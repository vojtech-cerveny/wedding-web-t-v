FROM nginx:1.27-alpine

# Static site (index.html, icon.png, svatebni.apk)
COPY public/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
