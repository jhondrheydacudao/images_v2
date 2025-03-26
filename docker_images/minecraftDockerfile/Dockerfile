# Use the official Minecraft Bedrock Server image from itzg
FROM itzg/minecraft-bedrock-server:latest

# Set environment variables for the server
ENV EULA=true
ENV VERSION=latest

# Expose the port for the Minecraft Bedrock Server
EXPOSE 19132/udp

# Set up a volume to persist Minecraft world data
VOLUME ["/data"]

# Set the working directory for the server
WORKDIR /data

# Start the Minecraft server when the container runs
CMD ["start"]
