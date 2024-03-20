# Use the official Node.js as a parent image
FROM node:lts-alpine3.19

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to utilize Docker cache
COPY package*.json ./

# Install app dependencies
RUN npm install 

# Bundle app source
COPY . .

# Your app binds to port 3000, so expose this port
EXPOSE 3001

# Run the app
CMD ["node", "./bin/www"]
