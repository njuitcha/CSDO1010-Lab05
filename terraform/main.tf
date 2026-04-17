resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "Lab05-VPC" }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = { Name = "Lab05-Subnet" }
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id

  user_data = file("${path.module}/templates/ansible.bash")

  tags = { Name = "Lab05-EC2-njuitcha" }
}