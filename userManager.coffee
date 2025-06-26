userManager = ->
    { load_yaml, file_exists, input } = require './stdlib'

    if not file_exists 'hd.yaml'
        console.log 'Arquivo hd.yaml não encontrado.'
        process.exit 1

    dados = load_yaml 'hd.yaml'

    usuario = input 'Informe o nome do usuário: '
    usuario = usuario.toLowerCase()

    arquivos = dados.filter (item) -> item.usuario == usuario

    if arquivos.length == 0
        console.log "Nenhum arquivo encontrado para o usuário '#{usuario}'."
        process.exit 0

    total = arquivos.reduce ((acc, item) -> acc + item.tamanho), 0

    console.log "Arquivos de #{usuario}:"
    for a in arquivos
        console.log "- #{a.arquivo} (#{a.tamanho} MB)"

    console.log "Total ocupado: #{total} MB"

module.exports = userManager;
