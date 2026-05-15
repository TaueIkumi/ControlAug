#!/bin/bash

# Docker Setup Script for ControlAug
# This script helps set up Docker containers for ControlAug

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== ControlAug Docker Setup ===${NC}\n"

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker is not installed. Please install Docker first.${NC}"
    exit 1
fi

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    exit 1
fi

# Check if nvidia-docker is available
if ! command -v nvidia-docker &> /dev/null; then
    echo -e "${YELLOW}nvidia-docker is not installed. Installing nvidia-docker...${NC}"
    # Installation instructions would go here
fi

echo -e "${BLUE}Building Docker images...${NC}\n"

# Build all images
docker-compose build

echo -e "${GREEN}✓ Docker images built successfully!${NC}\n"

echo -e "${BLUE}Available containers:${NC}"
echo -e "  - ${GREEN}controlaug_clip${NC}: CLIP environment"
echo -e "  - ${GREEN}controlaug_diffuser${NC}: Diffuser environment"
echo -e "  - ${GREEN}controlaug_mmdet${NC}: MMDetection environment"
echo -e "  - ${GREEN}controlaug_control${NC}: ControlNet environment"
echo -e "  - ${GREEN}controlaug_xpaste${NC}: XPaste environment\n"