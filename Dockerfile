FROM node:alpine as develop
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=develop /app/build /usr/share/nginx/html


