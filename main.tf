resource "kubernetes_deployment" "main" {
  metadata {
    namespace = var.namespace
    name      = "${var.deployment_name}-deployment"

    labels = {
      app = var.deployment_name
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.deployment_name
      }
    }

    template {    
      metadata {
        labels = {
          app = var.deployment_name
        }
      }

      spec {
        container {
          image = "${var.image_name}:${var.image_version}"
          name  = var.deployment_name
          
          dynamic "env" {
            for_each = var.env_vars
            content {
              name  = env.value.name
              value = env.value.value
            }
          }

          dynamic "port" {
            for_each = var.ports
            content {
              container_port = port.value.container_port
              host_ip        = port.value.host_ip != null ? port.value.host_ip : null
              host_port      = port.value.host_port != null ? port.value.host_port : null
              name           = port.value.name != null ? port.value.name : null
              protocol       = port.value.protocol != null ? port.value.protocol : "TCP"
            }
          }
        }

        dynamic "image_pull_secrets" {
          for_each = var.image_pull_secrets
          content {
            name = image_pull_secrets.value
          }
        }
      }
    }
  }
}