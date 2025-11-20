# Use an official Node.js runtime
FROM node:18-alpine

# Create app directory
WORKDIR /usr/app

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install --production

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 3001

# Start the app
CMD [ "npm", "start" ]
