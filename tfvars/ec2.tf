


resource "aws_instance" "expenses" {
  for_each = var.instances
  ami = "ami-09c813fb71547fc4f"
  #   instance_type="t3.micro"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

#   tags = {
#     #  Name = "terraform"
#     Name = each.key
#   }

   tags = merge(
      var.common_tags,
      var.tags,
      {
        Name = each.key
      }
   )

}

resource "aws_security_group" "allow_ssh_terraform" {
  description = "Allow TLS inbound traffic and all outbound traffic"
  name        = "allow_ssh_${var.environment}"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from every one
    ipv6_cidr_blocks = ["::/0"]
  }

  
  tags = merge (
     var.common_tags,
     var.tags,
     {
    Name= "allow_ssh_${var.environment}"
  }

  )
  #ami-09c813fb71547fc4f
}