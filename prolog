/*
* Amigas na Escola II- Problema de Logica
* Cinco amigas estao na escola.
* Encontre a materia preferida e a cidade brasileira que passarao as proximas ferias.
*Alem disso, encontre seus animais e sucos favoritos e a cor de suas
mochilas.
* Sao: * 05 colunas * 06 linhas * 23 instrucoes
* Fonte:
https://rachacuca.com.br/logica/problemas/amigas-na-escola-ii/
*/


        %%% main
main :-
	statistics(cputime, T1),
	modelo([M1, M2, M3, M4, M5]),
	imprime_lista([M1, M2, M3, M4, M5]),
	statistics(cputime, T2),
	Tempo_BUSCA is T2 - T1,
	format('\n T1: ~f \t T2: ~f msec', [T1, T2]),
	format('\n Tempo total: ~10f msec', Tempo_BUSCA),
	fail.

main :-
	nl,
	write('xxxx AQUI SOH PODE VIR UMA RESPOSTA xxxx'),
	nl,
	write('.......... UFA apos o fail ........').


        % Qual o modelo que a gente quer chegar?
modelo([
        (Nome_1, Mochila_1, Materia_1, Animal_1, Lugar_1, Suco_1),
        (Nome_2, Mochila_2, Materia_2, Animal_2, Lugar_2, Suco_2),
        (Nome_3, Mochila_3, Materia_3, Animal_3, Lugar_3, Suco_3),
        (Nome_4, Mochila_4, Materia_4, Animal_4, Lugar_4, Suco_4),
        (Nome_5, Mochila_5, Materia_5, Animal_5, Lugar_5, Suco_5)
       ]) :-

        % Vamos analisar cada uma das instrucoes do problema,
        % sem seguir uma ordem pre-definida.



            %%%%%%%%%%%%%%%%%%%%%%%% Nome
            nome(Nome_1),
            nome(Nome_2),
            nome(Nome_3),
            nome(Nome_4),
            nome(Nome_5),

%22) A Beatriz esta sentada no meio.
(Nome_3==beatriz),


%23) A Patricia esta sentada na primeira cadeira.
(Nome_1==patricia),

           alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

           %%%%%%%%%%%%%%%%%%%%%%%% Suco
           suco(Suco_1),
           suco(Suco_2),
           suco(Suco_3),
           suco(Suco_4),
           suco(Suco_5),


%1) A menina que gosta de suco de Laranja esta em um dos cantos
(Suco_1==laranja ; Suco_5==laranja),

           alldifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),

%4) A Isabelle esta sentada ao lado de quem gosta de suco de Laranja.
(
(Nome_1==isabelle, Suco_2==laranja);
(Nome_2==isabelle,(Suco_1==laranja; Suco_3==laranja));
(Nome_3==isabelle,(Suco_2==laranja; Suco_4==laranja));
(Nome_4==isabelle,(Suco_3==laranja; Suco_5==laranja));
(Nome_5==isabelle, Suco_4==laranja)
  ),


          %%%%%%%%%%%%%%%%%%%%%%%% Animal

          animal(Animal_1),
          animal(Animal_2),
          animal(Animal_3),
          animal(Animal_4),
          animal(Animal_5),


%2) Quem gosta de suco de Maracuja esta sentada em algum lugar entre quem gosta de cavalos e quem gosta de suco de Morango, nessa ordem.
(
(Animal_1==cavalo,(Suco_2==maracuja; Suco_3==maracuja; Suco_4==maracuja),Suco_5==morango);
(Animal_1==cavalo,(Suco_2==maracuja; Suco_3==maracuja),Suco_4==morango);
(Animal_1==cavalo,(Suco_2==maracuja),Suco_3==morango);
(Animal_2==cavalo,(Suco_3==maracuja; Suco_4==maracuja),Suco_5==morango);
(Animal_2==cavalo,(Suco_3==maracuja),Suco_4==morango);
(Animal_3==cavalo,(Suco_4==maracuja),Suco_5==morango)
  ),

          alldifferent([Animal_1, Animal_2, Animal_3, Animal_4, Animal_5]),

          %%%%%%%%%%%%%%%%%%%%%%%% Mochila
          mochila(Mochila_1),
          mochila(Mochila_2),
          mochila(Mochila_3),
          mochila(Mochila_4),
          mochila(Mochila_5),


%3) A menina que gosta de suco de Limao esta sentada ao lado da que tem
% a mochila Vermelha.
(
(Suco_1==limao, Mochila_2==vermelha);
(Suco_2==limao, (Mochila_1==vermelha; Mochila_3==vermelha));
(Suco_3==limao, (Mochila_2==vermelha; Mochila_4==vermelha));
(Suco_4==limao, (Mochila_3==vermelha; Mochila_5==vermelha));
(Suco_5==limao, Mochila_4==vermelha)
  ),

          alldifferent([Mochila_1, Mochila_2, Mochila_3, Mochila_4, Mochila_5]),


          %%%%%%%%%%%%%%%%%%%%%%%% Lugar
          lugar(Lugar_1),
          lugar(Lugar_2),
          lugar(Lugar_3),
          lugar(Lugar_4),
          lugar(Lugar_5),



%5) Quem gosta de Hamsters vai para o Rio de Janeiro.
(
(Animal_1==hamster, Lugar_1==riodejaneiro);
(Animal_2==hamster, Lugar_2==riodejaneiro);
(Animal_3==hamster, Lugar_3==riodejaneiro);
(Animal_4==hamster, Lugar_4==riodejaneiro);
(Animal_5==hamster, Lugar_5==riodejaneiro)
  ),

          alldifferent([Lugar_1, Lugar_2, Lugar_3, Lugar_4, Lugar_5]),


%6) A Aline esta sentada exatamente a esquerda de quem viajara para Manaus.

(
(Lugar_2==manaus, Nome_1==aline);
(Lugar_3==manaus, Nome_2==aline);
(Lugar_4==manaus, Nome_3==aline);
(Lugar_5==manaus, Nome_4==aline)
  ),

%7) Quem vai para Florianopolis esta sentada em algum lugar a direita da Aline.

(
(Nome_1==aline, (Lugar_2==florianopolis; Lugar_3==florianopolis; Lugar_4==florianopolis; Lugar_5==florianopolis));
(Nome_2==aline, (Lugar_3==florianopolis; Lugar_4==florianopolis; Lugar_5==florianopolis));
(Nome_3==aline, (Lugar_4==florianopolis; Lugar_5==florianopolis));
(Nome_4==aline, Lugar_5==florianopolis)
  ),


%8) Quem vai viajar para o Recife esta sentada em um dos cantos.
(Lugar_1==recife; Lugar_5==recife),

          %%%%%%%%%%%%%%%%%%%%%%%% Materia
          materia(Materia_1),
          materia(Materia_2),
          materia(Materia_3),
          materia(Materia_4),
          materia(Materia_5),


%9) A menina que gosta de Biologia vai viajar para o Rio de Janeiro.
(
(Materia_1==biologia, Lugar_1==riodejaneiro);
(Materia_2==biologia, Lugar_2==riodejaneiro);
(Materia_3==biologia, Lugar_3==riodejaneiro);
(Materia_4==biologia, Lugar_4==riodejaneiro);
(Materia_5==biologia, Lugar_5==riodejaneiro)
  ),

         alldifferent([Materia_1, Materia_2, Materia_3, Materia_4, Materia_5]),


%10 )Ao lado de quem gosta de Gatos esta sentada a menina com a mochila
% Branca.
(
(Mochila_1==branco, Animal_2==gato);
(Mochila_2==branco,(Animal_1==gato; Animal_3==gato));
(Mochila_3==branco,(Animal_2==gato; Animal_4==gato));
(Mochila_4==branco,(Animal_3==gato; Animal_5==gato));
(Mochila_5==branco, Animal_4==gato)
  ),

%11) A menina que gosta de passaros esta sentada em uma das pontas.
(Animal_1=passaro ; Animal_5==passaro),

%12) Quem gosta de Hamsters esta sentada ao lado de quem gosta de
% Cachorros.
(
(Animal_1==hamster, Animal_2==cachorro);
(Animal_2==hamster, (Animal_1==cachorro; Animal_3==cachorro));
(Animal_3==hamster, (Animal_2==cachorro; Animal_4==cachorro));
(Animal_4==hamster, (Animal_3==cachorro; Animal_5==cachorro));
(Animal_5==hamster, Animal_4==cachorro)
  ),


%13) Ao lado de quem tem a mochila Branca esta a menina que gosta de
% Passaros.
(
(Animal_1==passaro, Mochila_2==branco);
(Animal_2==passaro, (Mochila_1==branco; Mochila_3==branco));
(Animal_3==passaro, (Mochila_2==branco; Mochila_4==branco));
(Animal_4==passaro, (Mochila_3==branco; Mochila_5==branco));
(Animal_5==passaro, Mochila_4==branco)
  ),


%14) Quem gosta de Cachorros esta sentada na extrema direita.
(Animal_5==cachorro),


%15) A menina que adora Matematica esta sentada ao lado de quem gosta de
% Cavalos.
(
(Materia_1==matematica, Animal_2==cavalo);
(Materia_2==matematica, (Animal_1==cavalo; Animal_3==cavalo));
(Materia_3==matematica, (Animal_2==cavalo; Animal_4==cavalo));
(Materia_4==matematica, (Animal_3==cavalo; Animal_5==cavalo));
(Materia_5==matematica, Animal_4==cavalo)
  ),

%16) Quem usa a mochila Verde adora estudar Historia.
(
(Mochila_1==verde, Materia_1==historia);
(Mochila_2==verde, Materia_2==historia);
(Mochila_3==verde, Materia_3==historia);
(Mochila_4==verde, Materia_4==historia);
(Mochila_5==verde, Materia_5==historia)
  ),


%17) A Aline adora estudar Portugues.
(
(Nome_1==aline, Materia_1==portugues);
(Nome_2==aline, Materia_2==portugues);
(Nome_3==aline, Materia_3==portugues);
(Nome_4==aline, Materia_4==portugues);
(Nome_5==aline, Materia_5==portugues)
  ),

%18) Quem gosta de Matematica esta sentada exatamente a esquerda de
% quem gosta de Hamsters.

(
(Materia_1==matematica, Animal_2==hamster);
(Materia_2==matematica, Animal_3==hamster);
(Materia_3==matematica, Animal_4==hamster);
(Materia_4==matematica, Animal_5==hamster)
   ),

%19) A menina da mochila Vermelha esta sentada exatamente a esquerda de quem gosta de Biologia.

(
(Mochila_1==vermelha, Materia_2==biologia);
(Mochila_2==vermelha, Materia_3==biologia);
(Mochila_3==vermelha, Materia_4==biologia);
(Mochila_4==vermelha, Materia_5==biologia)
   ),

%20) A menina da mochila Azul gosta de estudar Biologia.

(
(Mochila_1==azul, Materia_1==biologia);
(Mochila_2==azul, Materia_2==biologia);
(Mochila_3==azul, Materia_3==biologia);
(Mochila_4==azul, Materia_4==biologia);
(Mochila_5==azul, Materia_5==biologia)
   ),

%21) A Aline esta sentada em algum lugar entre quem vai para o Recife e quem tem a mochila Verde, nessa ordem.

(
(Lugar_1==recife, (Nome_2==aline; Nome_3==aline; Nome_4==aline), Mochila_5==verde);
(Lugar_1==recife, (Nome_2==aline; Nome_3==aline), Mochila_4==verde);
(Lugar_1==recife, (Nome_2==aline), Mochila_3==verde);
(Lugar_2==recife, (Nome_3==aline; Nome_4==aline), Mochila_5==verde);
(Lugar_2==recife, (Nome_3==aline), Mochila_4==verde);
(Lugar_3==recife, (Nome_4==aline), Mochila_5==verde)
   ),


	nl,
	write('CHEGAMOS AO FIM DO MODELO').
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fatos
        %% O que a gente tem de base de dados?

        %MOCHILAS
        mochila(amarelo).
        mochila(azul).
        mochila(branco).
        mochila(verde).
        mochila(vermelha).

        %NOMES
        nome(aline).
        nome(beatriz).
        nome(isabelle).
        nome(juliana).
        nome(patricia).

        %ANIMAL
        animal(cachorro).
        animal(cavalo).
        animal(gato).
        animal(hamster).
        animal(passaro).


        %LUGAR
        lugar(florianopolis).
        lugar(manaus).
        lugar(recife).
        lugar(salvador).
        lugar(riodejaneiro).

        %MATERIAS
        materia(artes).
        materia(biologia).
        materia(historia).
        materia(matematica).
        materia(portugues).

        %SUCOS
        suco(abacaxi).
        suco(laranja).
        suco(limao).
        suco(maracuja).
        suco(morango).


        % DEFINICAO DE ALLDIFFERENT
	alldifferent([]).
	alldifferent([H|T]):- not(member(H,T)),
	                      alldifferent(T).

	imprime_lista([]):- write('\n FIM \n').
	imprime_lista([H|T]):- write('\n......................................\n'),
	                       write(H), write(' : '),
	                       imprime_lista(T).
