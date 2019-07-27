FROM docker.io/node:lts-alpine

ARG SOURCE_TARBALL=https://github.com/lucasbento/graphql-pokemon/tarball/master

ENV SOURCE_DIR=/opt/graphql-pokemon

RUN mkdir ${SOURCE_DIR} \
        && wget -q -O - ${SOURCE_TARBALL} | tar -xvz --strip-components=1 -C ${SOURCE_DIR}

WORKDIR /opt/graphql-pokemon

RUN yarn && yarn run build

CMD yarn start
