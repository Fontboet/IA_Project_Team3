#!/bin/bash
set -e

echo "--- Installing basic libraries... ---"
pip3 install -qq torch torchvision --index-url https://download.pytorch.org/whl/cu126
pip install -qq \
    albumentations \
    opencv-python \
    matplotlib \
    tqdm \
    scikit-learn \
    segmentation-models-pytorch \
    timm \
    kaggle
echo "✅ Basic libraries installed ---"

echo "--- Downloading Kaggle dataset ---"
DATA_DIR="./data/Dataset_BUSI_with_GT"
if [ -d "$DATA_DIR" ]; then
    echo "✅ Dataset already downloaded, skipping."
else
    echo "⬇️  Downloading Kaggle dataset..."
    mkdir -p ./data
    kaggle datasets download -d aryashah2k/breast-ultrasound-images-dataset -p ./data --unzip
    echo "✅ Dataset downloaded."
fi
mkdir -p ./output

echo "✅ Setup complete!"