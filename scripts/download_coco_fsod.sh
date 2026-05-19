apt update && apt install -y p7zip-full

cd $ControlAug_DATA_DIR

aria2c -x 16 -s 16 -k 1M https://automl-mm-bench.s3.amazonaws.com/DAD/coco_fsod.zip

7z x coco_fsod.zip

rm coco_fsod.zip
