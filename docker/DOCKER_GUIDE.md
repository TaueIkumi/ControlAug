# Docker Setup Guide for ControlAug

## Requirements

- Docker (>=20.10)
- Docker Compose (>=1.29)
- NVIDIA Docker Runtime (for GPU support)
- GPU with 24GB+ VRAM recommended

## Quick Start

### 1. Setup and Build

```bash
bash docker/setup.sh
```

This script will:
- Check Docker and Docker Compose installation
- Build all Docker images
- Display available containers and next steps

### 2. Download Data

Data and models will be saved to `./data` directory (automatically mapped to `/media/data` inside containers).

```bash
# Run download scripts inside container
docker-compose run --rm diffuser bash -c "\
  source ./ControlAug/scripts/export_paths.sh && \
  bash ./ControlAug/scripts/download_cnet_ckpts.sh && \
  bash ./ControlAug/scripts/download_coco_fsod.sh \
"
```

Or download individually:
```bash
docker-compose run --rm diffuser bash -c "source ./ControlAug/scripts/export_paths.sh && bash ./ControlAug/scripts/download_cnet_ckpts.sh"

docker-compose run --rm diffuser bash -c "source ./ControlAug/scripts/export_paths.sh && bash ./ControlAug/scripts/download_coco_fsod.sh"
```

### 3. Run Container

```bash
# Start interactive shell
docker-compose run --rm clip bash

# Or run a command directly
docker-compose run --rm diffuser python your_script.py
```

### 4. Stop Containers

```bash
docker-compose down
```

## Available Services

- **clip**: CLIP environment
- **diffuser**: Diffuser environment
- **mmdet**: MMDetection environment
- **control**: ControlNet environment
- **xpaste**: XPaste environment

## Common Commands

```bash
# Run with GPU
docker-compose run --rm diffuser python script.py

# Interactive shell in specific service
docker-compose run --rm clip bash

# Start all services
docker-compose up -d

# View logs
docker-compose logs -f diffuser
```

## Troubleshooting

### GPU not detected

```bash
docker run --rm --runtime=nvidia nvidia/cuda:11.8.0-base nvidia-smi
sudo systemctl restart docker
```

### Out of Memory

Reduce batch size or use fewer GPUs:
```bash
CUDA_VISIBLE_DEVICES=0 docker-compose run --rm diffuser bash
```

### Build fails

Clear cache and rebuild:
```bash
docker-compose build --no-cache
```
