# Extending image
FROM node:latest
FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm  
RUN apt-get -y install autoconf automake libtool nasm make pkg-config git apt-utils

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Versions
RUN npm -v
RUN node -v

# Install app dependencies
COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/

RUN npm install

# Bundle app source
COPY . /usr/src/app

# Port to listener
EXPOSE 3000

# Environment variables
ENV NODE_ENV production
ENV PORT 3000
ENV PUBLIC_PATH "/"

RUN npm run build

# Main command
CMD [ "npm", "run", "start" ]