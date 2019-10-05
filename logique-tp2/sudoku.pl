/*
  Lina RADI
  Assia TRARI
*/
% Import
:- use_module(library(clpfd)).

/* Introduction */
grille([[_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,3,_,8,5],
        [_,_,1,_,2,_,_,_,_],
        [_,_,_,5,_,7,_,_,_],
        [_,_,4,_,_,_,1,_,_],
        [_,9,_,_,_,_,_,_,_],
        [5,_,_,_,_,_,_,7,3],
        [_,_,2,_,1,_,_,_,_],
        [_,_,_,_,4,_,_,_,9]]).

/* Question 1 */
printline([]) :- write('|').
printline([X|L]) :- integer(X),write('|'), write(X),printline(L).
printline([_|L]) :- write('|'),write(' '),printline(L).
/* Question 2 */
print([]).
print([X|L]) :- printline(X) ,
                nl, /* pour sauter la ligne */
                print(L).


/* Vérification de la structure */

/* Question 3 */
bonnelongueur([], 0) :- true.
bonnelongueur([_|L], R) :- bonnelongueur(L, N), R is N + 1.

/* Question 4 */
bonnetaille([],_) :- true.
bonnetaille([X|L],R) :- bonnelongueur(X,R) , bonnetaille(L,R).
/* Vérification du domaine */
 /* ne pas oublier d'utiliser
    use_module(library(clpfd)). */
/* Question 5 */
 verifie([]).
 verifie([X|L]) :- X ins 1..9 , all_distinct(X), verifie(L).

/* Vérification des colonnes */

/* Question 6 */
ajoute_en_tete(X, L, [X|L]).

eclate([],L,L).
eclate([X|XS], [], [[X]|L]) :-  eclate(XS, [], L).
eclate([X|XS], [Y|YS], [R|L]) :- ajoute_en_tete(X, Y, R), eclate(XS, YS,L) .

/* Question 7 */
transp([],[]).
transp([X|XS],R) :- transp(XS,L),eclate(X, L, R).

/* Vérification des carrés */


/* Question 8 */

decoupe([],[],[],[]).
/*decoupe([X1,X2,X3,X4,X5,X6],[Y1,Y2,Y3,Y4,Y5,Y6],[Z1,Z2,Z3,Z4,Z5,Z6],[[X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3],[X4,X5,X6,Y4,Y5,Y6,Z4,Z5,Z6]]).*/
decoupe([X1,X2,X3|XS],[Y1,Y2,Y3|YS],[Z1,Z2,Z3|ZS],[[X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]|L]):-decoupe(XS,YS,ZS,L).
/* Question 9 */
carres([],[]):-!.
/*autre possibilité :*/
/*carres([X1,X2,X3|XS],[C1,C2,C3|R]):-decoupe(X1,X2,X3,[C1,C2,C3]),carres(XS,R).*/

carres([X1,X2,X3|XS],L):-decoupe(X1,X2,X3,C),carres(XS,R),append(C,R,L).
/* Solution */

/* Question 10 */
solution([]).
solution(L):-verifie(L), bonnetaille(L,9), transp(L,C), verifie(C), bonnetaille(C,9), carres(L,D), verifie(D), bonnetaille(D,9).

/* Variantes */

/* Question 11 */

/* Question 12 */

/* Question 13 */

/* Question 14 */
