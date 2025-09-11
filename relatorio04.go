exercicio 1 - classificação de numeros

package main

import (
	"fmt"
)

// Função que classifica o número
func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo"
	} else if num < 0 {
		return "Negativo"
	} else {
		return "Zero"
	}
}

func main() {
	var numero int

	fmt.Print("Digite um número: ")
	fmt.Scan(&numero)

	resultado := classificar_numero(numero)
	fmt.Println("O número é:", resultado)
}


exercicio 02 - par ou impar com switch

package main

import (
	"fmt"
)

func main() {
	var num int

	fmt.Print("digite o numero: ")
	fmt.Scan(&num)

	switch num % 2 {
	case 1:
		fmt.Println("numero impar")
	default:
		fmt.Println("numero par")
	}
}


exercicio 03 - sequencia fibonacci 

package main

import (
	"fmt"
)

func fib(n int) {
	a, b := 0, 1
	for i := 0; i < n; i++ {
		fmt.Print(a, " ")
		a, b = b, a+b
	}
	fmt.Println()
}

func main() {
	var quant int

	fmt.Print("quantidade de elementos da sequncia:  ")
	fmt.Scan(&quant)

	fib(quant)
}


exercicio 04 - Verificar login

package main

import (
	"fmt"
)

func verificarLogin(usuario, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	} else {
		return false
	}
}

func main() {
	for {
		var usuario, senha string

		fmt.Print("Digite o usuário: ")
		fmt.Scan(&usuario)
		fmt.Print("Digite a senha: ")
		fmt.Scan(&senha)

		if verificarLogin(usuario, senha) {
			fmt.Println("login bem-sucedido!!")
			break
		} else {
			fmt.Println("usuario ou senha incorretos!!")
		}
	}
}
