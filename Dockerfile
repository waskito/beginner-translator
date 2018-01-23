FROM mhart/alpine-node:6.11.2

LABEL author="Yanuar Waskito <jegu@kulina.id>"

# ENV TERM=dumb \
#     BUILD_DEPS='git make g++ gcc binutils-gold python'

ADD . /api
# apk add --update ${BUILD_DEPS} && \
RUN cd /api && \
    npm install -g pm2 && \
    npm install && \
    # apk del ${BUILD_DEPS} && \
    rm -rf /tmp/* /var/cache/apk/* /root/.node-gyp

ENV PORT=${PORT}
ENV DEBUG=http

WORKDIR /api
# pm2 start -f ./bin/server.js --name catalogue -i 0 --no-daemon
# ENV NODE_PATH=./src
CMD ["npm", "start"]

