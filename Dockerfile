FROM node:12.16.3

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm install --silent

EXPOSE 3000
