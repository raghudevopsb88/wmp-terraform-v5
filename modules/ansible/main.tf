resource "null_resource" "ansible" {

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      host = var.public_ip
      user = "ec2-user"
      password = "DevOps321"
    }
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/raghudevopsb88/wmp-ansible-v4.git main.yml -e env=dev -e COMPONENT=${var.component}"
    ]
  }
}

variable "component" {}
variable "public_ip" {}

