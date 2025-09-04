exercicio 01:

use std::io;

fn verificar_senha(senha: &str) -> bool {
    if senha.len() < 8 {
        return false;
    }

    let mut tem_numero = false;
    let mut tem_maiuscula = false;

    for c in senha.chars() {
        if c.is_ascii_digit() {
            tem_numero = true;
        }
        if c.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
    }

    tem_numero && tem_maiuscula
}

fn main() {
    loop {
        println!("Digite sua senha: ");
        let mut senha = String::new();
        io::stdin().read_line(&mut senha).expect("Erro ao ler a entrada");
        let senha = senha.trim();
        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida. Tente novamente!");
        }
    }
}

exercicio 02:

use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    let mut escolha = String::new();
    println!("Jogador 1, escolha 'par' ou 'impar':");
    io::stdin().read_line(&mut escolha).unwrap();
    let escolha = escolha.trim().to_lowercase();

    let mut num1 = String::new();
    println!("Jogador 1, digite um número:");
    io::stdin().read_line(&mut num1).unwrap();
    let num1: i32 = num1.trim().parse().unwrap();

    let mut num2 = String::new();
    println!("Jogador 2, digite um número:");
    io::stdin().read_line(&mut num2).unwrap();
    let num2: i32 = num2.trim().parse().unwrap();

    let soma = num1 + num2;
    let resultado_par = eh_par(soma);

    if (resultado_par && escolha == "par") || (!resultado_par && escolha == "impar") {
        println!("A soma foi {}. Jogador 1 venceu!", soma);
    } else {
        println!("A soma foi {}. Jogador 2 venceu!", soma);
    }
}


exercicio 03: 

use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
    let mut entrada = String::new();
    println!("Digite o número da tabuada:");
    io::stdin().read_line(&mut entrada).unwrap();
    let numero: i32 = entrada.trim().parse().unwrap();

    entrada.clear();
    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut entrada).unwrap();
    let limite_inferior: i32 = entrada.trim().parse().unwrap();

    entrada.clear();
    println!("Digite o limite superior:");
    io::stdin().read_line(&mut entrada).unwrap();
    let limite_superior: i32 = entrada.trim().parse().unwrap();

    imprimir_tabuada(numero, limite_inferior, limite_superior);
}


exercicio 04: 

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    (nota1 * 2.0 + nota2 * 3.0 + nota3 * 5.0) / 10.0
}

fn main() {
    let nota1 = 7.5;
    let nota2 = 8.0;
    let nota3 = 9.2;

    let media = calcular_media(nota1, nota2, nota3);
    println!("Média: {:.2}", media);

    if media >= 7.0 {
        println!("Aprovado");
    } else {
        println!("Reprovado");
    }
}

