exercicio 01:

using System;

class IntegranteDaSociedade
{
    private string nome;
    private string especie;
    private string papel;

    public IntegranteDaSociedade(string nome, string especie, string papel)
    {
        this.nome = nome;
        this.especie = especie;
        this.papel = papel;
    }

    public void MostrarDetalhes()
    {
        Console.WriteLine("integrante da sociedade");
        Console.WriteLine("nome: " + nome);
        Console.WriteLine("especie: " + especie);
        Console.WriteLine("papel: " + papel);
        Console.WriteLine("\n");
    }
}

class ProgramaPrincipal
{
    static void Main()
    {
        IntegranteDaSociedade aragorn = new IntegranteDaSociedade("aragorn", "humano", "protetor");
        IntegranteDaSociedade legolas = new IntegranteDaSociedade("legolas", "elfo", "arqueiro");

        aragorn.MostrarDetalhes();
        legolas.MostrarDetalhes();
    }
}

exercicio 02:

using System;
using System.Collections.Generic;

class Pokemon
{
    public string Nome { get; set; }

    public Pokemon(string nome)
    {
        Nome = nome;
    }

    public virtual void Atacar()
    {
        Console.WriteLine(Nome + "realiza um ataque");
    }
}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine(Nome + " lanca uma labareda");
    }
}

class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine(Nome + " dispara um jato de agua");
    }
}

class ProgramaPrincipal
{
    static void Main()
    {
        List<Pokemon> equipe = new List<Pokemon>();

        Pokemon charizard = new PokemonDeFogo("charizard");
        Pokemon blastoise = new PokemonDeAgua("blastoise");

        equipe.Add(charizard);
        equipe.Add(blastoise);

        foreach (Pokemon p in equipe)
        {
            p.Atacar();
        }
    }
}


exercicio 03:

using System;
using System.Collections.Generic;

class feitico
{
    public string nome { get; set; }
    public string efeito { get; set; }

    public feitico(string nome, string efeito)
    {
        this.nome = nome;
        this.efeito = efeito;
    }
}

class grimorio
{
    private List<feitico> lista_de_feiticos = new List<feitico>();

    public void adicionar_feitico(feitico novo_feitico)
    {
        lista_de_feiticos.Add(novo_feitico);
    }

    public void mostrar_feiticos()
    {
        Console.WriteLine("feiticos no grimorio:");
        foreach (var f in lista_de_feiticos)
        {
            Console.WriteLine("- " + f.nome + " (" + f.efeito + ")");
        }
        Console.WriteLine();
    }
}

class ferramenta
{
    public string nome { get; set; }

    public ferramenta(string nome)
    {
        this.nome = nome;
    }
}

class maga
{
    public string nome { get; set; }
    private grimorio grimorio;
    private List<ferramenta> ferramentas;

    public maga(string nome, List<ferramenta> ferramentas)
    {
        this.nome = nome;
        grimorio = new grimorio();
        this.ferramentas = ferramentas;
    }

    public grimorio acessar_grimorio()
    {
        return grimorio;
    }

    public void mostrar_ferramentas()
    {
        Console.WriteLine("ferramentas de " + nome + ":");
        foreach (var f in ferramentas)
        {
            Console.WriteLine("- " + f.nome);
        }
        Console.WriteLine();
    }
}

class programaprincipal
{
    static void Main()
    {
        List<ferramenta> ferramentas = new List<ferramenta>
        {
            new ferramenta("lanterna"),
            new ferramenta("mapa magico"),
            new ferramenta("cajado antigo")
        };

        maga frieren = new maga("frieren", ferramentas);

        frieren.acessar_grimorio().adicionar_feitico(new feitico("raio de gelo", "congela inimigos"));
        frieren.acessar_grimorio().adicionar_feitico(new feitico("escudo mistico", "cria uma barreira de energia"));

        frieren.mostrar_ferramentas();
        frieren.acessar_grimorio().mostrar_feiticos();
    }
}


exercicio 04: 7

using System;

abstract class monstrosombrio
{
    public string nome { get; set; }

    public monstrosombrio(string nome)
    {
        this.nome = nome;
    }

    public abstract void mover();
}

class zumbi : monstrosombrio
{
    public zumbi(string nome) : base(nome) { }

    public override void mover()
    {
        Console.WriteLine($"{nome} anda lento em busca das vitimas");
    }
}

class espectro : monstrosombrio
{
    public espectro(string nome) : base(nome) { }

    public override void mover()
    {
        Console.WriteLine($"{nome} atravessa as paredes e se move rapido");
    }
}

class programaprincipal
{
    static void Main()
    {
        monstrosombrio[] horda = new monstrosombrio[]
        {
            new zumbi("zumbi lento"),
            new espectro("espectro rapido")
        };

        foreach (var m in horda)
        {
            m.mover();
        }
    }
}
