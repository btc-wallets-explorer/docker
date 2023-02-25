FROM node:hydrogen-alpine

WORKDIR /app

COPY backend/package*.json ./
RUN npm install

COPY backend .

EXPOSE 8080
USER node

CMD ["node", "src/main-server.js"]
