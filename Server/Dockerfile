# Define the docker hub image: https://hub.docker.com/_/node/
FROM node:14.10.1-alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
COPY tsconfig.json /usr/src/app/
COPY tslint.json /usr/src/app/
RUN npm install

# Bundle app source
COPY src /usr/src/app/src

RUN npm run build

CMD [ "npm", "start" ]

