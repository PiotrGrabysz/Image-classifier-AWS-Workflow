import sys
import time
sys.path.append("./dist/layer/python/lib/python3.9/site-packages")

start = time.time()
import sagemaker
stop = time.time()
print(f"SageMaker imported successfully in {stop-start:.2f} seconds.")

import importlib
version = importlib.metadata.version("sagemaker")
print(f"Sagemaker's version {version}")

jsonschema_version = importlib.metadata.version("jsonschema")
print(f"jsonschema's version is {jsonschema_version}")
