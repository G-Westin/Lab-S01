exercicio 01: 

class Personagem:
    def __init__(self, vida_inicial, nivel_resistencia):
        self._vida = vida_inicial
        self._resistencia = nivel_resistencia

    @property
    def pontos_vida(self):
        return self._vida

    @pontos_vida.setter
    def pontos_vida(self, novo_valor):
        if novo_valor < 0:
            print("Valor inválido: a vida não pode ser negativa!")
        else:
            self._vida = novo_valor

    def __str__(self):
        return f"O personagem possui {self._vida} pontos de vida e resistência {self._resistencia}."


class Cavaleiro(Personagem):
    def __init__(self, vida_inicial, nivel_resistencia, usa_armadura_pesada):
        super().__init__(vida_inicial, nivel_resistencia)
        self.armadura_pesada = usa_armadura_pesada

    def __str__(self):
        if self.armadura_pesada:
            armadura = "usa armadura pesada"
        else:
            armadura = "não usa armadura pesada"
        return f"O cavaleiro {armadura}, com {self._vida} de vida e resistência {self._resistencia}."


heroi = Personagem(90, 40)
print(heroi)

guerreiro = Cavaleiro(130, 75, True)
print(guerreiro)

guerreiro.pontos_vida = 110
print(guerreiro)


exercicio 02: 

from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass


class Tanque(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} ativou seu escudo")


class Dano(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} disparou uma rajada de energia")


herois = [
    Tanque("Reinhardt"),
    Dano("Soldado 76")
]

for h in herois:
    h.usar_ultimate()


exercicio 03:

class ArmaCorpoACorpo:
    def __init__(self, tipo_arma):
        self.tipo_arma = tipo_arma

    def __str__(self):
        return f"Arma corpo a corpo: {self.tipo_arma}"


class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} empunha {self.arma.tipo_arma}"


class Joker:
    def __init__(self, membros):
        self.arma = ArmaCorpoACorpo("Faca de Aço")
        self.equipe = membros

    def mostrar_equipe(self):
        print(f"Joker está armado com {self.arma.tipo_arma}.")
        print("Membros do time Phantom Thieves:")
        for membro in self.equipe:
            print(f"- {membro.nome} usa {membro.arma.tipo_arma}")


arma1 = ArmaCorpoACorpo("Cajado Místico")
arma2 = ArmaCorpoACorpo("Revólver de Prata")

m1 = PhantomThieves("Morgana", arma1)
m2 = PhantomThieves("Ryuji", arma2)

grupo = [m1, m2]

joker = Joker(grupo)
joker.mostrar_equipe()


exercicio 04: 

from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao

class NetRunner(Cibernetico):
    def __init__(self, implante):
        self.implante = implante

    def realizar_hack(self):
        print(f"Hack realizado usando o implante {self.implante.funcao} que custou {self.implante.custo}.")

class Faccao:
    def __init__(self):
        self.membros = []

    def adicionar_membro(self, cibernetico):
        self.membros.append(cibernetico)

    def executar_hacks(self):
        for membro in self.membros:
            membro.realizar_hack()

if __name__ == "__main__":
    nr1 = NetRunner(Implante(5000, "Invasao de sistemas"))
    nr2 = NetRunner(Implante(3000, "Desativar cameras"))
    nr3 = NetRunner(Implante(4500, "Roubo de dados"))

    faccao = Faccao()
    faccao.adicionar_membro(nr1)
    faccao.adicionar_membro(nr2)
    faccao.adicionar_membro(nr3)

    faccao.executar_hacks()
