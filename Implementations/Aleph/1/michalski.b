% Author: Matthias Delfs
% Date: 10-Jul-17


% Each first five trains from West and Eastbound Train Generator

% Simple illustration of the use of recording good clauses found
%       during the search using the Michalski's trains problem.
% This will store a Prolog encoding of clauses above minscore
% (optionally in the file specified by goodfile)
% To run do the following:
%       a. Load Aleph
%       b. read_all(train).
%       c. sat(1).
%       d. reduce.
%       e. show(good).

:- set(i,2).
:- set(good,true).
%:- set(goodfile,'good.pl').   % optional file to store good clauses

:- modeh(1,eastbound(+train)).
:- modeb(1,short(+car)).
:- modeb(1,long(+car)).
:- modeb(1,shape(+car,#shape)).
:- modeb(1,roof(+car,#roof)).
:- modeb(1,load(+car,#shape,#int)).
:- modeb(*,has_car(+train,-car)).
:- modeb(*,infront(+train,-car,-car)).

:- determination(eastbound/1,short/1).
:- determination(eastbound/1,long/1).
:- determination(eastbound/1,roof/2).
:- determination(eastbound/1,load/3).
:- determination(eastbound/1,has_car/2).
:- determination(eastbound/1,infront/3).

% type definitions
car(car_11).  car(car_12).  car(car_13).  car(car_14).
car(car_21).  car(car_22).  car(car_23).
car(car_31).  car(car_32).  car(car_33).  car(car_34).
car(car_41).  car(car_42).
car(car_51).  car(car_52).  car(car_53).
car(car_61).  car(car_62).  car(car_63).  car(car_64).
car(car_71).  car(car_72).  car(car_73).
car(car_81).  car(car_82).  car(car_83).  car(car_84).
car(car_91).  car(car_92).  car(car_93).  car(car_94).
car(car_101).  car(car_102).

shape(elipse).  shape(hexagon).  shape(rectangle).  shape(u_shaped). shape(bucket).
shape(triangle_load). shape(circle_load). shape(rectangle_load).

roof(no_roof). roof(flat_roof). roof(peaked_roof). roof(arc_roof).

train(east1).  train(east2).  train(east3).  train(east4).  train(east5).
train(west6).  train(west7).  train(west8).  train(west9).  train(west10).


% eastbound train 1
has_car(east1,car_11).
shape(car_11,rectangle). long(car_11). roof(car_11,no_roof). load(car_11,triangle_load,3).
has_car(east1,car_12).
shape(car_12,rectangle). short(car_12). roof(car_12,no_roof). load(car_12,triangle_load,1).
has_car(east1,car_13).
shape(car_13,rectangle). long(car_13). roof(car_13,flat_roof). load(car_13,rectangle_load,3).
has_car(east1,car_14).
shape(car_14,rectangle). long(car_14). roof(car_14,flat_roof). load(car_14,triangle_load,3).
infront(east1,car_13,car_14).
infront(east1,car_12,car_13).
infront(east1,car_11,car_12).

% eastbound train 2
has_car(east2,car_21).
shape(car_21,rectangle). long(car_21). roof(car_21,no_roof). load(car_21,rectangle_load,3).
has_car(east2,car_22).
shape(car_22,rectangle). long(car_22). roof(car_22,flat_roof). load(car_22,rectangle_load,3).
has_car(east2,car_23).
shape(car_23,ellipse). short(car_23). roof(car_23,arc_roof). load(car_23,triangle_load,1).
infront(east2,car_22,car_23).
infront(east2,car_21,car_22).

% eastbound train 3
has_car(east3,car_31).
shape(car_31,rectangle). long(car_31). roof(car_31,no_roof). load(car_31,rectangle_load,1).
has_car(east3,car_32).
shape(car_32,ellipse). short(car_32). roof(car_32,arc_roof). load(car_32,triangle_load,1).
has_car(east3,car_33).
shape(car_33,ellipse). short(car_33). roof(car_33,arc_roof). load(car_33,triangle_load,2).
has_car(east3,car_34).
shape(car_34,rectangle). long(car_34). roof(car_34,no_roof). load(car_34,circle_load,2).
infront(east3,car_33,car_34).
infront(east3,car_32,car_33).
infront(east3,car_31,car_32).

% eastbound train 4
has_car(east4,car_41).
shape(car_41,rectangle). long(car_41). roof(car_41,no_roof). load(car_41,circle_load,1).
has_car(east4,car_42).
shape(car_42,hexagon). short(car_42). roof(car_42,flat_roof). load(car_42,triangle_load,1).
infront(east4,car_41,car_42).

% eastbound train 5
has_car(east5,car_51).
shape(car_51,rectangle). long(car_51). roof(car_51,no_roof). load(car_51,triangle_load,3).
has_car(east5,car_52).
shape(car_52,rectangle). long(car_52). roof(car_52,no_roof). load(car_52,circle_load,3).
has_car(east5,car_53).
shape(car_53,ellipse). short(car_53). roof(car_53,arc_roof). load(car_53,triangle_load,1).
infront(east5,car_52,car_53).
infront(east5,car_51,car_52).


% westbound train 6
has_car(west6,car_61).
shape(car_61,rectangle). short(car_61). roof(car_61,flat_roof). load(car_61,rectangle_load,1).
has_car(west6,car_62).
shape(car_62,rectangle). short(car_62). roof(car_62,peaked_roof). load(car_62,circle_load,1).
has_car(west6,car_63).
shape(car_63,ellipse). short(car_63). roof(car_63,arc_roof). load(car_63,circle_load,1).
has_car(west6,car_64).
shape(car_64,rectangle). long(car_64). roof(car_64,no_roof). load(car_64,rectangle_load,3).
infront(west6,car_63,car_64).
infront(west6,car_62,car_63).
infront(west6,car_61,car_62).

% westbound train 7
has_car(west7,car_71).
shape(car_71,ellipse). short(car_71). roof(car_71,arc_roof). load(car_71,triangle_load,1).
has_car(west7,car_72).
shape(car_72,rectangle). long(car_72). roof(car_72,flat_roof). load(car_72,triangle_load,1).
has_car(west7,car_73).
shape(car_73,u_shaped). short(car_73). roof(car_73,no_roof). load(car_73,rectangle_load,2).
infront(west7,car_72,car_73).
infront(west7,car_71,car_72).

% westbound train 8
has_car(west8,car_81).
shape(car_81,bucket). short(car_81). roof(car_81,no_roof). load(car_81,circle_load,1).
has_car(west8,car_82).
shape(car_82,rectangle). long(car_82). roof(car_82,flat_roof). load(car_82,circle_load,2).
has_car(west8,car_83).
shape(car_83,rectangle). long(car_83). roof(car_83,no_roof). load(car_83,rectangle_load,3).
has_car(west8,car_84).
shape(car_84,rectangle). long(car_84). roof(car_84,flat_roof). load(car_84,triangle_load,3).
infront(west8,car_83,car_84).
infront(west8,car_82,car_83).
infront(west8,car_81,car_82).

% westbound train 9
has_car(west9,car_91).
shape(car_91,bucket). short(car_91). roof(car_91,no_roof). load(car_91,rectangle_load,1).
has_car(west9,car_92).
shape(car_92,rectangle). short(car_92). roof(car_92,peaked_roof). load(car_92,circle_load,2).
has_car(west9,car_93).
shape(car_93,rectangle). long(car_93). roof(car_93,no_roof). load(car_93,circle_load,2).
has_car(west9,car_94).
shape(car_94,ellipse). short(car_94). roof(car_94,arc_roof). load(car_94,rectangle_load,2).
infront(west9,car_93,car_94).
infront(west9,car_92,car_93).
infront(west9,car_91,car_92).

% westbound train 10
has_car(west10,car_101).
shape(car_101,hexagon). short(car_101). roof(car_101,flat_roof). load(car_101,rectangle_load,2).
has_car(west10,car_102).
shape(car_102,rectangle). short(car_102). roof(car_102,peaked_roof). load(car_102,triangle_load,2).
infront(west10,car_101,car_102).