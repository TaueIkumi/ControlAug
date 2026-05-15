# ControlAug
Official Implementation for "Data Augmentation for Object Detection via Controllable Diffusion Models" (accepted as poster in WACV 2024).


## Preparations

You have two options to set up ControlAug: **Conda** (traditional) or **Docker** (recommended).


#### Requirements
You can set up ControlAug using **Docker** (recommended).
- Docker Compose (>=1.29)
- NVIDIA Docker Runtime (GPU support)
```bash
# Build Docker images
bash docker/setup.sh

# Download checkpoints and data (inside container)
docker-compose run --rm diffuser bash -c "\
  source ./ControlAug/scripts/export_paths.sh && \
  bash ./ControlAug/scripts/download_cnet_ckpts.sh && \
  bash ./ControlAug/scripts/download_coco_fsod.sh \
"

# Run container
docker-compose run --rm diffuser bash
```
