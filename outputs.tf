output "Master_ip" {
  value = {
    name       = aws_instance.this.tags["Name"]
    public_ip  = aws_instance.this.public_ip
    private_ip = aws_instance.this.private_ip
  }
  description = "The public and private IP addresses of the instance"
}

output "Nodes_ips" {
  value = [
    for i in range(var.node_count) : {
      name       = "Node-${i + 1}"
      public_ip  = element(aws_instance.this2.*.public_ip, i)
      private_ip = element(aws_instance.this2.*.private_ip, i)
    }
  ]
  description = "The public and private IP addresses of the instances"
}