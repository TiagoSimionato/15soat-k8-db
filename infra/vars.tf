variable "namespace" {
  default = "soat-grupo76"
}

variable "postgres_user"               {}
variable "postgres_password"           {}
variable "postgres_db"                 {}

variable "postgres_user_stock"         {}
variable "postgres_password_stock"     {}
variable "postgres_db_stock"           {}

variable "db_port"                     { default = "5432" }
variable "kind_endpoint"               {}
variable "kind_client_certificate"     {}
variable "kind_client_key"             {}
variable "kind_cluster_ca_certificate" {}
