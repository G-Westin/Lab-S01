exercicio 01: 

alto_impacto(D) :-
    disciplina(D, Creditos, _),
    Creditos > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

exercicio 02:

falta_concluir(Aluno, Disciplina) :-
    prerequisito(Disciplina, Pre),
    \+ concluiu(Aluno, Pre).

aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, _, Area),
    Area \= fundamental,
    \+ falta_concluir(Aluno, Disciplina).

exercicio 03: 

especialista_comp(Aluno) :-
    concluiu(Aluno, D1),
    concluiu(Aluno, D2),
    D1 \= D2,
    disciplina(D1, _, computacao),
    disciplina(D2, _, computacao).

deficiencia_mat(Aluno) :-
    \+ (concluiu(Aluno, D), disciplina(D, _, matematica)).

exercicio 04: 

disciplina_raiz(D) :-
    disciplina(D, _, _),
    \+ pre_requisito(D, _).

disciplina_folha(D) :-
    disciplina(D, _, _),
    \+ pre_requisito(_, D).

