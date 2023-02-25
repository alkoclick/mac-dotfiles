resource "github_user_ssh_key" "public_key" {
  key   = tls_private_key.this.public_key_openssh
  title = format("%s@%s", data.external.info.result.user, data.external.info.result.host)
}

resource "github_user_gpg_key" "this" {
  # Github needs newlines, but the JSON output cannot contain them,
  # so we have done an intermediate replacement with | which we are now reverting
  armored_public_key = replace(data.external.gpg_key_armored.result.armored_key, "|", "\n")
}
