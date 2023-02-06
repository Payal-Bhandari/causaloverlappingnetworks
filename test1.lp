edge (4, 6, 2) .
edge (4, 7, 2) .
edge (8, 7, 2) .
edge (7, 9, 2) .
edge (9, 10, 2) .

edge (2, 1, 1) .
edge (3, 2, 1) .
edge (3, 4, 1) .
edge (5, 3, 1) .

nedge (1, 3, 1) .
nedge (1, 5, 1) .
nedge (1, 4, 1) .
nedge (4, 1, 1) .
nedge (3, 1, 1) .
nedge (5, 1, 1) .
nedge (5, 2, 1) .
nedge (5, 4, 1) .
nedge (2, 5, 1) .
nedge (4, 5, 1) .
nedge (4, 2, 1) .
nedge (2, 4, 1) .
nedge (1, 6, 2) .
nedge (1, 7, 2) .
nedge (1, 8, 2) .
nedge (1, 9, 2) .
nedge (1, 10, 2) .
nedge (4, 8, 2) .
nedge (4, 9, 2) .
nedge (4, 10, 2) .
nedge (7, 1, 2) .
nedge (7, 6, 2) .
nedge (7, 10, 2) .
nedge (6, 1, 2) .
nedge (6, 7, 2) .
nedge (6, 8, 2) .
nedge (6, 9, 2) .
nedge (6, 10, 2) .
nedge (8, 1, 2) .
nedge (8, 6, 2) .
nedge (8, 4, 2) .
nedge (8, 9, 2) .
nedge (8, 10, 2) .
nedge (9, 1, 2) .
nedge (9, 4, 2) .
nedge (9, 6, 2) .
nedge (9, 8, 2) .
nedge (10, 1, 2) .
nedge (10, 4, 2) .
nedge (10, 6, 2) .
nedge (10, 8, 2) .
nedge (10, 7, 2) .


varin (1, 1) .
varin (1, 2) .
varin (1, 3) .
varin (1, 4) .
varin (1, 5) .

varin (2, 1) .
varin (2, 4) .
varin (2, 6) .
varin (2, 7) .
varin (2, 8) .
varin (2, 9) .
varin (2, 10) .

#const g = 2.

#const n = 10.
node(1..n).


{edge(X,Y)} :- node(X), node(Y).

:- edge(X, Y), X = Y. 
:- edge(X, Y), nedge(X, Y, T), varin(T, X), varin(T, Y).
:- edge(X, Y), path(Y, X).

path(Y, X) :- edge(Y,X).
path(Y, X) :- edge(Y, Z), path(Z, X).

directed(X, Y, T) :- edge(X, Y), varin(T, Y).
directed(X, Y, T) :- edge(X, Z), directed(Z, Y, T), not varin(T,Z).

causalconn(X, Y, T) :- directed(X, Y, T).
causalconn(X, Y, T) :- directed(Z, X, T), directed(Z, Y, T), not varin(T, Z).


:- nedge(X, Y, T), causalconn(X, Y, T), varin(T,X), varin(T, Y). 
:- edge(X, Y, T), not directed(X, Y, T), varin(T, X), varin(T, Y).


#show edge/2.
