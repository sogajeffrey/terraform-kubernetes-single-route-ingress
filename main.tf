resource "kubernetes_manifest" "certificate" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata" = {
      "name"      = var.name
      "namespace" = var.namespace
    }
    "spec" = {
      "commonName" = var.host
      "dnsNames"   = ["${var.host}"]
      "issuerRef" = {
        "kind" = var.issuer_type
        "name" = var.issuer
      }
      "secretName" = var.name
    }
  }
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