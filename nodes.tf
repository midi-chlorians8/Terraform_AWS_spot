resource "aws_instance" "this2" {
  count = var.node_count

  ami      = data.aws_ami.ubuntu.id
  key_name = "KeyFromLinuxAWS-Frankfurt"

  vpc_security_group_ids = [aws_security_group.this.id]

  instance_market_options {
    market_type = "spot"

    spot_options {
      max_price = 0.0162
    }
  }
  instance_type = "t3.medium"

  tags = merge(var.tags, {
    Name = "Node-${count.index + 1}"
  })


}


