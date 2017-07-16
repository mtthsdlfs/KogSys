% Author: Matthias Delfs
% Date: 08-Jul-17




aleph(T,Z) :- arg(1,T,L), examine(L,1,Z).

examine(([]),N,Z) :-
                   N1 is N-1,
                   examine2(N1,Z).

examine(([C|Cs]),N,Z):-
                   open('trains_aleph_2.txt',append,Stream),
                     write(Stream, "has_car(west"), write(Stream,Z), write(Stream,",car_"), write(Stream,Z), write(Stream,N), write(Stream,")."),nl(Stream),
                    (rectangle(C) -> write(Stream, "shape(car_"), write(Stream,Z), write(Stream,N), write(Stream,",rectangle). "); write(Stream,"")),
                    (ellipse(C) -> write(Stream, "shape(car_"), write(Stream,Z), write(Stream,N), write(Stream,",ellipse). "); write(Stream,"")),
                    (hexagon(C) -> write(Stream, "shape(car_"), write(Stream,Z), write(Stream,N), write(Stream,",hexagon). "); write(Stream,"")),
                    (u_shaped(C) -> write(Stream, "shape(car_"), write(Stream,Z), write(Stream,N), write(Stream,",u_shaped). "); write(Stream,"")),
                    (bucket(C) -> write(Stream, "shape(car_"), write(Stream,Z), write(Stream,N), write(Stream,",bucket). "); write(Stream,"")),
                    (long(C) -> write(Stream, "long(car_"), write(Stream,Z), write(Stream,N), write(Stream,"). "); write(Stream,"")),
                    (short(C) -> write(Stream, "short(car_"), write(Stream,Z), write(Stream,N), write(Stream,"). "); write(Stream,"")),
                    (no_roof(C) -> write(Stream, "roof(car_"), write(Stream,Z), write(Stream,N), write(Stream,",no_roof). "); write(Stream,"")),
                    (flat_roof(C) -> write(Stream, "roof(car_"), write(Stream,Z), write(Stream,N), write(Stream,",flat_roof). "); write(Stream,"")),
                    (peaked_roof(C) -> write(Stream, "roof(car_"), write(Stream,Z), write(Stream,N), write(Stream,",peaked_roof). "); write(Stream,"")),
                    (arc_roof(C) -> write(Stream, "roof(car_"), write(Stream,Z), write(Stream,N), write(Stream,",arc_roof). "); write(Stream,"")),
                    (circle_load(C),one_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",circle_load,1). "); write(Stream,"")),
                    (circle_load(C),two_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",circle_load,2). "); write(Stream,"")),
                    (circle_load(C),three_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",circle_load,3). "); write(Stream,"")),
                    (rectangle_load(C),one_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",rectangle_load,1). "); write(Stream,"")),
                    (rectangle_load(C),two_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",rectangle_load,2). "); write(Stream,"")),
                    (rectangle_load(C),three_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",rectangle_load,3). "); write(Stream,"")),
                    (triangle_load(C),one_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",triangle_load,1). "); write(Stream,"")),
                    (triangle_load(C),two_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",triangle_load,2). "); write(Stream,"")),
                    (triangle_load(C),three_load(C) -> write(Stream, "load(car_"), write(Stream,Z), write(Stream,N), write(Stream,",triangle_load,3). "); write(Stream,"")),
                   nl(Stream),
                   close(Stream),
                   N1 is N + 1,
                   examine((Cs),N1,Z).

examine2(1,_) :-
				open('trains_aleph_2.txt', append, Stream),
				nl(Stream),
                close(Stream).

examine2(N,Z) :-
               N1 is N - 1,
               open('trains_aleph_2.txt', append, Stream),
               write(Stream, "infront(west"), write(Stream,Z),write(Stream,",car_"), write(Stream,Z), write(Stream,N1), write(Stream, ",car_"), write(Stream,Z), write(Stream,N), write(Stream,")."),
               nl(Stream),
               close(Stream),
               examine2(N1,Z).


has_car(T,C) :- member(C,T).

infront(T,C1,C2) :-
                 has_car(T,C1),
                 has_car(T,C2),
                 arg(1,C1,F),
                 arg(1,C2,G),
                 F + 1 =:= G.

ellipse(C) :- arg(2,C,ellipse).
hexagon(C) :- arg(2,C,hexagon).
rectangle(C) :- arg(2,C,rectangle).
u_shaped(C) :- arg(2,C,u_shaped).
bucket(C) :- arg(2,C,bucket).

long(C) :- arg(3,C,long).
short(C) :- arg(3,C,short).

no_roof(C) :- arg(4,C,none).
flat_roof(C) :- arg(4,C,flat).
peaked_roof(C) :- arg(4,C,peaked).
arc_roof(C) :- arg(4,C,arc).

circle_load(C) :- has_load0(C,circle).
rectangle_load(C) :- has_load0(C,rectangle).
triangle_load(C) :- has_load0(C,triangle).

one_load(C) :- has_load(C,1).
two_load(C) :- has_load(C,2).
three_load(C) :- has_load(C,3).

has_load0(C,B) :- arg(5,C,D), arg(1,D,B).
has_load(C,B) :- arg(5,C,D), arg(2,D,B).



