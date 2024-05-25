# Use a lightweight Alpine image
FROM alpine:latest

# Install dependencies
RUN apk add --no-cache wget unzip

# Set the working directory inside the container
WORKDIR /app

# Download and unzip PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.9.0/pocketbase_0.9.0_linux_amd64.zip && \
    unzip pocketbase_0.9.0_linux_amd64.zip && \
    rm pocketbase_0.9.0_linux_amd64.zip

# Expose the necessary port
EXPOSE 8090

# Command to run PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
