variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "host" {
  type = string
}

variable "chart_version" {
  type    = string
  default = "0.1.0"
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
