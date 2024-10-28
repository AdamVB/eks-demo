# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "example_api_key" {
  description = "example api key coming from github secret"
  type        = string
  default     = "hello-world"
}

