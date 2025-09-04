# Use the official Node.js image as a base
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the Medusa backend
RUN npm run build

# Expose the port your application will run on
EXPOSE 9000

# Command to run the Medusa server
CMD ["npm", "run", "start"]