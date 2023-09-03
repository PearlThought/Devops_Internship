data "aws_security_group" "all_clear" {
  filter {
    name   = "tag-key"
    values = ["Name"]
  }
  filter {
    name   = "tag-value"
    values = [var.sg_name]
  }
}
data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230325"]
  }
} 