module "brew" {
  source = "./brew"
}

module "keys" {
  source = "./keys"

  email          = var.email
  gpg_passphrase = var.gpg_passphrase
  name           = var.name
}
