variable "region" {
    description = "The AWS region to deploy resources in."
    default = "us-east-1"
}
variable "name" {
    description = "The name of the VPC."
    default = "eks-vpc"
}
variable "cidr" {
    description = "The CIDR block for the VPC."
    default = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
    description = "List of CIDR blocks for public subnets."
    default = ["10.0.0.0/24", "10.0.1.0/24"]
}
variable "private_subnet_cidrs" {
    description = "List of CIDR blocks for private subnets."
    default = ["10.0.2.0/24", "10.0.3.0/24"]
}   
variable "cluster_name" {
    description = "The name of the Kubernetes cluster."
    default = "eks-cluster"
}   
variable "cluster_version" {
    description = "The version of the EKS cluster."
    default = "1.28"
}
variable "aws_region" {
    description = "The AWS region where the EKS cluster will be deployed."
    default     = "us-east-1"
}   
