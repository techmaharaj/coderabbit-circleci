provider "aws" {
  region     = "us-east-1"
  access_key = "szjsdfksfdon1230asd"
  secret_key = "328sjv9lflsdfj0sdjs"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  security_group_ids = ["sg-0123456789abcdef0"]

  tags = {
    Name = "example-instance"
  }
}
