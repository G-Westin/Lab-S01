exercicio 01:

// Classe base
class Pokemon {
  #vida; // atributo privado

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
    console.log(`${this.nome} recebeu ${dano} de dano. Vida restante: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} atacou ${alvo.nome}, mas foi um ataque genérico.`);
  }
}

// Subclasse: Pokémon de Fogo
class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 20 + this.bonusAtaque;
    console.log(`${this.nome} lançou uma labareda! 🔥`);
    alvo.receberDano(dano);
  }
}

// Subclasse: Pokémon de Água
class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    const dano = 15;
    console.log(`${this.nome} atacou com jato d'água! 💧`);
    alvo.receberDano(dano);

    // cura um pouco após atacar
    console.log(`${this.nome} se curou em ${this.#curaBase} pontos de vida!`);
    this.#curar(this.#curaBase);
  }

  #curar(valor) {
    const novaVida = this.getVida() + valor;
    // usando truque interno: chamar receberDano(-cura)
    this.receberDano(-valor);
  }
}

// --- Demonstração ---
const charmander = new PokemonFogo("Charmander", 100, 10);
const squirtle = new PokemonAgua("Squirtle", 100, 5);

console.log("\n🔥 Início da batalha Pokémon! 🔥\n");

charmander.atacar(squirtle);
squirtle.atacar(charmander);

console.log("\n--- Estado final ---");
console.log(`${charmander.nome}: ${charmander.getVida()} HP`);
console.log(`${squirtle.nome}: ${squirtle.getVida()} HP`);


exercicio 02: 

class IExplorador {
  explorarTerritorio() {
    throw new Error("Metodo 'explorarTerritorio()' deve ser implementado.");
  }
}

class ODM_Gear {
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100;
  }

  usarGas(quantidade) {
    if (quantidade > this.#gasRestante) {
      console.log("Sem gas suficiente");
      this.#gasRestante = 0;
    } else {
      this.#gasRestante -= quantidade;
    }
  }

  getGas() {
    return this.#gasRestante;
  }
}

class Soldado extends IExplorador {
  #gear;

  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.#gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.#gear.usarGas(10);
    return `${this.nome} está explorando o territorio com o equipamento ${this.#gear.modelo}. Gás restante: ${this.#gear.getGas()}`;
  }

  verificarEquipamento() {
    return `Equipamento ${this.#gear.modelo} — Gás: ${this.#gear.getGas()}`;
  }
}

class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    if (soldado instanceof Soldado) {
      this.membros.push(soldado);
    } else {
      console.log("somente soldados podem ser adicionados ao esquadrao");
    }
  }

  explorarTerritorio() {
    console.log(`esquadrao liderado por ${this.lider.nome} iniciando exploração`);
    return this.membros.map(m => m.explorarTerritorio());
  }

  relatarStatus() {
    return this.membros.map(m => m.verificarEquipamento());
  }
}

const levi = new Soldado("Levi", "Modelo X");
const mikasa = new Soldado("Mikasa", "Modelo Y");
const eren = new Soldado("Eren", "Modelo Z");

const esquadrao = new Esquadrao(levi, [mikasa]);
esquadrao.adicionarMembro(eren);

console.log(esquadrao.explorarTerritorio().join("\n"));
console.log(esquadrao.relatarStatus().join("\n"));


exercicio 03: 

const readline = require('readline');

function question(rl, q) {
  return new Promise(resolve => rl.question(q, ans => resolve(ans)));
}

class criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = !!perigosa;
  }
}

class diario {
  constructor(autor) {
    this._autor = autor;
    this._enigmas = new Map();
    this._criaturas = [];
  }

  getautor() {
    return this._autor;
  }

  adicionarenigma(num, texto) {
    this._enigmas.set(num, texto);
  }

  decodificar(chave, num) {
    if (chave === this._autor && this._enigmas.has(num)) {
      return `enigma ${num}: ${this._enigmas.get(num)}`;
    } else {
      return "acesso negado.";
    }
  }

  adicionarcriatura(c) {
    this._criaturas.push(c);
  }

  getcriaturas() {
    return this._criaturas.slice();
  }
}

class personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class protagonista extends personagem {
  constructor(nome, idade, autor) {
    super(nome, idade);
    this.diario = new diario(autor);
  }
}

class cabanamisterio {
  constructor(dono) {
    this.dono = dono;
    this.funcionarios = [];
  }

  adicionarfucionario(p) {
    if (p instanceof personagem) this.funcionarios.push(p);
  }

  listarfuncionarios() {
    return this.funcionarios.map(f => `${f.nome}, ${f.idade} anos`);
  }
}

async function main() {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });

  const nomeprotagonista = await question(rl, 'nome do protagonista: ');
  const idadeprotagonista = parseInt(await question(rl, 'idade do protagonista: '), 10) || 0;
  const autor = await question(rl, 'nome do autor do diario (chave secreta): ');
  const prot = new protagonista(nomeprotagonista, idadeprotagonista, autor);

  const numenigmas = parseInt(await question(rl, 'quantos enigmas deseja adicionar? '), 10) || 0;
  for (let i = 0; i < numenigmas; i++) {
    const num = parseInt(await question(rl, `numero do enigma ${i + 1}: `), 10) || (i + 1);
    const texto = await question(rl, 'descricao do enigma: ');
    prot.diario.adicionarenigma(num, texto);
  }

  const chave = await question(rl, 'digite a chave para decodificar um enigma: ');
  const enigmanum = parseInt(await question(rl, 'numero do enigma para decodificar: '), 10) || 0;
  console.log(prot.diario.decodificar(chave, enigmanum));

  const nomecriatura = await question(rl, 'nome da criatura avistada (ou enter para pular): ');
  if (nomecriatura.trim() !== '') {
    const perigosaans = (await question(rl, 'é perigosa? (sim/nao): ')).trim().toLowerCase();
    const perigosa = perigosaans === 'sim' || perigosaans === 's';
    const c = new criatura(nomecriatura, perigosa);
    prot.diario.adicionarcriatura(c);
  }

  const cabana = new cabanamisterio(prot);
  const numfunc = parseInt(await question(rl, 'quantos funcionarios deseja adicionar? '), 10) || 0;
  for (let i = 0; i < numfunc; i++) {
    const nome = await question(rl, `nome do funcionario ${i + 1}: `);
    const idade = parseInt(await question(rl, 'idade: '), 10) || 0;
    cabana.adicionarfucionario(new personagem(nome, idade));
  }

  console.log('\nfuncionarios na cabana:');
  console.log(cabana.listarfuncionarios().join('\n') || '(nenhum)');

  console.log('\ncriaturas registradas:');
  const crias = prot.diario.getcriaturas();
  if (crias.length === 0) {
    console.log('(nenhuma)');
  } else {
    crias.forEach(c => console.log(`${c.nome} — perigosa: ${c.perigosa}`));
  }

  rl.close();
}

main().catch(err => console.error(err));

exercicio 04: 

const readline = require('readline');

function perguntar(rl, texto) {
  return new Promise(r => rl.question(texto, resp => r(resp)));
}

class caçador {
  constructor(nome, regiao, idade) {
    this.nome = nome;
    this.regiao = regiao;
    this.idade = idade;
  }
}

class especialista extends caçador {
  constructor(nome, regiao, idade, poder) {
    super(nome, regiao, idade);
    this.poder = poder;
  }

  localizar(lat, lon) {
    return `${this.nome} usa ${this.poder} em ${lat}, ${lon}`;
  }
}

class manipulador extends caçador {
  constructor(nome, regiao, idade, alvo) {
    super(nome, regiao, idade);
    this.alvo = alvo;
  }

  localizar(lat, lon) {
    return `${this.nome} está seguindo ${this.alvo.nome} em ${lat}, ${lon}`;
  }
}

class grupo {
  constructor() {
    this.lista = new Set();
  }

  inserir(caçador) {
    if (![...this.lista].some(x => x.nome === caçador.nome)) {
      this.lista.add(caçador);
    }
  }

  total() {
    return this.lista.size;
  }

  rastrear(lat, lon) {
    const info = [];
    for (const c of this.lista) {
      if (typeof c.localizar === 'function') info.push(c.localizar(lat, lon));
    }
    return info;
  }
}

async function iniciar() {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  const g = new grupo();

  const n = parseInt(await perguntar(rl, 'quantos caçadores deseja registrar? '), 10) || 0;

  for (let i = 0; i < n; i++) {
    const tipo = (await perguntar(rl, `caçador ${i + 1} é especialista ou manipulador? `)).toLowerCase();
    const nome = await perguntar(rl, 'nome: ');
    const regiao = await perguntar(rl, 'região: ');
    const idade = parseInt(await perguntar(rl, 'idade: '), 10) || 0;

    if (tipo === 'especialista') {
      const poder = await perguntar(rl, 'habilidade: ');
      g.inserir(new especialista(nome, regiao, idade, poder));
    } else {
      const alvoNome = await perguntar(rl, 'nome do alvo: ');
      const alvo = new caçador(alvoNome, 'desconhecida', 0);
      g.inserir(new manipulador(nome, regiao, idade, alvo));
    }
  }

  const lat = await perguntar(rl, 'latitude: ');
  const lon = await perguntar(rl, 'longitude: ');

  const resultado = g.rastrear(lat, lon);
  console.log('\nresultado do rastreio:');
  resultado.forEach(l => console.log(l));

  rl.close();
}

iniciar();
