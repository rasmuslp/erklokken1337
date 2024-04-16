# NB: Node images have default user called 'node' and home dir at '/home/node'

### Build
FROM node:lts-alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY eslint.config.js astro.config.mjs tailwind.config.cjs tsconfig.json ./
COPY public public
COPY src src

RUN npm run build

### Runtime
FROM httpd:2.4.58-alpine AS runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/
EXPOSE 80
