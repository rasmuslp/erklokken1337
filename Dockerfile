# NB: Node images have default user called 'node' and home dir at '/home/node'

### Build
FROM node:25-alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY eslint.config.js astro.config.mjs tsconfig.json ./
COPY public public
COPY src src

RUN npm run build

### Runtime
FROM nginx:1.29.1-alpine-slim AS runtime
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
