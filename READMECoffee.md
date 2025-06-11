#1

{input, input_password, hash_sha256, load_yaml, save_yaml, file_exists} = require "./stdlib.js"

contas = if file_exists("contas.yaml") then load_yaml("contas.yaml") else []

login = input("Login: ")
senha = input_password("*")
senha_hash = hash_sha256(senha)

contas.push({ login, senha_hash })

save_yaml("contas.yaml", contas)
console.log "Conta criada com sucesso!"


#2

{input, input_password, hash_sha256, load_yaml, file_exists, play_sound} = require "./stdlib.js"

contas = if file_exists("contas.yaml") then load_yaml("contas.yaml") else []

login = input("Login: ")
senha = input_password("*")
senha_hash = hash_sha256(senha)

autenticado = contas.some (conta) -> conta.login == login and conta.senha_hash == senha_hash

if autenticado
  console.log "Login bem-sucedido! Bem-vindo, #{login}!"
  play_sound "audios/bemvindo.mp3"  # <--- Substitua pelo caminho real
else
  console.log "Login inválido!"
  play_sound "audios/acesso_negado.mp3"


#3

{load_yaml, file_exists, rand, play_sound} = require "./stdlib.js"

if not file_exists("contas.yaml")
  console.log "Arquivo de contas não encontrado."
  process.exit(1)

contas = load_yaml("contas.yaml")
usuarios = contas.map (c) -> c.login

if usuarios.length == 0
  console.log "Nenhum usuário para sortear."
  process.exit(1)

sorteado = usuarios[rand(0, usuarios.length - 1)]

console.log "Parabéns, #{sorteado}! Você ganhou um prêmio!"
play_sound "audios/#{sorteado}.mp3"  # Exemplo: audios/paulo.mp3


#4

{input, load_yaml, file_exists} = require "./stdlib.js"

if not file_exists("hd.yaml")
  console.log "Arquivo hd.yaml não encontrado."
  process.exit(1)

dados = load_yaml("hd.yaml")
usuario = input("Informe o nome do usuário: ")

arquivos = dados.filter (item) -> item.usuario == usuario
total = arquivos.reduce ((acc, item) -> acc + item.tamanho), 0

console.log "Arquivos de #{usuario}:"
arquivos.forEach (a) -> console.log "- #{a.arquivo} (#{a.tamanho} MB)"
console.log "Total ocupado: #{total} MB"


#5 Programa de Internacionalização (i18n.coffee)

{load, file_exists} = require "./stdlib.js"

mensagens =
  pt: "Oi, tudo bem?"
  en: "Hi, how are you?"
  es: "Hola, ¿todo bien?"
  fr: "Salut, ça va ?"
  de: "Hallo, wie geht’s?"

idioma = "pt"
if file_exists("lang.config")
  idioma = load("lang.config").strip().lower()

console.log mensagens[idioma] or mensagens["pt"]

#Observações:

#Os áudios para play_sound devem estar gravados #com o nome correspondente ao login ou ação #(paulo.mp3, bemvindo.mp3, etc.).

#Os arquivos contas.yaml, hd.yaml e lang.config #são criados/lidos conforme necessário.

