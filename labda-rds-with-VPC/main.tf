module "vpc" {
  source               = "./modules/vpc"
  vpc_id               = "vpc-0fb02322b44af37fe"  # Replace with your actual VPC ID
  private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "rds" {
  source            = "./modules/rds"
  subnet_ids        = [module.vpc.private_subnet_a_id, module.vpc.private_subnet_b_id] # Pass subnet_ids from vpc module
  security_group_id = module.vpc.lambda_rds_sg_id                                      # Pass security group ID from vpc module
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
}

module "lambda" {
  source             = "./modules/lambda"
  lambda_role_arn    = module.iam.lambda_role_arn
  rds_endpoint       = module.rds.db_endpoint
  subnet_id          = module.vpc.private_subnet_a_id  # Use the correct output for subnet
  security_group_id  = module.vpc.lambda_rds_sg_id
  lambda_layer_arn   = module.s3.lambda_layer_arn
}
