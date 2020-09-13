resource "kubernetes_deployment" "main" {
  metadata {
    namespace = var.namespace
    name      = "${var.deployment_name}-deployment"

    labels {
      app = var.deployment_name
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels {
        app = var.deployment_name
      }
    }

    template {
      metadata {
        labels {
          app = var.deployment_name
        }
      }

      spec {
        container {
          image              = "${var.image_name}:${var.image_version}"
          name               = var.deployment_name
          env                = var.env_vars
          port               = var.ports
          image_pull_secrets = var.image_pull_secrets
        }
      }
    }
  }
}