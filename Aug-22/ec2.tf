# resource "aws_key_pair" "key" {
#   key_name   = "pearl_key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }
resource "aws_instance" "instances" {
  for_each          = var.instances_info
  ami               = data.aws_ami_ids.ubuntu.ids[0]
  instance_type     = each.value.instance_type
  key_name          = aws_key_pair.key.key_name
  availability_zone = each.value.availability_zone
  security_groups   = [data.aws_security_group.all_clear.name]
  tags = {
    "Name" = each.key
  }
  depends_on = [ aws_key_pair.key ]
}
resource "null_resource" "null" {
  for_each = var.instances_info
  triggers = {
    instance = var.null
  }
  connection {
    host        = aws_instance.instances[each.key].public_ip
    user        = "ubuntu"
    private_key = tls_private_key.private_key.private_key_pem
    type        = "ssh"
  }
  provisioner "file" {
    source      = "jenkins.sh"
    destination = "jenkins.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x jenkins.sh",
      "./jenkins.sh"
    ]
  }
  depends_on = [
    aws_instance.instances
  ]
}
