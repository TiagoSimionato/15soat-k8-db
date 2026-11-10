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
            value = var.postgres_user
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

resource "kubernetes_deployment" "db-stock-update-service" {
  metadata {
    name      = "db-stock-update-service"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "db-stock-update-service" }
    }

    template {
      metadata {
        labels = { app = "db-stock-update-service" }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:18"

          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user_stock
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password_stock
          }

          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db_stock
          }

          port {
            container_port = var.db_port
          }
        }
      }
    }
  }
}
