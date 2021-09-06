module "ingress_cert" {
  source      = "github.com/sogajeffrey/terraform-kubernetes-certmanager-cert:1.0.0"
  name        = var.name
  namespace   = var.namespace
  common_name = var.host
  dns_names   = ["${var.host}"]
}


resource "kubernetes_manifest" "ingress_route" {
  manifest = {
    "apiVersion" = "traefik.containo.us/v1alpha1"
    "kind"       = "IngressRoute"
    "metadata" = {
      "name"      = var.name
      "namespace" = var.namespace
    }
    "spec" = {
      "entryPoints" = [
        "${var.traefik_entrypoint}",
      ]
      "routes" = [
        {
          "kind"  = "Rule"
          "match" = "Host(`${var.host}`)"
          "services" = [
            {
              "name" = var.service_name
              "port" = var.service_port
            },
          ]
        },
      ]
      "tls" = {
        "secretName" = var.name
      }
    }
  }
}