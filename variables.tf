variable "instance_type" {
    type = list
    default = ["t2.micro","t2.small","t2.meduim"]
}

variable "servers" {
    type = list
    default = ["Dev-PublicWebserver1","Dev-PublicWebserver2"]  
}

variable "az" {
    type = list
    default = ["ap-south-1a", "ap-south-1b"]
  
}

variable "server-ingress-ports" {
    type = list (number)
    default = [ 80, 22, 443 ]  
}

variable "alb-ingress-ports" {
    type = list (number)
    default = [ 80, 443 ]  
}

