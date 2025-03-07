FROM nginx:alpine
RUN echo "<h1>Hello, I am from $APP</h1>" > /usr/share/nginx/html/index.html
# ENV APP=app-1