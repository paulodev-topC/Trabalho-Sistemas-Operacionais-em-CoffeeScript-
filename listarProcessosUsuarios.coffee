{ load_yaml, file_exists} = require './stdlib.js'
if not file_exists('processos.yaml')
    console.log 'Arquivo processos.yaml não encontrado'
    process.exit 1

if not file_exists('usuarios.yaml')
    console.log 'Arquivo usuario.yaml não encontrado'
    process.exit 1

processos = load_yaml('processos.yaml')
usuarios = load_yaml('usuarios.yaml')

uidToLogin = {}
for u in usuarios
  uidToLogin[u.uid] = u.login

console.log '--- processos e seus usuários ---'
for p in processos
    login = uidToLogin[p.uid] ? '(usuário desconhecido)'
    console.log "PID: #{p.pid}, Nome: #{p.name}, Usuário: #{login}"

console.log '\n--- Processos e por usuário ---'
for u in usuarios
    procUser = processos.filter (p) -> p.uid == u.uid
    if procUser.length > 0
        nomes = procUser.map (p) -> "#{p.name} (PID #{p.pid})"
        nomes = procUser.map (p) -> "#{p.name} (PID #{p.pid})"
        console.log "#{u.login}: #{nomes.join(', ')}"
    else 
        console.log "#{u.login}: Nenhum processo iniciado"