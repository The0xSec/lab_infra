resource "aws_vpc" "lab_infrastructure" {
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "lab_infrastructure"
    }
}

resource "aws_subnet" "lab_subnet" {
    vpc_id = aws_vpc.lab_infrastructure.id
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "lab_subnet"
    }
}

resource "aws_internet_gateway" "lab_gateway" {
    vpc_id = aws_vpc.lab_infrastructure.id

    tags = {
        Name = "lab_gateway"
    }
}

resource "aws_route_table" "lab_route_table" {
  vpc_id = aws_vpc.lab_infrastructure.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_gateway.id
  }

  tags = {
    Name = "lab_route_table"
  }
}

resource "aws_route_table_association" "lab_route_association" {
  subnet_id = aws_subnet.lab_subnet.id
  route_table_id = aws_route_table.lab_route_table.id
}
