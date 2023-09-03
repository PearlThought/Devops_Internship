region            = "ap-northeast-2"
availability_zone = ["ap-northeast-2a"]
sg_name           = "all_clear"
instances_info = {
  "jenkins" = {
    instance_type     = "t2.micro"
    availability_zone = "ap-northeast-2a"
    port              = 8080
  }
}
null = "11"