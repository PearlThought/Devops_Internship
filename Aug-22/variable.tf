variable "region" {
  type = string
}
variable "availability_zone" {
  type = list(string)
}
variable "sg_name" {
  type = string
}
variable "instances_info" {
  type = map(object({
    instance_type     = string
    availability_zone = string
    port              = number
  }))
}
variable "null" {
  type = string
}