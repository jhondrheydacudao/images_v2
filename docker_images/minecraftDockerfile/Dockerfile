# Use the official base image for Minecraft Bedrock Server
FROM itzg/minecraft-bedrock-server:latest

# Set the working directory inside the container
WORKDIR /mnt/server

# Install necessary dependencies (if not included in the base image)
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    bash

# Copy the configuration and files from your local directory to the container
COPY server.properties /mnt/server/server.properties

# Download the Minecraft Bedrock server version specified in the environment variable
RUN curl -L -o bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${BEDROCK_VERSION}.zip && \
    unzip bedrock-server.zip -d /mnt/server && \
    rm bedrock-server.zip && \
    chmod +x /mnt/server/bedrock_server

# Set environment variables as defined in your configuration
ENV EULA=TRUE \
    GAMEMODE=survival \
    DIFFICULTY=easy \
    SERVER_NAME="My Bedrock Server" \
    SERVER_PORT=19132 \
    ALLOW_CHEATS=false \
    BEDROCK_VERSION=latest \
    MOTD="Welcome to the server!"

# Expose Minecraft Bedrock server port (UDP)
EXPOSE 19132/udp

# Copy all your required files such as allowlist.json, permissions.json, etc.
COPY allowlist.json /mnt/server/allowlist.json
COPY permissions.json /mnt/server/permissions.json
COPY server.properties /mnt/server/server.properties
COPY bedrock_server_how_to.html /mnt/server/bedrock_server_how_to.html
COPY Dedicated_Server.txt /mnt/server/Dedicated_Server.txt
COPY packet-statistics.txt /mnt/server/packet-statistics.txt

# Ensure server has executable permissions
RUN chmod +x /mnt/server/bedrock_server

# Command to run Minecraft Bedrock Server
CMD ["./bedrock_server"]
