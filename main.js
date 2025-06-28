(function() {
  var IniciarMenu, clearScreen, createAccount, input, internationalization, listarIOBound, listarProcessosPorEstado, loginAccount, menu, userManager, usersSort;

  ({input} = require('./stdlib'));

  createAccount = require('./createAccount');

  loginAccount = require('./loginAccount');

  userManager = require('./userManager');

  usersSort = require('./usersSort');

  internationalization = require('./i18n');

  clearScreen = require('./clearScreen');

  listarProcessosPorEstado = require('./pcb');

  listarIOBound = function() {
    var encontrado, encontrados, i, len, load_yaml, p, processos;
    ({load_yaml} = require('./stdlib'));
    processos = load_yaml('processos.yaml');
    encontrados = false;
    for (i = 0, len = processos.length; i < len; i++) {
      p = processos[i];
      if (!p.io_bound) {
        continue;
      }
      console.log(`Nome: ${p.name}, PID: ${p.pid}`);
      encontrado = true;
    }
    if (!encontrados) {
      return console.log("Nenhum processo I/O boundo encontrado.");
    }
  };

  menu = function() {
    console.log("\n===== MENU =====");
    console.log("1 - Criar Conta");
    console.log("2 - Login");
    console.log("3 - Sorteio");
    console.log("4 - Verificar espaco usado");
    console.log("5 - Listar processos por estado");
    console.log("6 - Lstar processos I/O bound");
    console.log("0 - Sair");
    internationalization();
    return input("Escolha uma opcao: ");
  };

  IniciarMenu = function() {
    var escolha, opcaoEstado, results;
    results = [];
    while (true) {
      escolha = menu();
      clearScreen();
      input('Pressione Enter para continuar ...');
      switch (escolha) {
        case '1':
          results.push(createAccount());
          break;
        case '2':
          results.push(loginAccount());
          break;
        case '3':
          results.push(usersSort());
          break;
        case '4':
          results.push(userManager());
          break;
        case '5':
          console.log("\n--- Escolha o estado ---");
          console.log("1 - ready");
          console.log("2 - running");
          console.log("3 - blocked");
          opcaoEstado = input("Escolha: ");
          switch (opcaoEstado) {
            case '1':
              results.push(listarProcessosPorEstado('ready'));
              break;
            case '2':
              results.push(listarProcessosPorEstado('running'));
              break;
            case '3':
              results.push(listarProcessosPorEstado('blocked'));
              break;
            default:
              results.push(console.log("Estado invalido."));
          }
          break;
        case '6':
          results.push(listarIOBound());
          break;
        case '0':
          console.log("Saindo...");
          results.push(process.exit(0));
          break;
        default:
          results.push(console.log("Opcao inválida. Tente novamente."));
      }
    }
    return results;
  };

  IniciarMenu();

}).call(this);


//# sourceMappingURL=main.js.map
//# sourceURL=coffeescript