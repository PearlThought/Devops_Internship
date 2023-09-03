resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "public_key" {
  private_key_pem = tls_private_key.private_key.private_key_pem
}

resource "aws_key_pair" "key" {
  key_name   = "terra_key" 
  public_key = data.tls_public_key.public_key.public_key_openssh
}

# To save the pem key in local machine
resource "null_resource" "save_private_key" {
  triggers = {
    private_key = tls_private_key.private_key.private_key_pem
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.private_key.private_key_pem}" > ~/Downloads/private_key.pem
    EOT
    interpreter = ["PowerShell", "-Command"]
  }
}