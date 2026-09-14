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
            value =var.postgres_user
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password
          }

          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db
          }

          port {
            container_port = var.db_port
          }
        }
      }
    }
  }
}
