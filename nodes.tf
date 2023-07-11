

variable "node_count" {
  description = "Number of instances to create"
  default     = 2
}

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

output "Nodes_ips" {
  value = [
    for i in range(var.node_count) : {
      name = "Node-${i+1}"
      public_ip = element(aws_instance.this.*.public_ip, i)
      private_ip = element(aws_instance.this.*.private_ip, i)
    }
  ]
  description = "The public and private IP addresses of the instances"
}
