FROM node:hydrogen-alpine

USER node

WORKDIR /frontend

COPY --chown=node frontend .
RUN npm install
RUN npm run build

WORKDIR /backend

COPY --chown=node backend .
RUN npm install

EXPOSE 8080

CMD ["node", "src/main.js", "--dist", "/frontend/"]
