#!/bin/ash

# Colors for output
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

# Function to print messages with colors
log_success() {
    echo -e "${GREEN}[SUCCESS] $1${RESET}"
}

log_warning() {
    echo -e "${YELLOW}[WARNING] $1${RESET}"
}

log_error() {
    echo -e "${RED}[ERROR] $1${RESET}"
}

# Clean up temp directory
echo "⏳ Cleaning up temporary files..."
if rm -rf /app/app/tmp/*; then
    log_success "Temporary files removed successfully."
else
    log_error "Failed to remove temporary files."
    exit 1
fi

# Start Nginx
echo "⏳ Starting Nginx..."
if [ -f /app/app/nginx/nginx.conf ]; then
    if /usr/sbin/nginx -c /app/app/nginx/nginx.conf -p /app/app/; then
        log_success "Nginx started successfully."
    else
        log_error "Failed to start Nginx."
        exit 1
    fi
else
    log_error "Nginx configuration file not found at /app/app/nginx/nginx.conf."
    exit 1
fi

# Final success message
log_success "Web server is running. Nginx started successfully."

# Keep the container running (this is optional depending on your container setup)
tail -f /dev/null
