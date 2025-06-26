loginAccount = -> 
    {input, input_password, hash_sha256, load_yaml, file_exists, play_sound} = require "./stdlib.js"

    contas = if file_exists("contas.yaml") then load_yaml("contas.yaml") else []

    
    login = input 'login: '
    senha = input_password("*")
    senha_hash = hash_sha256(senha)

    autenticado = contas.some (conta) -> conta.login == login and conta.senha_hash == senha_hash

    if autenticado
        console.log "Login bem-sucedido! Bem-vindo, #{login}!"
        play_sound "audios/bemvindo.mp3"  # <--- Substitua pelo caminho real
    else
        console.log "Login inválido!"
        play_sound "audios/acesso_negado.mp3"

module.exports = loginAccount;