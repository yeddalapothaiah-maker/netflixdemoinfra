provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0332d564d76dbd8d6"
  instance_type          = "t2.medium"
  key_name               = "abc"
  vpc_security_group_ids = ["sg-0b55ac8354f5fc3a5"]

  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2"]
}

resource "aws_s3_bucket" "one" {
  bucket = "pothaiah-devops-2026-8247"
}

resource "aws_s3_bucket_versioning" "one" {
  bucket = aws_s3_bucket.one.id

  versioning_configuration {
    status = "Enabled"
  }
}
