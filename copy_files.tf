locals {
  copy_files = [
    ".zshrc",
    ".zsh_aliases",
    ".gnupg/gpg.conf",
    ".gnupg/gpg-agent.conf",
    ".config/git/ignore",
    ".config/micro/bindings.json",
    ".config/micro/settings.json",
    ".config/starship.toml",
  ]
}

resource "local_file" "copy_file" {
  for_each = toset(local.copy_files)
  content  = file("${path.module}/copy_files/${each.value}")
  filename = pathexpand("~/${each.value}")
}
