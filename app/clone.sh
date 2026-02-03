#!/bin/bash

# Clone OWASP Juice Shop repository
# This script downloads the source code for the intentionally vulnerable application
# Security Note: This app is used for training purposes only. Never deploy in production.

set -euo pipefail  # Exit on error, undefined vars, and pipe failures

# Function to log errors and exit
error_exit() {
    echo "ERROR: $1" >&2
    exit 1
}

# Check if git is installed with version validation
if ! command -v git &> /dev/null; then
    error_exit "Git is not installed. Please install git first."
fi

# Check Git version (minimum 2.30.0)
GIT_VERSION=$(git --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
if [ -n "$GIT_VERSION" ] && ! [ "$(printf '%s\n' "$GIT_VERSION" "2.30.0" | sort -V | head -n1)" = "2.30.0" ]; then
    error_exit "Git version $GIT_VERSION is too old. Please upgrade to Git 2.30.0 or later."
fi

# Check if we're in the correct directory
if [ ! -d "../docker" ] || [ ! -d "../k8s" ]; then
    error_exit "This script must be run from the app/ directory within the project structure."
fi

# Check if directory is empty (to avoid overwriting existing files)
if [ "$(ls -A .)" ]; then
    echo "WARNING: Directory is not empty. Existing files may be overwritten."
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
fi

# Check internet connectivity with fallback methods
INTERNET_OK=false
if ping -c 1 github.com &> /dev/null; then
    INTERNET_OK=true
elif curl -s --max-time 5 https://github.com > /dev/null; then
    INTERNET_OK=true
elif wget -q --spider --timeout=5 https://github.com; then
    INTERNET_OK=true
fi

if [ "$INTERNET_OK" = false ]; then
    error_exit "No internet connection detected. Please check your network connection."
fi

# Check available disk space (minimum 500MB for Juice Shop)
AVAILABLE_SPACE=$(df . | tail -1 | awk '{print $4}')
if [ "$AVAILABLE_SPACE" -lt 512000 ]; then  # 500MB in KB
    error_exit "Insufficient disk space. At least 500MB free space required for Juice Shop."
fi

echo "Cloning OWASP Juice Shop repository..."
if ! git clone https://github.com/juice-shop/juice-shop.git .; then
    error_exit "Failed to clone OWASP Juice Shop repository. Please check your internet connection and permissions."
fi

# Verify the clone was successful and contains expected files
if [ ! -f "package.json" ] || [ ! -d "routes" ]; then
    error_exit "Cloned repository appears to be incomplete or corrupted."
fi

echo "Successfully cloned OWASP Juice Shop."
echo "Note: This is an intentionally vulnerable application for security training."
echo "Next steps:"
echo "1. Run 'npm install' to install dependencies"
echo "2. Use the Docker build script in ../scripts/build.sh for containerized deployment"
