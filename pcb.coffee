{ load_yaml, file_exists, input } = require './stdlib.js'

listarProcessosPorEstado = (estadoDesejado) -> 
  if not file_exists 'processos.yaml'
    console.log 'Arquivo processos.yaml não encontrado.'
    process.exit 1

  processos = load_yaml 'processos.yaml'
  
  filtrados = processos.filter (p) ->
    estado = String(p.state or '').trim().toLowerCase()
    estado == estadoDesejado.toLowerCase()

  if filtrados.length == 0
    console.log "Nenhum processo no estado '#{estadoDesejado}'."
  else 
    console.log "Processos no estado '#{estadoDesejado}':"
    for p in filtrados
      console.log "- PID: #{p.pid}, Nome: #{p.name}, UID: #{p.uid}, IO-bound: #{p.io_bound}, Affinity: #{p.affinity}"

module.exports = listarProcessosPorEstado;