resource "aws_security_group" "worker_node_management" {
  name        = "Eks-worker-node-management"
  description = "Security group for worker node management"
  vpc_id      = module.vpc.vpc_id   
}

resource "aws_security_group_rule" "worker_node_management_ingress" {
    description = "Allow traffic to eks"
    type       = "ingress"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    security_group_id = aws_security_group.worker_node_management.id
    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16"
    ]
}
resource "aws_security_group_rule" "worker_node_management_egress" {
    description = "Allow all outbound traffic from eks"
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_group_id = aws_security_group.worker_node_management.id
    cidr_blocks = ["0.0.0.0/0"]
}