FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy OFBiz files to the container
COPY . /app

# Expose the port OFBiz runs on
EXPOSE 8080

# Command to run OFBiz
CMD ["sh", "ofbiz.sh"]