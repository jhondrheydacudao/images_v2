# Use the official Minecraft Bedrock server image
FROM itzg/minecraft-bedrock-server:latest

# Set the working directory
WORKDIR /data

# Set environment variables for the Minecraft server configuration
ENV EULA=TRUE
ENV GAMEMODE=survival
ENV DIFFICULTY=easy
ENV SERVER_NAME="My Bedrock Server"
ENV SERVER_PORT=19132
ENV ALLOW_CHEATS=false
ENV MOTD="Welcome to the server!"
ENV BEDROCK_VERSION=latest

# Automatically generate the server.properties if not already present
RUN if [ ! -f "/data/server.properties" ]; then \
      echo "Generating server.properties with default values..."; \
      echo "server-name=${SERVER_NAME}" > /data/server.properties; \
      echo "gamemode=${GAMEMODE}" >> /data/server.properties; \
      echo "difficulty=${DIFFICULTY}" >> /data/server.properties; \
      echo "server-port=${SERVER_PORT}" >> /data/server.properties; \
      echo "allow-cheats=${ALLOW_CHEATS}" >> /data/server.properties; \
      echo "motd=${MOTD}" >> /data/server.properties; \
      echo "eula=${EULA}" >> /data/server.properties; \
    fi

# Expose necessary ports for the Minecraft server
EXPOSE 19132/udp

# Copy pre-configured server properties if they exist in the build context
COPY server.properties /data/server.properties

# Set the default command to run the Minecraft Bedrock server
CMD ["./bedrock_server"]
