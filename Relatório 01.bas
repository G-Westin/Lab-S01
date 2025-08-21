Exercicio 1:
10 INPUT "Digite a primeira nota: ", N1
20 INPUT "Digite a segunda nota: ", N2
30 MEDIA = (N1 + N2) / 2
40 IF MEDIA > 60 THEN PRINT "Aprovado direto": END
50 IF MEDIA < 30 THEN PRINT "Reprovado direto": END
60 PRINT "Média entre 30 e 60. Será necessário inserir a NP3."
70 INPUT "Digite a nota da NP3: ", NP3
80 NOVAMEDIA = (N1 + N2 + NP3) / 3
90 IF NOVAMEDIA > 50 THEN PRINT "Aprovado pela NP3": END
100 PRINT "Reprovado na NP3"
0 END

Exercicio 2:
10 N = INT(RND * 101) 
20 PRINT "Jogo de Adivinhação"
30 PRINT "Tente adivinhar o número entre 0 e 100."
40 INPUT "Digite seu palpite: ", Palpite 
50 IF P = N THEN GOTO 200
60 IF P < N THEN PRINT "O número correto é MAIOR que "; Palpite
70 IF P > N THEN PRINT "O número correto é MENOR que "; Palpite
80 GOTO 50
90 PRINT "Parabéns!! Você acertou, o número era "; Numero
0 END

Exercicio 3:
10 PRINT "Conversor de Temperaturas"
20 INPUT "Digite a temperatura em graus Celsius: ", C
30 K = C + 273.15
40 F = (C * 9 / 5) + 32
50 PRINT "Temperatura em Celsius: "; C
60 PRINT "Temperatura em Kelvin : "; K
70 PRINT "Temperatura em Fahrenheit: "; F
0 END

Exercicio 4:
10 PRINT "Calculadora de IMC"
20 INPUT "Digite a altura em metros: ", A
30 INPUT "Digite o peso em quilogramas: ", P
40 IMC = P / (A * A)
50 PRINT "O valor do IMC calculado é: "; IMC
0 END
