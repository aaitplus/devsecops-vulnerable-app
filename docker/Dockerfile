# Use official Node.js LTS
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy app source code
COPY . .

# Expose app port
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
