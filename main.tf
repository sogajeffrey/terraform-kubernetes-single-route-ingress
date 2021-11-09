resource "helm_release" "ingress" {
  name       = var.name
  namespace  = var.namespace
  repository = "https://helm.jeffreyjsu.com"
  chart      = "secure-ingressroute"
  version    = var.chart_version

  values = [
    <<EOT
    entrypoints: 
      - ${var.traefik_entrypoint}
    routes:
      - routeMatch: "Host(`${var.host}`)"
        service:
          name: ${var.service_name}
          port: ${var.service_port}

    tls: 
      commonName: "${var.host}"
      hosts: 
        - ${var.host}
      secretName: ${var.name}
      issuerRef:
        name: "letsencrypt"
        kind: "ClusterIssuer"
EOT
  ]
}