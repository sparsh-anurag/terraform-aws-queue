module "TTN-MQ" {
  source              = "../"
  common_tags         = {
    "Project"     = "ToTheNew",
    "Environment" = "dev"
  }
  # instance_count      = 1
  instance_type       = "t3.snmall"
  project_name_prefix = "dev-tothenew"
  # region              = "us-east-1"
  security_groups  = ["sg-999999999999"]
  subnet_ids          = ["subnet-999999999999"]
  ec2_subnet_id       = "subnet-999999999999"
  ActiveMQ_username   = "admin"
  ActiveMQ_password   = "admin@123"
 
  # volume_size = 10
  vpc_id      = "vpc-999999999999"

  create_aws_ActiveMQ     = false
  create_aws_ec2_RabbitMQ = true

  kms_key_id              = "nj23ihun-wcsn2-mnwnj-dsaxsa"
  key_name                = "tothenew"
  iam_instance_profile    = "tothenew"
  ebs_optimized = true
  root_volume_size = 8
  disable_api_termination = true
  disable_api_stop        = true
}