variable "launch_template" {
    type = string
}
variable "target_group_arn" {
    type = string
}
variable "name" {
    type = string
}
variable "desired_capacity" {
    type = number
}
variable "max_size" {
    type = number
}
variable "min_size" {
    type = number
}
variable "template_version" {
    type = string
}
# variable "zones" {
#   type= list(string)
# }
variable "subnet_id" {
  type = list(string)
}