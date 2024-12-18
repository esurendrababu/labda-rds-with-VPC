#instead of this create a bucket manually and upload the file in that and use that path at lambda main.tf


variable "lambda_layer_arn" {}

resource "aws_lambda_function" "rds_lambda" {
  function_name = "rds_lambda_function1"
  role          = var.lambda_role_arn
  handler       = "index.lambda_handler"
  runtime       = "python3.9"
  s3_bucket = "lambdabucketforrdscreationvialambda"
  s3_key    = "pymysql_layer.zip"

  environment {
    variables = {
      DB_HOST = var.rds_endpoint
      DB_USER = "admin22"
      DB_PASS = "password123"
    }
  }

  vpc_config {
    subnet_ids         = [var.subnet_id]
    security_group_ids = [var.security_group_id]
  }

  layers = [
    var.lambda_layer_arn
  ]
}

variable "lambda_role_arn" {}
variable "rds_endpoint" {}
variable "subnet_id" {}
variable "security_group_id" {}
