terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }
}

provider "aws" {
  region     = "us-east-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_key_pair" "ssh" {
  key_name   = "ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }

}


resource "aws_instance" "web" {
  ami                    = "ami-08333bccc35d71140"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  connection {
    host        = aws_instance.web.public_ip
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    timeout     = "2m"
  }
  provisioner "local-exec" {
    command = <<EOT
      cat > index.html <<EOF 

        <html>
            <body><h1>Olá, Terraform!</h1></body>
        </html>
        
    EOT
  }
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {

    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo service httpd start"
    ]
  }
  tags = {
    Name = "Atividade-Virtualizacao"
  }
}


terraform {
  backend "s3" {
    bucket     = "tfs-jr"
    key        = "terraform.tfstate"
    region     = "us-east-2"
    access_key = ""
    secret_key = ""
  }
}
