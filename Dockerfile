# Base image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

#Copy config file and set JsonWebToken secret key
RUN cp src/config.ts.example src/config.ts

# Start application
EXPOSE 3000
CMD [ "npm", "start" ]
