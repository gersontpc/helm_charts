resource "helm_release" "promtail" {
  name       = "promtail"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "promtail"
  namespace  = "grafana"
  version    = "6.15.2"

  values = [
    templatefile("${path.module}/helm-values/promtail.yml.tftpl", {
      loki_address = "http://${dns-hagworts}/loki/api/v1/push"
      loki_username = "potter"
      loki_address = "hermione"
    })
  ]
}