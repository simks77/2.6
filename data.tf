resource "aws_instance" "public" { 
  ami = "ami-04173560437081c75" 
  instance_type = "t2.micro" 
  subnet_id = "subnet-0a0fe13f8fc494a17" #Public Subnet ID, e.g. subnet-xxxxxxxxxxx 
  associate_public_ip_address = true 
  key_name = "kssim-key-pair" #Change to your keyname, e.g. jazeel-key-pair 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id] 
  tags = { 
    Name = "${var.name}-WebAppServer" #Prefix your own name, e.g. jazeel-ec2 
  } 
  }
resource "aws_security_group" "allow_ssh" { 
  name = "kssim-terraform-security-group" #Security group name, e.g. jazeel-terraform-security-group 
  description = "Allow SSH inbound" 
  vpc_id = "vpc-0f71d7c193884773f" #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx 
  }
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" { 
  security_group_id = aws_security_group.allow_ssh.id 
  cidr_ipv4 = "0.0.0.0/0" 
  from_port = 22 
  ip_protocol = "tcp"
  to_port = 22 
  
  }