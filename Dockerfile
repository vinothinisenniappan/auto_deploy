FROM nginx:alpine
COPY *.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/styles.css