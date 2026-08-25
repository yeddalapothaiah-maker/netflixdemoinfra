provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-091b599f5f318ddd2"
  instance_type          = "c7i-flex.large"
  key_name               = "pothaiah"
  vpc_security_group_ids = ["sg-0b55ac8354f5fc3a5"]

  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2"]
}

resource "aws_s3_bucket" "two" {
  bucket = "pothaiah-devops-2026-82478-xyz91"
}

resource "aws_s3_bucket_versioning" "one" {
  bucket = aws_s3_bucket.two.id

  versioning_configuration {
    status = "Enabled"
  }
}
