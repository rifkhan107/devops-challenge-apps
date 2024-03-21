provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDuAZxJJjrlCoinfhuM5O3BRSNYoVRoEwN5c3iGoNGeR/yKtUfB35ytpbVmtd2gpGlqBCwmP00FWwQvjIUjypO8hyk8utElHmCvftEzZOgOZlIOoSO7SpCrse4wpxfLNakM45sXpcIv/3zf7hltEeLCnrRi3Q/6UVkzy08x5sF1K7MpUX72BdIL42p0PBO3D5oN+d8pZZjj569+waP4z7OHvSzU5QlYMSOiAzcSdwXL+jc9OfXGJ3d61xaxI1QhWScfBjgDPZlTNHKbsSC8tw8iICnYkzmm+W40gq+An0xgua149wzWN5Nuz71PBE+GSObgRdoOGWWpq1SrzJlo3LoyeD1crvpDeo8LzXOqMIC1HSG7ku5C+X+NbioU11QIkty78tuhHE7SLmtomgplaY3fi+t+qhdaIOvR3QOfyqbdTYgF499q/e1UX8K+penzWuCkAMV/Ktflbl2k6gd0uWwWcPVxc2amVjmm7rcRhPS5bF7YmNFyq572klzOI6xnw9k= ubuntu@Rifkhan"
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"
  vpc_id      = "vpc-023afb8447f5429ec" 

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP Rule"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP Rule"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_traffic"
  }
}


resource "aws_instance" "example" {
  ami           = "ami-0f3f4cc1acdeb9971"
  instance_type = "c5a.xlarge"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.allow_web.name]

  tags = {
    Name = "my-virtual-instance"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.example.id
  domain   = "vpc"

  tags = {
    Name = "my-eip"
  }
}