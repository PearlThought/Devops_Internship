terraform {  
  backend "s3" {
    bucket = "pearl1811"
    key ="pearl/terraform"
    region = "ap-northeast-2"
    dynamodb_table = "pearldb11"
  }
}
