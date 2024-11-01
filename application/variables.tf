# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  default = "eu-west-1"
}

variable "example_api_key" {
  description = "example api key coming from github secret"
  type        = string
  default     = "hello-world"
}


variable "lw-datacollector-token" {
  description = "Lacework Agent Access Token"
  type        = string
  default     = "hello-world"
}


variable "lw-proxyscanner-token" {
  description = "Lacework Proxy Scanner Token"
  type        = string
  default     = "hello-world"
}


variable "lw-proxyscanner-cabundle" {
  description = "Lacework Proxy Scanner CA Bundle"
  type        = string
  default     = "hello-world"
}


variable "lw-proxyscanner-cert" {
  description = "Lacework Proxy Scanner Certificate"
  type        = string
  default     = "hello-world"
}

variable "lw-proxyscanner-key" {
  description = "Lacework Proxy Scanner Key"
  type        = string
  default     = "hello-world"
}

variable "lw-account-name" {
  description = "Lacework Account Name"
  type        = string
  default     = "hello-world"
}