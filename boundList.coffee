listarIOBound = ->
  { load_yaml } = require  './stdlib'
  processos = load_yaml 'processos.yaml'
  encontrados = false

  for p in processos when p.io_bound
    console.log "Nome: #{p.name}, PID: #{p.pid}"
    encontrados = true

  unless encontrados
    console.log "Nenhum processo I/O boundo encontrado."

module.exports = listarIOBound;