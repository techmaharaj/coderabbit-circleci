provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAEXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

resource "aws_instance" "insecure_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  security_group_ids = ["sg-12345678"]
  key_name           = "unsecured-key"

  user_data = <<-EOF
    #!/bin/bash
    echo "Sensitive data: password123" > /etc/secrets.txt
  EOF

  tags = {
    Name = "insecure-example-instance"
  }
}

resource "aws_security_group" "open_sg" {
  name_prefix = "open-sg-"
  description = "Security group with access"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
