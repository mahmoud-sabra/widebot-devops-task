region         = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
cluster_name = "widebot-eks"
public_subnet_cidr_block  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_block = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
node_name = "widebotnode"
node_type = [ "t3.small" ]