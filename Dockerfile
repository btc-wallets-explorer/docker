FROM node:hydrogen-alpine AS frontend-builder
USER node
WORKDIR /frontend

COPY --chown=node frontend .
RUN npm install
RUN npm run build


FROM node:hydrogen-alpine AS backend-builder
USER node
WORKDIR /backend

COPY --chown=node backend .
RUN npm install


FROM node:hydrogen-alpine AS runner
USER node

COPY --from=frontend-builder /frontend/dist /frontend-dist
COPY --from=backend-builder /backend /backend

WORKDIR /backend

EXPOSE 8080

CMD ["node", "src/main.js", "--dist", "/frontend-dist",  "--wallets", "/wallets.json", "--settings", "/settings.json"]
