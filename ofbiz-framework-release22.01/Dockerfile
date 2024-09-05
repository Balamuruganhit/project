# Use the official OpenJDK image as the base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy OFBiz source files to the container
COPY . /app

# Install Gradle (or use a Gradle wrapper if provided)
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get install git && \
    wget https://services.gradle.org/distributions/gradle-8.0-bin.zip && \
    unzip gradle-8.0-bin.zip && \
    mv gradle-8.0 /opt/gradle && \
    ln -s /opt/gradle/bin/gradle /usr/bin/gradle

# Build the OFBiz application
RUN gradle build

# Expose the port OFBiz runs on
EXPOSE 8080

# Command to start OFBiz (ensure this script is in the built artifacts)
CMD ["sh", "build/install/ofbiz/bin/ofbiz"]