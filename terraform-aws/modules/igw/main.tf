resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "assoc_a" {
  subnet_id      = var.public_subnet_a_id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "assoc_b" {
  subnet_id      = var.public_subnet_b_id
  route_table_id = aws_route_table.public_rt.id
}
