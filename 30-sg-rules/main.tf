# mongodb accepting traffic from bastion
resource "aws_security_group_rule" "mongodb_bastion" {  
  type              = "ingress"
  security_group_id = local.mongodb_sg_id  # mongodb SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# # mongodb accepting traffic from catalogue
# resource "aws_security_group_rule" "mongodb_catalogue" {  
#   type              = "ingress"
#   security_group_id = local.mongodb_sg_id  # mysql SG ID
#   source_security_group_id = local.catalogue_sg_id # bastion SG ID
#   from_port         = 27017
#   protocol       = "tcp"
#   to_port           = 27017
# }

# mongodb accepting traffic from user
# resource "aws_security_group_rule" "mongodb_user" {  
#   type              = "ingress"
#   security_group_id = local.mongodb_sg_id  # mongodb SG ID
#   source_security_group_id = local.user_sg_id # user SG ID
#   from_port         = 27017
#   protocol       = "tcp"
#   to_port           = 27017
# }

# redis accepting traffic from bastion
resource "aws_security_group_rule" "redis_bastion" {  
  type              = "ingress"
  security_group_id = local.redis_sg_id  # redis SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# redis accepting connection from user
# resource "aws_security_group_rule" "redis_user" {  
#   type              = "ingress"
#   security_group_id = local.redis_sg_id  # redis SG ID
#   source_security_group_id = local.user_sg_id # user SG ID
#   from_port         = 6379
#   protocol       = "tcp"
#   to_port           = 6379
# }

# redis accepting connection from cart
# resource "aws_security_group_rule" "redis_cart" {  
#   type              = "ingress"
#   security_group_id = local.redis_sg_id  # redis SG ID
#   source_security_group_id = local.cart_sg_id # cart SG ID
#   from_port         = 6379
#   protocol       = "tcp"
#   to_port           = 6379
# }

# mysql accepting traffic from bastion
resource "aws_security_group_rule" "mysql_bastion" {  
  type              = "ingress"
  security_group_id = local.mysql_sg_id  # mysql SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# mysql accepting connection from shipping
# resource "aws_security_group_rule" "mysql_shipping" {  
#   type              = "ingress"
#   security_group_id = local.mysql_sg_id  # mysql SG ID
#   source_security_group_id = local.shipping_sg_id # shipping SG ID
#   from_port         = 3306
#   protocol       = "tcp"
#   to_port           = 3306
# }

# rabbitmq accepting traffic from bastion
resource "aws_security_group_rule" "rabbitmq_bastion" {  
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id  # rabbitmq SG ID
  source_security_group_id = local.bastion_sg_id # bastion SG ID
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# rabbitmq accepting connection from payment
# resource "aws_security_group_rule" "rabbitmq_payment" {  
#   type              = "ingress"
#   security_group_id = local.rabbitmq_sg_id  # rabbitmq SG ID
#   source_security_group_id = local.payment_sg_id # shipping SG ID
#   from_port         = 5672
#   protocol       = "tcp"
#   to_port           = 5672
# }


### Catalogue SG Rules #####

# resource "aws_security_group_rule" "catalogue_bastion" {  
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id  # catalogue SG ID
#   source_security_group_id = local.bastion_sg_id # bastion SG ID
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "catalogue_backend_alb" {  
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id  # catalogue SG ID
#   source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

# This is the mistake we did, cart can't access catalogue directly, it should be through backend ALB
# resource "aws_security_group_rule" "catalogue_cart" {  
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id  # payment SG ID
#   source_security_group_id = local.cart_sg_id # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

### User SG Rules ####

# resource "aws_security_group_rule" "user_bastion" {  
#   type              = "ingress"
#   security_group_id = local.user_sg_id  
#   source_security_group_id = local.bastion_sg_id 
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "user_backend_alb" {  
#   type              = "ingress"
#   security_group_id = local.user_sg_id  # catalogue SG ID
#   source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

### Cart SG Rules ####

# resource "aws_security_group_rule" "cart_bastion" {  
#   type              = "ingress"
#   security_group_id = local.cart_sg_id  
#   source_security_group_id = local.bastion_sg_id 
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# } 

# resource "aws_security_group_rule" "cart_backend_alb" {  
#   type              = "ingress"
#   security_group_id = local.cart_sg_id  # cart SG ID
#   source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

### Shipping SG Rules ####

# resource "aws_security_group_rule" "shipping_bastion" {  
#   type              = "ingress"
#   security_group_id = local.shipping_sg_id  
#   source_security_group_id = local.bastion_sg_id 
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "shipping_backend_alb" {  
#   type              = "ingress"
#   security_group_id = local.shipping_sg_id  # shipping SG ID
#   source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

### Payment SG Rules ####

# resource "aws_security_group_rule" "payment_bastion" {  
#   type              = "ingress"
#   security_group_id = local.payment_sg_id  # payment SG ID
#   source_security_group_id = local.bastion_sg_id  # bastion SG ID
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "payment_backend_alb" {  
#   type              = "ingress"
#   security_group_id = local.payment_sg_id  # payment SG ID
#   source_security_group_id = local.backend_alb_sg_id # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

### Backend ALB SG Rules ###

# resource "aws_security_group_rule" "backend_alb_bastion" {
#   type              = "ingress"
#   security_group_id = local.backend_alb_sg_id # backend ALB SG ID
#   source_security_group_id = local.bastion_sg_id # bastion SG ID
#   from_port         = 80
#   protocol       = "tcp"
#   to_port           = 80
# }

# resource "aws_security_group_rule" "backend_alb_frontend" {  
#   type              = "ingress"
#   security_group_id = local.backend_alb_sg_id  # payment SG ID
#   source_security_group_id = local.frontend_sg_id  # backend_alb SG ID
#   from_port         = 80
#   protocol       = "tcp"
#   to_port           = 80
# }

# resource "aws_security_group_rule" "backend_alb_cart" {
#   type              = "ingress"
#   security_group_id = local.backend_alb_sg_id # backend ALB SG ID
#   source_security_group_id = local.cart_sg_id # cart SG ID
#   from_port         = 80
#   protocol       = "tcp"
#   to_port           = 80
# }

# resource "aws_security_group_rule" "backend_alb_shipping" {
#   type              = "ingress"
#   security_group_id = local.backend_alb_sg_id # backend ALB SG ID
#   source_security_group_id = local.shipping_sg_id # shipping SG ID
#   from_port         = 80
#   protocol       = "tcp"
#   to_port           = 80
# }

# resource "aws_security_group_rule" "backend_alb_payment" {
#   type              = "ingress"
#   security_group_id = local.backend_alb_sg_id # backend ALB SG ID
#   source_security_group_id = local.payment_sg_id # payment SG ID
#   from_port         = 80
#   protocol       = "tcp"
#   to_port           = 80
# }

### Frontend SG Rules ###

# resource "aws_security_group_rule" "frontend_bastion" {  
#   type              = "ingress"
#   security_group_id = local.frontend_sg_id  # frontend SG ID
#   source_security_group_id = local.bastion_sg_id # bastion SG ID
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "frontend_frontend_alb" {  
#   type              = "ingress"
#   security_group_id = local.frontend_sg_id  # frontend SG ID
#   source_security_group_id = local.frontend_alb_sg_id  # frontend_alb SG ID
#   from_port         = 80
#   protocol       = "tcp"
#   to_port           = 80
# }

### Frontend ALB SG Rules ###

resource "aws_security_group_rule" "ingress_alb_public" {
  type              = "ingress"
  security_group_id = local.ingress_alb_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol       = "tcp"
  to_port           = 443
}

### Bastion SG Rules ###

# bastion accepting traffic from laptop
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

# VPN accepting connection from public
resource "aws_security_group_rule" "open_vpn_public" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "open_vpn_943" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 943
  protocol       = "tcp"
  to_port           = 943
}

resource "aws_security_group_rule" "open_vpn_443" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol       = "tcp"
  to_port           = 443
}

resource "aws_security_group_rule" "open_vpn_1194" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id # bastion SG ID
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 1194
  protocol       = "tcp"
  to_port           = 1194
}

# resource "aws_security_group_rule" "catalogue_vpn" {
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id # bastion SG ID
#   source_security_group_id = local.open_vpn_sg_id
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "catalogue_vpn_8080" {
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id # bastion SG ID
#   source_security_group_id = local.open_vpn_sg_id
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

resource "aws_security_group_rule" "components_vpn"{
  for_each          = local.vpn_ingress_rules
  type              = "ingress"
  security_group_id = each.value.sg_id
  source_security_group_id = local.open_vpn_sg_id
  from_port         = each.value.port
  protocol          = "tcp"
  to_port           = each.value.port
}




# This is the mistake we did, cart can't access catalogue directly from one component to another component they should be communicated through backend ALB
# resource "aws_security_group_rule" "cart_shipping" {  
#   type              = "ingress"
#   security_group_id = local.cart_sg_id  # payment SG ID
#   source_security_group_id = local.shipping_sg_id  # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

# resource "aws_security_group_rule" "user_payment" {  
#   type              = "ingress"
#   security_group_id = local.user_sg_id  # payment SG ID
#   source_security_group_id = local.payment_sg_id  # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

# resource "aws_security_group_rule" "cart_payment" {  
#   type              = "ingress"
#   security_group_id = local.cart_sg_id  # payment SG ID
#   source_security_group_id = local.payment_sg_id  # backend_alb SG ID
#   from_port         = 8080
#   protocol       = "tcp"
#   to_port           = 8080
# }

# resource "aws_security_group_rule" "shipping_bastion" {  
#   type              = "ingress"
#   security_group_id = local.shipping_sg_id  
#   source_security_group_id = local.bastion_sg_id 
#   from_port         = 22
#   protocol       = "tcp"
#   to_port           = 22
# }

resource "aws_security_group_rule" "eks_control_plane_bastion"{
  type               = "ingress"
  security_group_id  = local.eks_control_plane_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port          =  443
  protocol           = "tcp"
  to_port            = 443
}

resource "aws_security_group_rule" "eks_node_bastion"{
  type               = "ingress"
  security_group_id  = local.eks_node_sg_id
  source_security_group_id =  local.bastion_sg_id
  from_port          = 22
  protocol           = "tcp"
  to_port            = 22 
}

# EKS nodes can accept all kind of traffic from EKS control plane
resource "aws_security_group_rule" "eks_node_eks_control_plane"{
  type               = "ingress"
  security_group_id  = local.eks_node_sg_id
  source_security_group_id =  local.eks_control_plane_sg_id
  from_port          = 0
  protocol           = "-1"
  to_port            = 0
}

resource "aws_security_group_rule" "eks_control_plane_eks_node"{
  type               = "ingress"
  security_group_id  = local.eks_control_plane_sg_id
  source_security_group_id =  local.eks_node_sg_id
  from_port          = 0
  protocol           = "-1"
  to_port            = 0
}

# Mandatory for pod to pod communication. because pod can be in any node in VPC CIDR
resource "aws_security_group_rule" "eks_node_vpc"{
  type               = "ingress"
  security_group_id  = local.eks_node_sg_id
  cidr_blocks        = ["10.0.0.0/16"]
  from_port          = 0
  protocol           = "-1"
  to_port            = 0 
}

