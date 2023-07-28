resource "aws_vpc" "import_vpc" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "${var.name}-terraform-vpc-2"
  }
}
