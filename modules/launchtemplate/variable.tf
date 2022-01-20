variable "subnet_id" {
    type = list(string)
}
variable "vpc_id" {
    type = string
}
variable "name" {
    type = string
}
variable "image_id" {
    type = string
}
variable "instance_behavior" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "key_name" {
    type = string
}
variable "ip_address" {
    type = bool
}
variable "instplace" {
  type = string
}
variable "tenancytype" {
    type = string
}
variable "autoscalingSGname" {
    type = string
}
