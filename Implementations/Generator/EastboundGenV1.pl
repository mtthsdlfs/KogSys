% Author: Matthias Delfs
% Date: 06-Jun-17

% Rule for Eastbound:
% contains at least one short train loaded with one triangle following a long train


train :-
    random(2,5,R),
    (R=2 ->
    carriages([S,T],1,1),
    write(eastbound([S,T])),
    open('eastbound.txt',append,Stream),
    write(Stream,eastbound([S,T])),
    nl(Stream),
    nl(Stream),
    close(Stream);
    R=3 ->
    random(1,3,Q),
    carriages([S,T,U],1,Q),
    write(eastbound([S,T,U])),
    open('eastbound.txt',append,Stream),
    write(Stream,eastbound([S,T,U])),
    nl(Stream),
    nl(Stream),
    close(Stream);
    random(1,4,Q),
    carriages([S,T,U,V],1,Q),
    write(eastbound([S,T,U,V])),
    open('eastbound.txt',append,Stream),
    write(Stream,eastbound([S,T,U,V])),
    nl(Stream),
    nl(Stream),
    close(Stream)), !.

carriages([],_,_).
carriages([C|Cs],N,Q) :-
    (N=:=Q ->
    carriage1(C,N), N1 is N+1;
    N=:=Q+1 ->
    carriage2(C,N), N1 is N+1;
    carriage(C,N), N1 is N+1),
    carriages(Cs,N1,Q), !.

carriage(c(N,Shape,Length,Roof,Load),N) :-
    length(Length),
    shape(Length,Shape),
    roof(Length,Shape,Roof),
    load(Length,Load), !.
    
carriage1(c(N,Shape,Length,Roof,Load),N) :-
    car_length(2,Length),
    shape(Length,Shape),
    roof(Length,Shape,Roof),
    load(Length,Load), !.

carriage2(c(N,Shape,Length,Roof,Load),N) :-
    car_length(1,Length),
    shape(Length,Shape),
    roof(Length,Shape,Roof),
    load_shortcar_onetriangle(Load), !.

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
roof(short,bucket,none) :-!.
roof(short,u_shaped,none) :-!.
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

load_shortcar_onetriangle(l(triangle,1)).


