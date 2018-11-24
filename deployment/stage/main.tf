provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*",
    ]
  }

  filter {
    name = "virtualization-type"

    values = [
      "hvm",
    ]
  }

  owners = [
    "099720109477",
  ]
}

resource "aws_security_group" "eureka_server_security_group" {
  name = "eureka_server_security_group"

  ingress {
    from_port = 5555
    protocol  = "tcp"
    to_port   = 5555

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

data "template_file" "eureka_server_template" {
  template = "${file("modules/eureka/eureka_server_template.sh")}"
}

data "template_file" "eureka_server_docker-compose" {
  template = "${file("docker-compose.yml")}"
}

resource "aws_instance" "eureka_server_instance" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.large"

  availability_zone = "us-east-1a"

  key_name = "jsource-us-east-1"

  vpc_security_group_ids = [
    "${aws_security_group.eureka_server_security_group.id}",
  ]

  tags {
    Name = "eureka_server_instance"
  }

  provisioner "file" {
    content     = "${data.template_file.eureka_server_template.rendered}"
    destination = "/tmp/eureka_server_template.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("jsource-us-east-1.pem")}"
    }
  }

  provisioner "file" {
    content     = "${data.template_file.eureka_server_docker-compose.rendered}"
    destination = "/tmp/docker_compose.yml"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("jsource-us-east-1.pem")}"
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("jsource-us-east-1.pem")}"
    }

    inline = [
      "chmod +x /tmp/eureka_server_template.sh",
      "/tmp/eureka_server_template.sh",
    ]
  }
}
