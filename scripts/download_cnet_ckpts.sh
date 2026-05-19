cd $CNET_MODEL_DIR

aria2c -x 16 -s 16 -k 1M -o control_sd15_hed.pth "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_hed.pth"

aria2c -x 16 -s 16 -k 1M -o control_sd15_canny.pth "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_canny.pth"