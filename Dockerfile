FROM node:alpine

WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

# from prvious sytage copy take inputs

COPY --from=0 /app/build /usr/share/nginx/html