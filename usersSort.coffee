usersSort = -> 
    {load_yaml, file_exists, rand, play_sound} = require "./stdlib.js"

    if not file_exists("contas.yaml")
        console.log "Arquivo de contas não encontrado."
        process.exit(1)

    contas = load_yaml("contas.yaml")
    usuarios = contas.map (c) -> c.login

    if usuarios.length == 0
        console.log "Nenhum usuário para sortear."
        process.exit(1)

    console.log("Realizando sorteio ...");
    sorteado = usuarios[rand(0, usuarios.length - 1)]

    console.log "Parabéns, #{sorteado}! Você ganhou um prêmio!"
    play_sound "audios/#{sorteado}.mp3"  # Exemplo: audios/paulo.mp3

module.exports = usersSort;
