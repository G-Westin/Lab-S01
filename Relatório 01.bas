Exercicio 1:
10 INPUT "Digite a primeira nota: "; N1
20 INPUT "Digite a segunda nota: ";N2
30  LET MEDIA = (VAL(N1) + VAL(N2))/2
40 IF MEDIA > 60 THEN PRINT "Aprovado direto"
50 IF MEDIA < 30 THEN PRINT "Reprovado direto"
60 PRINT "Média entre 30 e 60. Será necessário inserir a NP3"
70 INPUT "Digite a nota da NP3: "; NP3
80 LET NOVAMEDIA = (VAL(NP3) + VAL(MEDIA))/2
90 IF NOVAMEDIA >= 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado na NP3"
0 END

Exercicio 2:
10 RANDOMIZE = TIMER 
20 N = INT(RND * 101)
25 PRINT "Jogo de advinhação"
30 PRINT "Tente advinhar o numero entre 0 e 100"
40 INPUT "Digite seu palpite"; P
50 IF P = N THEN GOTO 60
60 PRINT "Numero errado, tente denovo"
70 GOTO 40
80 PRINT "Parabens! Voce acertou!!"
0 END

Exercicio 3:
10 PRINT "Conversor de Temperaturas"
20 INPUT "Digite a temperatura em graus Celsius:"; C
30 K = (C + 273)
40 F = (C * 9 / 5) + 32
50 PRINT "Temperatura em Celsius:", C
60 PRINT "Temperatura em Kelvin :", K
70 PRINT "Temperatura em Fahrenheit:", F
80 END

Exercicio 4:
10 PRINT "Calculadora de IMC"
20 INPUT "Digite a altura em metros: "; A
30 INPUT "Digite o peso em quilogramas: "; P
40 IMC = P / (A * A)
50 PRINT "O valor do IMC calculado é: ", IMC
0 END
