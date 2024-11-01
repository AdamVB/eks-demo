# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token","--cluster-name", data.aws_eks_cluster.cluster.name]
      command     = "aws"
    }
  }
}



resource "helm_release" "lacework-agent" {
  name       = "lacework-agent"
  repository = "https://lacework.github.io/helm-charts/"
  chart      = "lacework-agent"

  values = [
    file("${path.module}/lw-datacollector-values.yaml")
  ]

  set {
    name  = "laceworkConfig.accessToken"
    value = var.lw-datacollector-token
  }
}


resource "helm_release" "lacework-admission-controller" {
  name       = "lacework-admission-controller"
  repository = "https://lacework.github.io/helm-charts/"
  chart      = "admission-controller"

  values = [
    file("${path.module}/lw-admissioncontroller-values.yaml")
  ]

  set {
    name  = "proxy-scanner.config.lacework.integration_access_token"
    value = var.lw-proxyscanner-token
  }
  set {
    name  = "proxy-scanner.config.lacework.account_name"
    value = var.lw-account-name
  }
  set {
    name  = "certs.serverCertificate"
    value = var.lw-proxyscanner-cert
  }
  set {
    name  = "certs.serverKey"
    value = var.lw-proxyscanner-key
  }
  set {
    name  = "webhooks.caBundle"
    value = var.lw-proxyscanner-cabundle
  }
}




resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"

  values = [
    file("${path.module}/nginx-values.yaml")
  ]
}


