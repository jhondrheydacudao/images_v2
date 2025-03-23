# Use the official Minecraft Bedrock server image from itzg
FROM itzg/minecraft-bedrock-server:latest

# Set environment variables for server configuration
ENV EULA=TRUE
ENV GAMEMODE=survival
ENV DIFFICULTY=easy
ENV SERVER_NAME="My Bedrock Server"
ENV SERVER_PORT=19132
ENV ALLOW_CHEATS=false

# Expose the Minecraft Bedrock server port (UDP 19132)
EXPOSE 19132/udp

# Copy the pre-configured server.properties file into the container's Minecraft directory
COPY server.properties /data/

# If you have an allowlist.json file, copy it to the container as well (optional)
# COPY allowlist.json /data/  # Uncomment if you're using a whitelist

# Set the working directory to where the Minecraft Bedrock server is located
WORKDIR /data

# The Minecraft server will run the 'bedrock_server' file as the entry point
CMD ["./bedrock_server"]
