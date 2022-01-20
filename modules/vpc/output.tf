output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}
output "cidr_block" {
  value = aws_vpc.main.cidr_block
}
output "private_subnets_ids" {
  value = aws_subnet.private.*.id
}