FROM node:14.12.0

ENV APP_ROOT /src

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}

COPY package.json ${APP_ROOT}
RUN npm install

ADD . ${APP_ROOT}
RUN npm run build

ENV HOST 0.0.0.0
