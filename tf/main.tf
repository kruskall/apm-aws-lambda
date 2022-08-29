provider "aws" {
  region = "eu-central-1"
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "soak-testing-test"
  description   = "Example Lambda function for soak testing"
  handler       = "index.lambda_handler"
  runtime       = "nodejs16.x"

  source_path = "../testdata/function/"

  tags = {
    Name = "my-lambda"
  }
}

module "lambda_layer_local" {
  source = "terraform-aws-modules/lambda/aws"

  create_layer = true

  layer_name          = "apm-lambda-extension"
  description         = "AWS Lambda Extension Layer for Elastic APM"
  compatible_runtimes = ["nodejs16.x"]

  source_path = "../bin/extensions/"
}
