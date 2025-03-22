# I used this as inspiration https://stackoverflow.com/questions/76939169/aws-lambda-papermill-unable-to-import-module-lambda-function-no-module-nam
FROM public.ecr.aws/lambda/python:3.9

# I need zip to archive the package into .zip file.
# The lambda python image is very lightweight, so it dosn't contain apt-get and I must use yum
RUN yum install zip -y

WORKDIR /app
RUN python -m pip install --upgrade pip

ENTRYPOINT ["/bin/bash", "/app/build_dist.sh"]
