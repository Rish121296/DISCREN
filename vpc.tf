resource "aws_vpc" "vpcdev" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "dev-vpc"
  }
}

resource "aws_internet_gateway" "igwdev" {
    vpc_id = aws_vpc.vpcdev.id

    tags = {
      "Name" = "dev-igw"
    }
}

resource "aws_subnet" "devsubnetpublic1" {
    vpc_id = aws_vpc.vpcdev.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "dev-publicsubnetone"
    }  
}

resource "aws_subnet" "devsubnetpublic2" {
    vpc_id = aws_vpc.vpcdev.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "dev-publicsubnettwo"
    }  
}

resource "aws_subnet" "devprivatesubnet1" {
    vpc_id = aws_vpc.vpcdev.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = false

    tags = {
      "Name" = "dev-privatesubnetone"
    }  
}

resource "aws_subnet" "devprivatesubnet2" {
    vpc_id = aws_vpc.vpcdev.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = false

    tags = {
      "Name" = "dev-privatesubnettwo"
    }  
}

resource "aws_route_table" "dev-publicroutetable" {
    vpc_id = aws_vpc.vpcdev.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igwdev.id
    }
    
      tags = {
        "Name" = "dev-public-rt"
      }
      
}

resource "aws_route_table_association" "public-rt-1" {
    subnet_id = aws_subnet.devsubnetpublic1.id
    route_table_id = aws_route_table.dev-publicroutetable.id
}

resource "aws_route_table_association" "public-rt-2" {
    subnet_id = aws_subnet.devsubnetpublic2.id
    route_table_id = aws_route_table.dev-publicroutetable.id
}







