provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1"
}

# Create a security group for the EC2 instance

resource "aws_security_group" "django_docker_aws" {
  name_prefix = "django_docker_aws"
  description = "Security group for Django and Docker on AWS"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // ingress for postgresql
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "my_keypair" {
  key_name   = "my-keypair"
  public_key = file("/Users/hvaandres/Documents/Git/cloud_aws_assignment/Solutions/public_key/nucamp-private-key.pub")
}

resource "aws_instance" "example" {
  ami           = "ami-0dba2cb6798deb6d8" # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  key_name      = "nucamp-private-key"

  vpc_security_group_ids = [
    aws_security_group.django_docker_aws.id,
  ]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/nucamp-private-key.pem") # Replace with your desired private key path
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Instance ID: ${self.id}'",
    ]
  }
}

// Create an ECR private repository
resource "aws_ecr_repository" "workshop1" {
  name = "workshop1"
}


resource "aws_security_group" "rds_sg" {
  name_prefix = "rds_sg"
  description = "Security group for RDS instances"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Create egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "rds-sg"
  }
}

# Create a db parameter group
resource "aws_db_parameter_group" "mypg2" {
  name   = "mypg2"
  family = "postgres12"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

# Create an RDS instance
resource "aws_db_instance" "nctutorials" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "12.8"
  instance_class         = "db.t2.micro"
  name                   = "nctutorials"
  username               = "postgres"
  password               = "admin123"
  parameter_group_name   = aws_db_parameter_group.mypg2.name
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "nctutorials-db"
  }
}