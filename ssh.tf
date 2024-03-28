resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "terraform_ssh_key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "tf-key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/terraform_ssh_key.pem"
}