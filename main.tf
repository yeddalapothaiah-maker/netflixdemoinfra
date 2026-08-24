provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0ac7b260cf76d8865"
  instance_type          = "c7i-flex.large"
  key_name               = "pothaiahdocker"
  vpc_security_group_ids = ["sg-052610925a2a09c3d"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", ]
}

resource "aws_s3_bucket" "one" {
  bucket = "pothaiah"
  versioning {
    enabled = true
  }
}
