resource "kubernetes_service" "db" {
  metadata {
    name      = "db-svc-15soat-tech-challenge"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    selector = { app = "db-15soat-tech-challenge" }

    port {
      port        = var.db_port
      target_port = var.db_port
    }

    type = "ClusterIP"
  }

  depends_on = [kubernetes_namespace.app]
}
