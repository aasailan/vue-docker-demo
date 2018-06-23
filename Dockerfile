FROM node:8.11.2
RUN apt-get clean && apt-get update && apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN npm install -g nrm \
&& nrm use taobao \
&& npm install \
&& npm run build \
&& cp -r dist/* /var/www/html \
&& rm -rf /app
CMD ["nginx","-g","daemon off;"]