# I used this as inspiration https://stackoverflow.com/questions/76939169/aws-lambda-papermill-unable-to-import-module-lambda-function-no-module-nam
FROM public.ecr.aws/lambda/python:3.9

WORKDIR /app
RUN python -m pip install --upgrade pip
#RUN pip install \
#    --platform manylinux2014_x86_64 \
#    --target=./dist/layer/python/lib/python3.9/site-packages \
#    --implementation cp \
#    --python-version 3.9 \
#    --only-binary=:all: \
#    --upgrade \
#    --no-compile \
#    -r requirements.txt

ENTRYPOINT ["/bin/bash"]