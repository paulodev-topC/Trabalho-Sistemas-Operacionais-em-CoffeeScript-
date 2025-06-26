{ input } = require './stdlib.js'
listarProcessosPorEstado = require './listarProcessosPorEstado'

menuPCB = ->
  while true
    console.log "\n------- Monitor de processos -------"
    console.log "1 - Listar processos em estado READY"
    console.log "2 - Listar processos em estado RUNNING"
    console.log "3 - Listar processos em estado BLOCKED"
    console.log "0 - Voltar"
    opcao = input "Escolha uma opção: "

    switch opcao
      when '1' then listarProcessosPorEstado 'ready'
      when '2' then listarProcessosPorEstado 'running'
      when '3' then listarProcessosPorEstado 'blocked'
      when '0' then break
      else console.log 'Opção inválida.'

module.exports = menuPCB
