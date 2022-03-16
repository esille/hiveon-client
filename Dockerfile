FROM node:12-alpine

ENV ETH_WALLET "your wallet"
ENV INFLUX_DB_TOKEN "your influx db cloud token"
ENV INFLUX_DB_ORG "your influx db cloud org"
ENV INTERVAL "60000"
ENV INFLUX_DB_BUCKET "hiveon-earning"
ENV INFLUX_DB_URL "https://us-east-1-1.aws.cloud2.influxdata.com"

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .

CMD [ "node", "index.js" ]