# resource "aws_security_group" "allow_all_local" {
#     name = "allow_ssh"
#     description = "Allow all inbound traffic"
#     vpc_id = aws_vpc.lab_infrastructure.id

#     ingress {
#         from_port = 0
#         to_port = 65535
#         protocol = "tcp"
#         cidr_blocks = var.cidr_block
#     }
# }
