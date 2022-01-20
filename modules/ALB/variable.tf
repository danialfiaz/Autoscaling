variable "vpc_id" {
  type = string
}
variable "public_subnet" {
  type = list(string)
}
variable "name" {
  type = string
}
variable "redirect" {
  type = bool
}
variable "type" {
  type = string
}
variable "target_name" {
  type = string
}
variable "port" {
  type = number
}
variable "protol" {
  type = string
}
variable "target_type" {
  type = string
}
variable "healthy_threshold" {
  type = number
}
variable "unhealthy_threshold" {
  type = number
}
variable "timeout" {
  type = number
}
variable "interval" {
  type = number
}
variable "check_protocol" {
  type = string
}
variable "path" {
  type = string
}
