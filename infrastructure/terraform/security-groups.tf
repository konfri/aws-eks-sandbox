resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }
}

resource "aws_security_group_rule" "cluster-ingress-workstation-http" {
  cidr_blocks = [
    "0.0.0.0/0", # allow all
    local.workstation-external-cidr
  ]
  description = "Open to public internet"
  from_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.worker_group_mgmt_one.id
  to_port = 80
  type = "ingress"
}