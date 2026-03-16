variable "project_name"{
    default = "roboshop"
}

variable "environment"{
    default = "dev"
}

variable "sg_names"{
    # databases
    default = ["mongodb", "redis", "mysql", "rabbitmq",
    # backend
    "catalogue", "user", "cart", "shipping", "payment",
    # frontend
    "frontend",
    # bastion
    "bastion",
    # frontend Application Load Balancer
    "frontend_alb",
    # Backend ALB
    "backend_alb"

    ]
}   