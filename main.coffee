{ input } = require './stdlib'

createAccount = require './createAccount'
loginAccount = require './loginAccount'
userManager = require './userManager'
usersSort = require './usersSort'
internationalization = require './i18n'
clearScreen = require './clearScreen'
listarProcessosPorEstado = require './pcb'

# Importa módulo e garante que processList seja a função exportada
processListModule = require './listarProcessosUsuarios'
processList = if typeof processListModule is 'function' then processListModule else processListModule.default

listarIOBound = ->
  { load_yaml } = require './stdlib'
  processos = load_yaml 'processos.yaml'
  encontrados = false

  for p in processos when p.io_bound
    console.log "Nome: #{p.name}, PID: #{p.pid}"
    encontrados = true

  unless encontrados
    console.log "Nenhum processo I/O boundo encontrado."

menu = ->
  console.log "\n===== MENU ====="
  console.log "1 - Criar Conta"
  console.log "2 - Login"
  console.log "3 - Sorteio"
  console.log "4 - Verificar espaco usado"
  console.log "5 - Listar processos por estado"
  console.log "6 - Listar processos I/O bound"
  console.log "7 - Listar processsos dos usuários"
  console.log "0 - Sair"
  internationalization()
  input "Escolha uma opcao: "

IniciarMenu = ->
  while true
    escolha = menu()
    clearScreen()
    input 'Pressione Enter para continuar ...'
    switch escolha
      when '1' then createAccount()
      when '2' then loginAccount()
      when '3' then usersSort()
      when '4' then userManager()
      when '5'
        console.log "\n--- Escolha o estado ---"
        console.log "1 - ready"
        console.log "2 - running"
        console.log "3 - blocked"
        opcaoEstado = input "Escolha: "
        switch opcaoEstado
          when '1' then listarProcessosPorEstado 'ready'
          when '2' then listarProcessosPorEstado 'running'
          when '3' then listarProcessosPorEstado 'blocked'
          else console.log "Estado invalido."
      when '6' then listarIOBound()
      when '7' then processList()
      when '0'
        console.log "Saindo..."
        process.exit 0
      else
        console.log "Opcao inválida. Tente novamente."

IniciarMenu()
