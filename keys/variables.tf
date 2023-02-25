variable "name" {
  description = "The name that should be used as the author and owner of keys."
  type        = string
}

variable "email" {
  description = "The email throughout the configuration for things such as Git."
  type        = string
}

variable "gpg_passphrase" {
  description = "The passphrase to be used for GPG keys"
  type        = string
  sensitive   = true
}
