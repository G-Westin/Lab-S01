exercicio 01 - fibonacci 

#include <iostream>
using namespace std; 

int fib(int n) {
  if (n == 0)
      return 0;
  else if (n == 1)
      return 1;
  else
      return fib(n - 1) + fib(n - 2);
}

int main() {
  int N;
  cout << "digite um numero: ";
  cin >> N;

cout << "fibonacci: " << fib(N) << endl;

  return 0;
}


exercicio 02 - soma dos arrays

#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho) {
    float soma = 0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}

int main() {
    int tamanho;
    cout << "digite o tamanho do array: ";
    cin >> tamanho;

    float arr[tamanho]; 

    cout << "digite os numeros do array: ";
    for (int i = 0; i < tamanho; i++) {
        cin >> arr[i];
    }

    cout << "soma = " << somarArray(arr, tamanho) << endl;

    return 0;
}


exercicio 03 - Media de notas com validação 

#include <iostream>
using namespace std;

int main() {
    int quantidade_Notas;
    double nota; 
	double soma = 0;
	double media;

    cout << "quantidade de notas: ";
    cin >> quantidade_Notas;

    for (int i = 0; i < quantidade_Notas; i++) {
        cout << "Digite a nota: " << (i + 1) << ": ";
        cin >> nota;

        while (nota < 0 || nota > 10) {
            cout << "nota invalida!, notas validas apenas entre(0-10)";
            cin >> nota;
        }

        soma += nota;
    }

    media = soma / quantidade_Notas;

    cout << "media final: " << media << endl;

    if (media >= 7)
        cout << "aluno aprovado!" << endl;
    else
        cout << "aluno reprovado!" << endl;

    return 0;
}


exercicio 04 - conversor de temperaturas 

#include <iostream>
using namespace std;

double celsiusParaFahrenheit(double c) { return (c * 9.0 / 5.0) + 32.0; }
double celsiusParaKelvin(double c) { return c + 273.15; }

int main() {
    int opcao;
    double celsius;

    do {
        cout << "\n=== Conversor de Unidades ===" << endl
             << "1. Celsius -> Fahrenheit" << endl
             << "2. Celsius -> Kelvin" << endl
             << "3. Sair" << endl
             << "Opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "digite a temperatura em celsius: ";
                cin >> celsius;
                cout << "temperatura em fahrenheit: " << celsiusParaFahrenheit(celsius) << endl;
                break;

            case 2:
                cout << "digite a temperatura em celsius: ";
                cin >> celsius;
                cout << "temperatura em kelvin: " << celsiusParaKelvin(celsius) << endl;
                break;

            case 3:
                cout << "encerrando..." << endl;
                break;

            default:
                cout << "opcao invalida!!!" << endl;
        }

    } while (opcao != 3);

    return 0;
}
