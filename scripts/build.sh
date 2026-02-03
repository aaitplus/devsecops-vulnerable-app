if ! command -v docker &> /dev/null; then
    error_exit "Docker is not installed or not in PATH. Please install Docker first."
fi

if ! command -v curl &> /dev/null; then
    error_exit "curl is not installed. Please install curl first."
fi
=======
# Check prerequisites with version validation
echo "Checking prerequisites..."

# Check Docker
if ! command -v docker &> /dev/null; then
    error_exit "Docker is not installed or not in PATH. Please install Docker first."
fi

# Check Docker version (minimum 20.10.0)
DOCKER_VERSION=$(docker --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
if ! [ "$(printf '%s\n' "$DOCKER_VERSION" "20.10.0" | sort -V | head -n1)" = "20.10.0" ]; then
    error_exit "Docker version $DOCKER_VERSION is too old. Please upgrade to Docker 20.10.0 or later."
fi

# Check curl
if ! command -v curl &> /dev/null; then
    error_exit "curl is not installed. Please install curl first."
fi

# Check Node.js (for local development)
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version | sed 's/v//')
    if ! [ "$(printf '%s\n' "$NODE_VERSION" "16.0.0" | sort -V | head -n1)" = "16.0.0" ]; then
        echo "WARNING: Node.js version $NODE_VERSION detected. Recommended: 18.x LTS"
    fi
fi

# Check available disk space (minimum 2GB)
AVAILABLE_SPACE=$(df / | tail -1 | awk '{print $4}')
if [ "$AVAILABLE_SPACE" -lt 2097152 ]; then  # 2GB in KB
    error_exit "Insufficient disk space. At least 2GB free space required."
fi
