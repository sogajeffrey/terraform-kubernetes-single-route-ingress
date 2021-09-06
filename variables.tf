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
