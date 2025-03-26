# Use the official base image for Minecraft Bedrock Server
FROM itzg/minecraft-bedrock-server:latest

# Set the working directory inside the container
WORKDIR /app/app

# Install necessary dependencies (if not included in the base image)
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    bash \
    && rm -rf /var/lib/apt/lists/*  # Clean up the apt cache to reduce image size

# Copy the configuration and files from your local directory to the container
COPY ./server.properties /app/app/server.properties
COPY ./allowlist.json /app/app/allowlist.json
COPY ./permissions.json /app/app/permissions.json
COPY ./bedrock_server_how_to.html /app/app/bedrock_server_how_to.html
COPY ./Dedicated_Server.txt /app/app/Dedicated_Server.txt
COPY ./packet-statistics.txt /app/app/packet-statistics.txt

# Download the Minecraft Bedrock server version specified in the environment variable
RUN curl -L -o bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${BEDROCK_VERSION}.zip \
    && unzip bedrock-server.zip -d /app/app \
    && rm bedrock-server.zip \
    && chmod +x /app/app/bedrock_server

# Expose Minecraft Bedrock server port (UDP)
EXPOSE 19132/udp

# Ensure server has executable permissions
RUN chmod +x /app/app/bedrock_server

# Command to run Minecraft Bedrock Server
CMD ["./app/bedrock_server"]
