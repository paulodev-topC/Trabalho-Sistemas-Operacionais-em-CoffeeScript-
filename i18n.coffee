#5 Programa de Internacionalização (i18n.coffee)

internationalization = -> 
    {load, file_exists} = require "./stdlib.js"

    mensagens =
    pt: "Oi, tudo bem?"
    en: "Hi, how are you?"
    es: "Hola, ¿todo bien?"
    fr: "Salut, ça va ?"
    de: "Hallo, wie geht’s?"

    idioma = "pt" # padrão

    if file_exists 'lang.config' 
        idioma = load('lang.config').trim().toLowerCase()

    mensagem = mensagens[idioma] ? mensagens["pt"]
    console.log mensagem

module.exports = internationalization
