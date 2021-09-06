variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "host" {
  type = string
}

variable "service_name" {
  type = string
}

variable "service_port" {
  type = number
}

variable "traefik_entrypoint" {
  type = string
  default = "websecure"
}

variable "issuer" {
  type    = string
  default = "letsencrypt"
}

variable "issuer_type" {
  type = string
  default = "ClusterIssuer"
}