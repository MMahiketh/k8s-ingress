FROM nginx:alpine
RUN echo "<h1>Hello, I am from $APP</h1>"
ENV APP=app-1