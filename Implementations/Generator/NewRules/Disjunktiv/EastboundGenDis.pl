% Author: Matthias Delfs
% Date: 24-Jul-17

% disjuntiv
% Rule for Eastbound:
% First carriage-load triangle -OR- third carriage-form trapezoid (bucket)


train :-
    random(3,5,R),
    (R=3 ->
    carriages([S,T,U],1,0),
    write(eastbound([S,T,U])),
    open('eastboundDis.txt',append,Stream),
    write(Stream,eastbound([S,T,U])),
    nl(Stream),
    close(Stream);
    carriages([S,T,U,V],1,0),
    write(eastbound([S,T,U,V])),
    open('eastboundDis.txt',append,Stream),
    write(Stream,eastbound([S,T,U,V])),
    nl(Stream),
    close(Stream)), !.

carriages([],_,_).
carriages([C|Cs],N,Q) :-
    (N=:=1 ->
    carriage1(C,N,P),
    Q1=P,
    N1 is N+1;
    N=:=3, Q=:=1 ->
    carriage2(C,N,P),
    Q1=P,
    N1 is N+1;
    carriage(C,N),
    Q1=Q,
    N1 is N+1),
    carriages(Cs,N1,Q1), !.

carriage(c(N,Shape,Length,Roof,Load),N) :-
    length(Length),
    shape(Length,Shape),
    roof(Length,Shape,Roof),
    load(Length,Load), !.

carriage1(c(N,Shape,Length,Roof,Load),N,P) :-
    random(1,3,S),
    length(Length),
    shape(Length,Shape),
    roof(Length,Shape,Roof),
    (S=:=1 ->
    load(Length,Load),
    attention_value(notOk,P);
    load2(Length,Load),
    attention_value(ok,P)), !.

carriage2(c(N,Shape,Length,Roof,Load),N,P) :-
    car_length(1,Length),
    car_shape(5,Shape),
    roof(Length,Shape,Roof),
    load(Length,Load),
    attention_value(ok,P), !.

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

shape2(short,Value) :-
    random(2,6,R),
    (R=2 -> car_shape(2,Value);
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

load2(short,l(Value,N)) :-
    random(1,3,N),
    load_shape(3,Value).

load2(long,l(Value,N)) :-
    random(1,4,N),
    load_shape(3,Value).

car_length(1,short). car_length(2,long).

car_shape(1,ellipse). car_shape(2,hexagon).
car_shape(3,rectangle). car_shape(4,u_shaped). car_shape(5,bucket).

roof_shape(1,none). roof_shape(2,flat).
roof_shape(3,peaked).

load_shape(1,circle). load_shape(2,rectangle). load_shape(3,triangle).

attention_value(ok,0). attention_value(notOk,1).