# Use the official Minecraft Bedrock server image
FROM itzg/minecraft-bedrock-server

# Set working directory inside the container
WORKDIR /data

# Ensure required directories exist
VOLUME [ "/data" ]

# Expose Bedrock server port
EXPOSE 19132/udp

# Start the server (this will generate the files automatically)
CMD ["./bedrock_server"]
