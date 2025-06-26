const fs = require('fs');
const readlineSync = require('readline-sync');
const crypto = require('crypto');
const yaml = require('js-yaml');
const player = require('play-sound')();

module.exports = {
    input: (msg) => readlineSync.question(msg),
    input_password: (mask) => readlineSync.question('senha: ', { hideEchoBack: true, mask}),
    hash_sha256: (str) => crypto.createHash('sha256').update(str).digest('hex'),
    load_yaml: (file) => yaml.load(fs.readFileSync(file, 'utf8')),
    save_yaml: (file, data) => fs.writeFileSync(file, yaml.dump(data)),
  file_exists: (file) => fs.existsSync(file),
  play_sound: (file) => player.play(file, (err) => {
    if (err) console.log('Erro ao tocar áudio: ', err);
  }),
  rand: (min, max) => Math.floor(Math.random() * (max - min + 1)) + min,
  load: (file) => fs.readFileSync(file, 'utf8'),
};