/*
  Lina RADI
  Assia TRARI
*/

/* Question 1 */
longueur([],0).
longueur([_|L],Y) :- longueur(L,X), Y is X+1.

/* Question 2 */
somme([], 0).
somme([X|L],Y) :- somme(L,Z), Y is X+Z.

/* Question 3 */
membre(X, [X|_]).
membre(X, [_|L]) :- membre(X, L).

/* Question 4 */
ajoute_en_tete(X, L, [X|L]).

/* Question 5 */
ajoute_en_queue(X, [], [X]).
ajoute_en_queue(A, [X|XS], [X|YS]) :- ajoute_en_queue(A, XS, YS).

/* Question 6 */
extraire_tete(L, X, XL) :- ajoute_en_tete(X, XL, L).

/* Question 7 */
concatene(X, [], X).
concatene(A, [X|XS], Z) :- ajoute_en_queue(X, A, Y), concatene(Y, XS, Z).

/* Question 8 */
retourne([], A, A).
retourne([X|XS], L, A) :- retourne(XS, [X|L], A).

/* Tris sur les listes */

/* Question 9 */
insert_trie(N,[],[N]) :- !.
insert_trie(N,[X|XS],L) :- N=<X, !, ajoute_en_tete(N,[X|XS],L).
insert_trie(N,[X|XS],L) :- !, ajoute_en_queue(X,[],Z), insert_trie(N,XS,K), concatene(Z,K,L).

/* Question 10 */
tri_insert([],[]):- !.
tri_insert([X|XS],L) :- tri_insert(XS,T), insert_trie(X,T,L).
/* Question 11 */
divise([],[],[]) :- !.
divise([X|XS],L,L2) :- divise(XS,L2,T), ajoute_en_tete(X,T,L).
/* Question 12 */
fusion(X,Y,L) :- concatene(X,Y,T), tri_insert(T,L).
/* Question 13 */
tri_fusion([], []) :- !.
tri_fusion([X],[X]) :- !.
tri_fusion(X, L) :- divise(X,L1,L2), tri_fusion(L1,F1), tri_fusion(L2,F2), fusion(F1,F2,L).

/* Question 14 */
balance(_, [], [], []):- !.
balance(N,[X|XS],[X|NS],L):- X<N, !, balance(N,XS,NS,L).
balance(N,[X|XS],L,[X|NS]):- X>=N, !, balance(N,XS,L,NS).
/* Question 15 */
tri_rapide([],[]) :- !.
tri_rapide([X|XS],L) :- balance(X,XS,A,B), tri_rapide(A,L1), tri_rapide(B,L2), concatene(L1,[X|L2],L).

/* Opérations de base sur les ensembles */

/* Question 16 */
est_vide([]):- true.
est_vide([_X|_]) :- false.

/* Question 17 */
ajoute_ensemble(X, [], [X]).
ajoute_ensemble(X, [X|XS], [X|XS]).
ajoute_ensemble(Y, [X|XS], [X|L]) :- ajoute_ensemble(Y, XS, L).

/* Question 18 */
sous_ensemble([],[_X|_]) :- true.
sous_ensemble([X|XS], Y) :- membre(X,Y), sous_ensemble(XS, Y).

/* Question 19 */
union([], X, X).
union([X|XS], Y, L) :- ajoute_ensemble(X, Y, Z), union(XS, Z, L).

/* Question 20 */
intersect([],_,[]).
intersect([X|XS],Y,[X|L]) :- membre(X,Y), intersect(XS,Y,L).
intersect([_|XS],Y,L) :- intersect(XS,Y,L).

/* Question 21 */
diff([],_,[]).
diff([X|XS],Y,[X|L]) :- not(membre(X,Y)), diff(XS,Y,L).
diff([_|XS],Y,L) :- diff(XS,Y,L).
