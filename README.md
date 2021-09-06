# terraform-kubernetes-single-route-ingress
Terraform module to create a single route ingress route (Traefik) with TLS 

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ingress_cert"></a> [ingress\_cert](#module\_ingress\_cert) | https://github.com/sogajeffrey/terraform-kubernetes-certmanager-cert:1.0.0 | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.ingress_route](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host"></a> [host](#input\_host) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | n/a | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | n/a | `number` | n/a | yes |
| <a name="input_traefik_entrypoint"></a> [traefik\_entrypoint](#input\_traefik\_entrypoint) | n/a | `string` | `"websecure"` | no |
