resource "aws_instance" "myinstance1" {
ami = "ami-0efcece6bed30fd98"
instance_type = "t2.micro"
key_name = "soham-key"
associate_public_ip_address = true
subnet_id = aws_subnet.subnet1.id
vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
tags = {
        Name = "Webserver1"
}
}
