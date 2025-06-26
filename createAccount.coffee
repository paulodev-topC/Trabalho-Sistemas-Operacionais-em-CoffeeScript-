createAccount = ->
  {input, input_password, hash_sha256, load_yaml, save_yaml, file_exists} = require "./stdlib.js"
  contas = if file_exists "contas.yaml" then load_yaml "contas.yaml" else []

  console.log "Seja bem-vindo! Vamos criar sua conta!"
  login = input "Login: "

  if contas.some (conta) -> conta.login == login
    console.log "Erro! Conta já existe!"
    return

  senha = input_password "*"
  senha_hash = hash_sha256 senha

  contas.push {login, senha_hash}
  save_yaml "contas.yaml", contas
  console.log "Conta criada com sucesso!"


module.exports = createAccount;
