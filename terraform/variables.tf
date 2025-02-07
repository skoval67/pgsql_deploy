variable "gcp_token" {}

variable "project" {
  default = "gcp-project"
}

variable "region" {
  default = "europe-west6"
}

variable "zone" {
  default = "europe-west6-a"
}

variable "ssh_keys" {
  type = list(object({
    publickey = string
    user      = string
  }))
  description = "list of public ssh keys that have access to the VM"
  default = [
    {
      user      = ""
      publickey = ""
    }
  ]
}
