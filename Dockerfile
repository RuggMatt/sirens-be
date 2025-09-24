FROM node:lts-alpine
RUN apk add --no-cache musl musl-utils musl-locales tzdata
ENV TZ=America/Edmonton
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
EXPOSE 3000
USER node
WORKDIR /app
COPY --chown=node package.json package-lock.json .

RUN npm i

COPY --chown=node . . 

CMD node app.js
