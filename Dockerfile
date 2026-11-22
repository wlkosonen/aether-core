# Use official Node.js image
FROM node:26-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install exactly the tested dependencies (package-lock.json)
RUN npm ci

# Copy application source files
COPY . .

# Build the client spa and bundler server entry point
RUN npm run build

# Expose the standard routing port
EXPOSE 3000

# Start command
CMD ["npm", "start"]
