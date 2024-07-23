output "ec2instanceip" {
  value= aws_instance.this.private_ip
}

output "uswestec2ip" {
  value= aws_instance.that.private_ip
}
output "useastec2ip" {
  value= aws_instance.these.private_ip
}

