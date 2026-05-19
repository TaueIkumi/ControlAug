```bash
# Clone Repos
git submodule update --init --recursive

# Build Docker images
bash docker/setup.sh

# Download checkpoints and data (inside container)
docker-compose run --rm diffuser bash -c "\
  source ./scripts/export_paths.sh && \
  bash ./scripts/download_cnet_ckpts.sh && \
  bash ./scripts/download_coco_fsod.sh \
"

# Run container
docker-compose run --rm diffuser bash
```
