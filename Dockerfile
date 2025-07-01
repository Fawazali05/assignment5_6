# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy both frontend and backend
COPY backend backend/
COPY frontend frontend/

# Install backend dependencies
WORKDIR /app/backend
RUN npm install

# Install static file server
RUN npm install -g serve

# Return to app root
WORKDIR /app

# Expose backend and frontend ports
EXPOSE 5000
EXPOSE 3000

# Start backend on 5000 and frontend on 3000
CMD sh -c "node backend/index.js & serve -s frontend -l 3000"
