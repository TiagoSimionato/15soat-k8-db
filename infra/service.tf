resource "kubernetes_service" "db" {
  metadata {
    name      = "db-svc-15soat-tech-challenge"
    namespace = var.namespace
  }

  spec {
    selector = { app = "db-15soat-tech-challenge" }

    port {
      port        = var.db_port
      target_port = var.db_port
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "db-stock-update-service" {
  metadata {
    name      = "db-svc-stock-update-service"
    namespace = var.namespace
  }

  spec {
    selector = { app = "db-stock-update-service" }

    port {
      port        = var.db_port
      target_port = var.db_port
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "db-payment-service" {
  metadata {
    name      = "db-svc-payment-service"
    namespace = var.namespace
  }

  spec {
    selector = { app = "db-payment-service" }

    port {
      port        = var.db_port
      target_port = var.db_port
    }

    type = "ClusterIP"
  }
}
