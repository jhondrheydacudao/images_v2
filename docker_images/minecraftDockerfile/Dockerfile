# Use the official Minecraft Bedrock image
FROM itzg/minecraft-bedrock-server:latest

# Set environment variables for the server
ENV EULA=TRUE \
    GAMEMODE=survival \
    DIFFICULTY=easy \
    SERVER_NAME="My Bedrock Server" \
    SERVER_PORT=19132 \
    ALLOW_CHEATS=false \
    BEDROCK_VERSION=latest \
    MOTD="Welcome to the server!" \
    LD_LIBRARY_PATH=.

# Expose the necessary port for Bedrock Edition (UDP)
EXPOSE 19132/udp

# Setup the working directory
WORKDIR /data

# Download and extract the server if not already set
RUN if [ ! -f /data/bedrock_server ]; then \
        echo "Downloading Minecraft Bedrock Server..."; \
        curl -L -o bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${BEDROCK_VERSION}.zip && \
        unzip bedrock-server.zip && \
        rm bedrock-server.zip && \
        chmod +x bedrock_server; \
    fi

# Setup the entrypoint to run the Minecraft server
ENTRYPOINT ["./bedrock_server"]

# Run the server when the container starts
CMD ["./bedrock_server"]
