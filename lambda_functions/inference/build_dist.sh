#!/bin/bash

rm -rf dist
rm -f lambda_layer.zip

pip install \
    --platform manylinux2014_x86_64 \
    --target=./dist/layer/python/lib/python3.9/site-packages \
    --implementation cp \
    --python-version 3.9 \
    --only-binary=:all: \
    --upgrade \
    --no-compile \
    -r requirements.txt

cd dist/layer

# Remove tests and pycache to decrease the package size
find . -type d -name "tests" -exec rm -rfv {} +
find . -type d -name "__pycache__" -exec rm -rfv {} +

zip -r ../../lambda_layer.zip .
echo "Created the lambda_layer.zip"

echo "Testing sagemaker build:"
python test_layer.py
