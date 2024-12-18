#instead of this create a bucket manually and upload the file in that and use that path at lambda main.tf

resource "aws_s3_bucket" "lambda_layer_bucket" {
  bucket = "lambdabucketforrdscreationvialambdaaaa"
}

output "lambda_layer_arn" {
  value = aws_lambda_layer_version.pymysql_layer.arn
}
resource "aws_lambda_layer_version" "pymysql_layer" {
  layer_name           = "pymysql_layer"
  s3_bucket            = "lambdabucketforrdscreationvialambda"
  s3_key               = "pymysql_layer.zip"
  compatible_runtimes  = ["python3.8"]
}
