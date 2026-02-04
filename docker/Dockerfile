# Use official Node.js LTS (Alpine for small size)
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy package files and install dependencies
# Note: only production dependencies to keep image small
COPY package*.json ./
RUN npm install --omit=dev

# Copy all source code
COPY . .

# Expose application port (Juice Shop default is 3000)
EXPOSE 3000

# Default command to start the app
CMD ["npm", "start"]
