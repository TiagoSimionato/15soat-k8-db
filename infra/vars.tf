variable "cluster_name" {
  default = "soat-cluster"
}

variable "namespace" {
  default = "soat-grupo76"
}

variable "postgres_user"     {}
variable "postgres_password" {}
variable "postgres_db"       {}
variable "db_port"           { default = "5432" }