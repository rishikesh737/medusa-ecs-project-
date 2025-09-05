# Use the official Node.js image as a base
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the Medusa backend and expose the port
RUN npm run build
EXPOSE 9000

# Command to run the Medusa server and migrations
CMD ["npm", "run", "start"]