output "vpc_id" {
  value       = aws_vpc.myvpc.id
}

output "vpc_cidr" {
  value       = aws_vpc.myvpc.cidr_block
  sensitive = true
}

output "public_subnet_1" {
  value       = aws_subnet.public-subnet-1.id
}

output "public_subnet_2" {
  value       = aws_subnet.public-subnet-2.id
}
