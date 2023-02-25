data "external" "info" {
  program = ["bash", "${path.module}/scripts/system_info.sh"]
}

data "external" "gpg_key_armored" {
  program = ["bash", "-c", format("echo %s", jsonencode({
    # The JSON output cannot contain newlines but Github wants them later, so we turn them to | instead
    "\"armored_key\"" : format("\"$(gpg --armor --export %s | tr '\r\n' '|')\"", local.gpg_key_id)
  }))]
}
