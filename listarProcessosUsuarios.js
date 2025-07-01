(function() {
  var file_exists, i, j, k, len, len1, len2, load_yaml, login, nomes, p, procUser, processos, ref, u, uidToLogin, usuarios;

  ({load_yaml, file_exists} = require('./stdlib.js'));

  if (!file_exists('processos.yaml')) {
    console.log('Arquivo processos.yaml não encontrado');
    process.exit(1);
  }

  if (!file_exists('usuarios.yaml')) {
    console.log('Arquivo usuario.yaml não encontrado');
    process.exit(1);
  }

  processos = load_yaml('processos.yaml');

  usuarios = load_yaml('usuarios.yaml');

  uidToLogin = {};

  for (i = 0, len = usuarios.length; i < len; i++) {
    u = usuarios[i];
    uidToLogin[u.uid] = u.login;
  }

  console.log('--- processos e seus usuários ---');

  for (j = 0, len1 = processos.length; j < len1; j++) {
    p = processos[j];
    login = (ref = uidToLogin[p.uid]) != null ? ref : '(usuário desconhecido)';
    console.log(`PID: ${p.pid}, Nome: ${p.name}, Usuário: ${login}`);
  }

  console.log('\n--- Processos e por usuário ---');

  for (k = 0, len2 = usuarios.length; k < len2; k++) {
    u = usuarios[k];
    procUser = processos.filter(function(p) {
      return p.uid === u.uid;
    });
    if (procUser.length > 0) {
      nomes = procUser.map(function(p) {
        return `${p.name} (PID ${p.pid})`;
      });
      nomes = procUser.map(function(p) {
        return `${p.name} (PID ${p.pid})`;
      });
      console.log(`${u.login}: ${nomes.join(', ')}`);
    } else {
      console.log(`${u.login}: Nenhum processo iniciado`);
    }
  }

}).call(this);


//# sourceMappingURL=listarProcessosUsuarios.js.map
//# sourceURL=coffeescript