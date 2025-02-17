# Use official Node.js 18 image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Build the application
RUN npm run build

# Generate Prisma client
RUN npx prisma generate

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
