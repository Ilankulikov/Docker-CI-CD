FROM node:15-alpine

WORKDIR /bootcamp-app
COPY . .
RUN npm install

EXPOSE 8080

CMD npm run initdb && npm run dev
