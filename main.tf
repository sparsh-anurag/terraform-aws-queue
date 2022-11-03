resource "aws_mq_broker" "AWS-ActiveMQ" {
	count                 = var.create_aws_ActiveMQ && !var.create_aws_ec2_RabbitMQ ? 1 : 0
	broker_name = "${var.project_name_prefix}-Activemq"

	engine_type         = var.engine_type
	engine_version      = var.engine_version
	storage_type        = var.storage_type
	host_instance_type  = var.host_instance_type
	security_groups     = var.security_groups
	deployment_mode     = var.deployment_mode
	subnet_ids 		    = var.subnet_ids[0]
	publicly_accessible = var.publicly_accessible


	user {
		username = var.ActiveMQ_username
		password = var.ActiveMQ_password
		console_access = var.console_access
	}
}

data "aws_ami" "amazon-linux-2" {
    most_recent = true
    filter {
      name   = "owner-alias"
      values = ["amazon"]
    }
    filter {
      name   = "name"
      values = ["amzn2-ami-hvm*"]
    }
    owners = ["amazon"]
}

data "template_file" "user_data" {
    template = file("${path.module}/user_data.sh")
}

resource "aws_instance" "ec2" {
	count                   = !var.create_aws_ActiveMQ && var.create_aws_ec2_RabbitMQ ? 1 : 0
	ami                     = data.aws_ami.amazon-linux-2.id
	instance_type           = var.instance_type
	subnet_id               = var.subnet_ids[0]
	vpc_security_group_ids  = var.security_groups
	key_name                = var.key_name
	iam_instance_profile    = var.iam_instance_profile
	ebs_optimized           = var.ebs_optimized
	disable_api_termination = var.disable_api_termination
	disable_api_stop        = var.disable_api_stop
	user_data_base64        = base64encode(data.template_file.user_data.rendered)
	source_dest_check       = var.source_dest_check

	volume_tags = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-RabbitMQ" }))
	tags        = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-RabbitMQ" }))

	root_block_device {
		delete_on_termination = var.delete_on_termination
		encrypted             = var.volume_encrypted
		kms_key_id            = var.kms_key_id
		volume_size           = var.root_volume_size
		volume_type           = var.volume_type
	}

}