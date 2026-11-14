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

resource "kubernetes_deployment" "db-payment-service" {
  metadata {
    name      = "db-payment-service"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "db-payment-service" }
    }

    template {
      metadata {
        labels = { app = "db-payment-service" }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:18"

          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user_payment
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password_payment
          }

          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db_payment
          }

          port {
            container_port = var.db_port
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "db-status-update-service" {
  metadata {
    name      = "db-status-update-service"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "db-status-update-service" }
    }

    template {
      metadata {
        labels = { app = "db-status-update-service" }
      }

      spec {
        container {
          name  = "mongo"
          image = "mongo:8"

          env {
            name  = "MONGO_INITDB_ROOT_USERNAME"
            value = var.mongo_user
          }

          env {
            name  = "MONGO_INITDB_ROOT_PASSWORD"
            value = var.mongo_password
          }

          env {
            name  = "MONGO_INITDB_DATABASE"
            value = var.mongo_db
          }

          port {
            container_port = var.mongo_port
          }
        }
      }
    }
  }
}
