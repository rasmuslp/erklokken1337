# NB: Node images have default user called 'node' and home dir at '/home/node'

### Build
FROM node:lts-alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

# COPY client-web/.eslintrc.json client-web/config-overrides.js client-web/tsconfig.json client-web/tsconfig.eslint.json ./
COPY public public
COPY src src

RUN npm run build

### Runtime
FROM httpd:2.4.57-alpine AS runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/
EXPOSE 80
