provider "aws" {
  region = var.region
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "this" {
  ami = data.aws_ami.ubuntu.id

  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.this.id]

  instance_market_options {
    market_type = "spot"

    spot_options {
      max_price = 0.0162
    }
  }
  instance_type = "t3.medium"

  tags = merge(var.tags, {
    Name = "Master"
  })

}




