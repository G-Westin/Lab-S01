exercico 01: 

(defun calcular-dose (peso idade)
  (cond
    ((or (< idade 5) (< peso 20)) 10)
    ((and (>= idade 5) (<= idade 12) (>= peso 20)) 25)
    (t 50)))

(defun fator-preco (valor-base nome)
  (cond
    ((string= nome "Ginseng") (* valor-base 3.0))
    ((string= nome "Lotus") (* valor-base 1.5))
    (t valor-base)))

(let* ((idade-paciente 14)
       (peso-paciente 60)
       (preco-inicial 10)
       (erva-escolhida "Lotus")
       (dose (calcular-dose peso-paciente idade-paciente))
       (preco-final (fator-preco preco-inicial erva-escolhida)))
  (format t "Dose calculada: ~A ml~%" dose)
  (format t "Valor final: ~A moedas~%" preco-final))


exercicio 01: 

(defstruct criatura
  nome
  ambiente
  perigo
  vida)

(setq catalogo
      (list
       (make-criatura :nome "Peixe Luz" :ambiente "Safe Shallows" :perigo "Baixa" :vida 30)
       (make-criatura :nome "Reaper Leviathan" :ambiente "Ocean" :perigo "Alta" :vida 500)
       (make-criatura :nome "Ghost Ray" :ambiente "Deep" :perigo "Media" :vida 120)
       (make-criatura :nome "Crab Squid" :ambiente "Deep" :perigo "Alta" :vida 300)))

(defun filtra-por-perigo (lista)
  (remove-if (lambda (c)
               (string= (criatura-perigo c) "Baixa"))
             lista))

(defun relatorio-profundidade (lista)
  (let ((somente-deep
          (remove-if-not (lambda (c)
                           (string= (criatura-ambiente c) "Deep"))
                         lista)))
    (mapcar (lambda (x)
              (format nil "~A: Vive em ~A"
                      (criatura-nome x)
                      (criatura-ambiente x)))
            somente-deep)))

(format t "~%-- Criaturas com perigo maior que Baixa --~%")
(dolist (c (filtra-por-perigo catalogo))
  (format t "~A (~A)~%"
          (criatura-nome c)
          (criatura-perigo c)))

(format t "~%-- Relatorio apenas das criaturas Deep --~%")
(dolist (linha (relatorio-profundidade catalogo))
  (format t "~A~%" linha))

exercio 03:  

(defstruct item
  nome
  tipo
  preco
  poder)

(setq lista-itens
      (list
       (make-item :nome "Espada Sombria" :tipo "Arma" :preco 200 :poder 70)
       (make-item :nome "Machado Draconico" :tipo "Arma" :preco 350 :poder 120)
       (make-item :nome "Pocao Vermelha" :tipo "Pocao" :preco 50 :poder 10)
       (make-item :nome "Orbe Antigo" :tipo "Artefato" :preco 500 :poder 200)))

(defun adiciona-imposto (valor)
  (* valor 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let* ((armas (remove-if-not
                 (lambda (x)
                   (string= (item-tipo x) "Arma"))
                 catalogo))

         (armas-taxadas
          (mapcar (lambda (x)
                    (make-item
                     :nome (item-nome x)
                     :tipo "Arma"
                     :preco (adiciona-imposto (item-preco x))
                     :poder (item-poder x)))
                  armas))

         (resultado
          (mapcar (lambda (x)
                    (format nil "~A -> Poder final: ~A"
                            (item-nome x)
                            (bonus-maldicao (item-poder x))))
                  armas-taxadas)))

    resultado))

(dolist (linha (processa-venda lista-itens))
  (format t "~A~%" linha))

exercicio 04: 

(defstruct ocorrencia
  nome
  ritual
  medo
  agentes)

(defun soma-medo-recursiva (lista)
  (if (null lista)
      0
      (+ (ocorrencia-medo (car lista))
         (soma-medo-recursiva (cdr lista)))))

(defun analise-final (lista)
  (let* ((total-medo (soma-medo-recursiva lista))
         (qtd (length lista))
         (media (/ total-medo qtd)))
    (remove-if-not
     (lambda (x)
       (and (> (ocorrencia-agentes x) 3)
            (> (ocorrencia-medo x) media)))
     lista)))

(setq ocorrencias-teste
      (list
       (make-ocorrencia :nome "Cripta Sombria" :ritual "Invocacao" :medo 70 :agentes 2)
       (make-ocorrencia :nome "Vale Nebuloso" :ritual "Selo" :medo 60 :agentes 4)
       (make-ocorrencia :nome "Templo Perdido" :ritual "Purificacao" :medo 90 :agentes 5)
       (make-ocorrencia :nome "Floresta Antiga" :ritual "Observacao" :medo 40 :agentes 6)
       (make-ocorrencia :nome "Santuario Velado" :ritual "Banimento" :medo 85 :agentes 3)))

(dolist (x (analise-final ocorrencias-teste))
  (format t "~A~%" (ocorrencia-nome x)))
