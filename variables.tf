variable "namespace" {
  type        = string
  description = "The namespace used to deploy the Kubernetes deployment object"
}

variable "deployment_name" {
  type        = string
  description = "The name to give the Kubernetes deployment object in Kubernetes"
}

variable "replicas" {
  type        = number
  description = "The number of pods to deploy with the Kubernetes deployment"
  default     = 1
}

variable "image_name" {
  type        = string
  description = "The image name (tag) of the image used to deploy the Kubernetes deployment with"
  default     = "busybox"
}

variable "image_version" {
  type        = string
  description = "The version of the image used to deploy the Kubernetes deployment with"
  default     = "latest"
}

variable "env_vars" {
  type        = list(map(string))
  description = "The environment variables (key-value pairs) used by the Kubernetes deployment for the application to use"
  default     = []
}

variable "ports" {
  type        = list(map(string))
  description = "The port configurations used for application running out of the Kubernetes object"
  default     = []
}

variable "image_pull_secrets" {
  type        = list(map(string))
  description = "The names of the secrets (from the same namespace) used to authenticate with the Docker registry to pull image from; and for secrets used by the Kubenetes deployment"
  default     = []
}