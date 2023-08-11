variable "person_name" {
  description = "Euphoric person that can take this test :)"
  type        = string
  default     = "mateus"
}

variable "rg_name" {
  description = "Nome do resource group"
  type        = string
  default     = "rg-mateusclira"
}

variable "location" {
  description = "Azure location that deploy resources"
  type        = string
  default     = "eastus"
}

variable "ENV_ID" {}
variable "SUBSCRIPTION_ID" {}
