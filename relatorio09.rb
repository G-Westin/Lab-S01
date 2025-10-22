exercicio 01: 

class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @_nome = nome
    @_preco_base = preco_base
  end

  def preco_base
    @_preco_base
  end

  def preco_base=(valor)
    if valor > 0
      @_preco_base = valor
    else
      puts "O preço deve ser positivo!"
    end
  end

  def preco_final
    @_preco_base
  end

  def to_s
    "Drink: #{@_nome} | Preço base: $#{@_preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    @_preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Lenda: #{@_nome} | Preço base: $#{@_preco_base} | Anos: #{@anos_desde_criacao} | Preço final: $#{preco_final}"
  end
end

puts "Digite o nome do drink:"
nome = gets.chomp

puts "Digite o preço base:"
preco = gets.chomp.to_f

puts "Digite quantos anos desde a criação:"
anos = gets.chomp.to_i

drink = DrinkLenda.new(nome, preco, anos)

puts drink.to_s


exercicio 02: 

class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "Este método deve ser implementado nas subclasses!"
  end

  def to_s
    "#{@nome} toca #{@instrumento}"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    "#{@nome} está tocando a peça '#{peca}' ao piano com emacao"
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    "#{@nome} está interpretando '#{peca}' no violino com grande tecnica"
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "🎼 Iniciando ensaio da peca '#{peca}'..."
    @musicos.each do |musico|
      puts musico.tocar_partitura(peca)
    end
  end

  def mudar_foco(estado)
    @musicos.map { |m| "#{m.nome} agora está #{estado}!" }
  end
end

puts "Digite o nome da peça a ser tocada:"
peca = gets.chomp

musicos = [
  Pianista.new("Kousei", "piano"),
  Violinista.new("Kaori", "violino")
]

maestro = Maestro.new(musicos)
# Inicia o ensaio
maestro.iniciar_ensaio(peca)

puts "\nMudando foco dos musicos"
puts maestro.mudar_foco("Concentrado")


exercicio 03:

class MicroondasUnidade
  def aquecer(tempo)
    puts "Aquecendo por #{tempo} segundos..."
  end
end

class DMail
  attr_reader :texto, :hora

  def initialize(texto, hora)
    @texto = texto
    @hora = hora
  end

  def to_s
    "D-Mail #{@hora} → #{@texto}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @modulo = MicroondasUnidade.new
    @mensagens = []
  end

  def enviar
    print "Conteudo do D-Mail: "
    texto = gets.chomp
    print "Hora de envio (ex: 09:45): "
    hora = gets.chomp
    @modulo.aquecer(4)
    @mensagens << DMail.new(texto, hora)
    puts "D-Mail transmitido."
  end

  def filtrar(hora_limite)
    selecionados = @mensagens.select { |m| m.hora > hora_limite }
    if selecionados.empty?
      puts "Nenhum D-Mail apos #{hora_limite}."
    else
      puts "D-Mails depois de #{hora_limite}:"
      selecionados.each { |m| puts m }
    end
  end
end

fone = TelefoneDeMicroondas.new

loop do
  puts "\n1 - Enviar D-Mail"
  puts "2 - Listar D-Mails após um horário"
  puts "3 - Sair"
  print "Escolha: "
  op = gets.chomp.to_i

  case op
  when 1
    fone.enviar
  when 2
    print "Digite o horario de corte: "
    hora = gets.chomp
    fone.filtrar(hora)
  when 3
    puts "Encerrando..."
    break
  else
    puts "Opcao invalida."
  end
end


exercicio 04: 

module Rastreador
  def localizar(hora)
    "Posição de #{nome} registrada às #{hora}"
  end
end

module Ameaçador
  def risco
    rand(1..100)
  end
end

class Pessoa
  attr_accessor :nome, :localizacao
  def initialize(nome)
    @nome = nome
  end
end

class Detetive < Pessoa
  include Rastreador
end

class MestreDoCrime < Pessoa
  include Rastreador
  include Ameaçador
end

class Mundo
  def initialize(participantes)
    @participantes = participantes
  end

  def identificar
    @participantes.select { |p| p.respond_to?(:risco) }
  end

  def listar_ameacas
    perigosos = identificar
    if perigosos.empty?
      puts "Nenhum perigo detectado."
    else
      perigosos.each do |p|
        puts "#{p.nome} apresenta risco #{p.risco}%"
      end
    end
  end
end

print "Localização de Sherlock: "
loc_sherlock = gets.chomp
print "Localização de Moriarty: "
loc_moriarty = gets.chomp

sherlock = Detetive.new("Sherlock")
moriarty = MestreDoCrime.new("Moriarty")

sherlock.localizacao = loc_sherlock
moriarty.localizacao = loc_moriarty

lista = [sherlock, moriarty]
cenario = Mundo.new(lista)

puts sherlock.localizar("10:00")
puts moriarty.localizar("10:00")

cenario.listar_ameacas
