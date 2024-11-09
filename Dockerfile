# Use one base image
FROM eclipse-temurin:17-jre

LABEL Author="it4innov.fr"

# Set build argument for version
ARG VERSION=1

# Set up the working directory
WORKDIR /app

# Install necessary packages and create user
RUN apt-get update -y && \
    apt-get install -y bash && \
    groupadd it4innov && \
    useradd --home /home/it4innov --create-home -g it4innov --shell /bin/bash it4innov && \
    chmod -R 755 /home/it4innov

# Set user permissions
USER it4innov

# Copy the application JAR file
COPY ./target/code-frontend-1.0.2-SNAPSHOT-runner.jar code-frontend.jar

# Expose port 8080
EXPOSE 8080

# Set entrypoint or command as needed
CMD ["java", "-jar", "code-frontend.jar"]
