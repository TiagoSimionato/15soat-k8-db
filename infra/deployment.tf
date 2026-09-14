resource "kubernetes_deployment" "db" {
  metadata {
    name      = "db-15soat-tech-challenge"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "db-15soat-tech-challenge" }
    }

    template {
      metadata {
        labels = { app = "db-15soat-tech-challenge" }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:18"

          env {
            name  = "POSTGRES_USER"
            value_from {
              secret_key_ref {
                name = var.postgres_user
                key  = "POSTGRES_USER"
              }
            }
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value_from {
              secret_key_ref {
                name = var.postgres_password
                key  = "POSTGRES_PASSWORD"
              }
            }
          }
          env {
            name  = "POSTGRES_DB"
            value_from {
              secret_key_ref {
                name = var.postgres_db
                key  = "POSTGRES_DB"
              }
            }
          }

          port {
            container_port = var.db_port
          }
        }
      }
    }
  }
}
