% Author: Matthias Delfs
% Date: 06-Jun-17


train(X) :-
    random(2,5,R),
    (R=2 ->
    X = [S,T],
    carriages(X,1);
    R=3 ->
    X = [S,T,U],
    carriages(X,1);
    X = [S,T,U,V],
    carriages(X,1)), !.

carriages([],_).
carriages([C|Cs],N) :-
    carriage(C,N), N1 is N+1,
    carriages(Cs,N1), !.

carriage(c(N,Shape,Length,Roof,Load),N) :-
    length(Length),
    shape(Length,Shape),
    roof(Length,Shape,Roof),
    load(Length,Load), !.

length(Value) :-
    random(1,3,R),
    (R=1 -> car_length(1,Value);
    car_length(2,Value)).

shape(long, rectangle).
shape(short,Value) :-
    random(1,6,R),
    (R=1 -> car_shape(1,Value);
    R=2 -> car_shape(2,Value);
    R=3 -> car_shape(3,Value);
    R=4 -> car_shape(4,Value);
    car_shape(5,Value)).


roof(short,ellipse,arc) :- !.
roof(short,hexagon,flat) :- !.
roof(short,_,Value) :-
    random(1,4,R),
    (R=1 -> roof_shape(1,Value);
    R=2 -> roof_shape(2,Value);
    roof_shape(3,Value)).
roof(long,_,Value) :-
    random(1,3,R),
    (R=1 -> roof_shape(1,Value);
    roof_shape(2,Value)).

load(short,l(Value,N)) :-
    random(1,4,R),
    random(1,3,N),
    (R=1 -> load_shape(1,Value);
    R=2 -> load_shape(2,Value);
    load_shape(3,Value)).

load(long,l(Value,N)) :-
    random(1,4,R),
    random(1,4,N),
    (R=1 -> load_shape(1,Value);
    R=2 -> load_shape(2,Value);
    load_shape(3,Value)).

car_length(1,short). car_length(2,long).

car_shape(1,ellipse). car_shape(2,hexagon).
car_shape(3,rectangle). car_shape(4,u_shaped). car_shape(5,bucket).

roof_shape(1,none). roof_shape(2,flat).
roof_shape(3,peaked).

load_shape(1,circle). load_shape(2,rectangle). load_shape(3,triangle).


