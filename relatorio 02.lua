exercicio 01, multiplos de M e N: 

io.write("Digite o valor de M (início do intervalo): ")
local M = tonumber(io.read())

io.write("Digite o valor de N (fim do intervalo): ")
local N = tonumber(io.read())

io.write("Digite o valor de X (para encontrar múltiplos): ")
local X = tonumber(io.read())

print("Múltiplos de " .. X .. " no intervalo de " .. M .. " até " .. N .. ":")

for i = M, N do
    if i % X == 0 then
        print(i)
    end
end


exercicio 02, Maior valor da tabela 

-- Função para retornar o maior valor da tabela 
function maiorValor(tabela)
    local maior = tabela[1]
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

local numeros = {}

io.write("Quantos números deseja inserir? ")
local qtd = tonumber(io.read())

for i = 1, qtd do
    io.write("Digite o número " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

print("O maior valor da tabela é: " .. maiorValor(numeros))


exercicio 03, retorna numeros pares 

-- Função que retorna os números pares 
function filtrarPares(tabela)
    local pares = {}
    for i = 1, #tabela do
        if tabela[i] % 2 == 0 then
            table.insert(pares, tabela[i])
        end
    end
    return pares
end

local numeros = {}

io.write("Quantos números deseja inserir? ")
local qtd = tonumber(io.read())

for i = 1, qtd do
    io.write("Digite o número " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

local apenasPares = filtrarPares(numeros)

io.write("\nNúmeros pares encontrados: ")
for i = 1, #apenasPares do
    io.write(apenasPares[i] .. " ")
end
print()

exercicio 04, calculadora

-- Função calculadora
function calculadora(a, b, operador)
    if operador == "+" then
        return a + b
    elseif operador == "-" then
        return a - b
    elseif operador == "*" then
        return a * b
    elseif operador == "/" then
        if b == 0 then
            return "Erro: divisão por zero!"
        else
            return a / b
        end
    else
        return "Erro: operador inválido!"
    end
end

io.write("Digite o primeiro número: ")
local num1 = tonumber(io.read())

io.write("Digite o segundo número: ")
local num2 = tonumber(io.read())

io.write("Digite o operador (+, -, *, /): ")
local op = io.read()

local resultado = calculadora(num1, num2, op)
print("Resultado: " .. tostring(resultado))
