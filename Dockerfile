# Stage 1: Build the Medusa application
FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the Medusa backend. This is the memory-intensive part.
# The result of this build will be a /dist folder.
RUN npm run build

# Stage 2: Create a lightweight runtime image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app/.env.template ./
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/src/scripts ./src/scripts
COPY --from=builder /app/src/migrations ./src/migrations

# Expose the port your application will run on
EXPOSE 9000

# Command to run the Medusa server and migrations
# The start command will run migrations, start the server, and connect to the database
CMD ["npm", "run", "start"]