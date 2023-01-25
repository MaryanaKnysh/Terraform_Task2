resource "aws_vpc" "VPC_Task2" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Maryana_Kondrasevych"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC_Task2.id

}

resource "aws_route" "r" {
  route_table_id         = aws_vpc.VPC_Task2.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}


resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.VPC_Task2.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Maryana_Kondrasevych"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.VPC_Task2.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Maryana_Kondrasevych"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.VPC_Task2.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1c"

  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Maryana_Kondrasevych"
  }
}
