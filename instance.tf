#Author
#Krzysztof Barabasz
#Atos PoC DevOps Community

resource "aws_instance" "instancja2_krzyska" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = "frankfurt_k_p"
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  provisioner "file" {
    source      = "index2.html"
    destination = "/tmp/index.html"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

data "aws_security_group" "sg" {
  id = "${var.security_group_id}"
}

