output "public_ip" {
  value = "${aws_instance.instances["jenkins"].public_ip}"

}