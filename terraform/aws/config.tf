
variable "ami" {
  description = "the AMI to use"
}

resource "aws_instance" "web" {
  ami = "${var.ami}"
  count = 2
  source_dest_check = false

  user_data = <<EOF
  #!/bin/bash
  echo "Hello, Terraform!"
  EOF

  connection {
    user = "root"
  }

  variable "zones" {
    type = "list"
    default = ["us-east-1a", "us-east-1b"]
  }

  instance_type = "t2.micro"
}