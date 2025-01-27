# Use Node.js as the base image
FROM node:18

# Set the working directory
WORKDIR /app

# Install a lightweight HTTP server
RUN npm install -g http-server

# Copy React build files to container
COPY ./build /app

# Expose port 3000
EXPOSE 4000

# Start the HTTP server
CMD ["http-server", "-p", "4000"]

