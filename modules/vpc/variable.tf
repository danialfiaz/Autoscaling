variable "cidr_vpc_block" {
  type        = string
}
variable "public" {
  type        = list(string)
}
variable "availability_zone" {
  type = list(string)
}
variable "private" {
  type        = list(string)
}