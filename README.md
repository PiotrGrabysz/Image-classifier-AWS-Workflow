# Image classifier AWS-Workflow

Simple project classifying subset of images from CIFAR-100, trained and deployed using AWS services.

This project comes from the Udacity **AWS Machine Learning Engineer Nanodegree** course, project two. 
The starter pack for this project can be found here: 
(starter.ipynb[https://github.com/udacity/udacity-nd009t-C2-Developing-ML-Workflow/tree/master/project]. 
The main goal of this project is to learn how to use AWS services to orchestrate machine learning workflow.

## Technologies

* <img src="images/icons/Lambda.svg" width="16" height="16"> AWS SageMaker AI
* <img src="images/icons/SageMaker.svg" width="16" height="16"> AWS Lambda
* <img src="images/icons/Step Functions.svg" width="16" height="16"> AWS StepFunctions

## Background

In the project's original description I act as a engineer working in *Scones Unlimited*:
> You are hired as a Machine Learning Engineer for a scone-delivery-focused logistics company, *Scones Unlimited*,
> and you’re working to ship an Image Classification model. [...]
> 
> In this project, you'll be building an image classification model that can automatically detect which kind of vehicle
> delivery drivers have, in order to route them to the correct loading bay and orders. 
> Assigning delivery professionals who have a bicycle to nearby orders and giving motorcyclists orders that are 
> farther can help Scones Unlimited optimize their operations.

The training and test data comes from CIFAR-100 dataset. 
I filter the images corresponding to classes "bicycle" and "motorcycle" and train a binary classifier.
Then the model is deployed with Data Capture configuration, which allows me to monitor the performance of the model.
This is all done in the notebook [starter.ipynb](starter.ipynb).

## The results

### Inference workflow

Once the endpoint is created, I can call the model to run inference on some sample test data. 
The inference is performed using three AWS Lambda functions:

* [ImageDataSerialize](lambda_functions/serialize/lambda_function.py): it reads an image (for a given filename) from S3 bucket and sends it as base64 encoded object,
* [ImageDataInference](lambda_functions/inference/lambda_function.py): it invokes the endpoint with the encoded image and runs the inference
* [ImageDataPassThreshold](lambda_functions/pass_threshold/lambda_function.py): it checks if the model's inference passes a required confidence threshold.
If not, it raises an error.

The three Lambda functions are orchestrated using AWS Step Functions:

<table>
  <tr>
    <td align="center">
      <img src="images/Working_step_function.png" width="300" alt="Left Image"><br>
      <em>Inference workflow when the image passes the confidence threshold</em>
    </td>
    <td align="center">
      <img src="images/Step_function_error.png" width="300" alt="Right Image"><br>
      <em>Inference workflow when the image doesn't pass the confidence threshold</em>
    </td>
  </tr>
</table>

The step function is declared [here](state_machine_definition.json).

### Monitor inference

To be done.
