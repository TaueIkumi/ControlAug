cd $ControlAug_DATA_DIR
mkdir voc_fsod
cd voc_fsod

aria2c -x 16 -s 16 -k 1M https://automl-mm-bench.s3.amazonaws.com/DAD/datasets/PascalVoc_COCOStyle.zip

7z x PascalVoc_COCOStyle.zip

rm PascalVoc_COCOStyle.zip

mv PascalVoc_COCOStyle/* ./

rm -r PascalVoc_COCOStyle