resource "aws_vpc" "myvpc" {
instance_tenancy = "default"
cidr_block = "100.100.0.0/16"
tags = {
      Name = "Soham-VPC1"
    }
}

resource "aws_internet_gateway" "mygw" {
vpc_id = aws_vpc.myvpc.id
tags = {
      Name = "Soham-VPC1-IGW1"
    }
}

resource "aws_route_table" "myroute1" {
vpc_id = aws_vpc.myvpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.mygw.id
}
}

resource "aws_subnet" "subnet1" {
vpc_id = aws_vpc.myvpc.id
cidr_block = "100.100.100.0/24"
tags = {
      Name = "Soham-VPC1-subnet1"
    }
}

resource "aws_route_table_association" "myroute_asso"{
        subnet_id = aws_subnet.subnet1.id
        route_table_id = aws_route_table.myroute1.id
}
