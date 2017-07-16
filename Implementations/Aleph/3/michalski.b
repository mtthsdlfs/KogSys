	% Author: Matthias Delfs
% Date: 11-Jul-17


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
:- set(goodfile,'good.pl').   % optional file to store good clauses

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
car(car_61).  car(car_62).  car(car_63).
car(car_71).  car(car_72).  car(car_73). car(car_74).
car(car_81).  car(car_82).  car(car_83).
car(car_91).  car(car_92).  car(car_93).
car(car_101).  car(car_102).  car(car_103).  car(car_104).
car(car_111).  car(car_112).  car(car_113).  car(car_114).
car(car_121).  car(car_122).  car(car_123).
car(car_131).  car(car_132).  car(car_133).  car(car_134).
car(car_141).  car(car_142).  car(car_143).  car(car_144).
car(car_151).  car(car_152).
car(car_161).  car(car_162).
car(car_171).  car(car_172).  car(car_173).
car(car_181).  car(car_182).
car(car_191).  car(car_192).  car(car_193).  car(car_194).
car(car_201).  car(car_202).  car(car_203).  car(car_204).

shape(elipse).  shape(hexagon).  shape(rectangle).  shape(u_shaped). shape(bucket).
shape(triangle_load). shape(circle_load). shape(rectangle_load).

roof(no_roof). roof(flat_roof). roof(peaked_roof). roof(arc_roof).

train(east1).  train(east2).  train(east3).  train(east4).  train(east5).
train(east6).  train(east7).  train(east8).  train(east9).  train(east10).
train(west11).  train(west12).  train(west13).  train(west14).  train(west15).
train(west16).  train(west17).  train(west18).  train(west19).  train(west20).


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

has_car(east2,car_21).
shape(car_21,rectangle). long(car_21). roof(car_21,no_roof). load(car_21,rectangle_load,3). 
has_car(east2,car_22).
shape(car_22,rectangle). long(car_22). roof(car_22,flat_roof). load(car_22,rectangle_load,3). 
has_car(east2,car_23).
shape(car_23,ellipse). short(car_23). roof(car_23,arc_roof). load(car_23,triangle_load,1). 
infront(east2,car_22,car_23).
infront(east2,car_21,car_22).

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

has_car(east4,car_41).
shape(car_41,rectangle). long(car_41). roof(car_41,no_roof). load(car_41,circle_load,1). 
has_car(east4,car_42).
shape(car_42,hexagon). short(car_42). roof(car_42,flat_roof). load(car_42,triangle_load,1). 
infront(east4,car_41,car_42).

has_car(east5,car_51).
shape(car_51,rectangle). long(car_51). roof(car_51,no_roof). load(car_51,triangle_load,3). 
has_car(east5,car_52).
shape(car_52,rectangle). long(car_52). roof(car_52,no_roof). load(car_52,circle_load,3). 
has_car(east5,car_53).
shape(car_53,ellipse). short(car_53). roof(car_53,arc_roof). load(car_53,triangle_load,1). 
infront(east5,car_52,car_53).
infront(east5,car_51,car_52).

has_car(east6,car_61).
shape(car_61,rectangle). long(car_61). roof(car_61,flat_roof). load(car_61,triangle_load,2). 
has_car(east6,car_62).
shape(car_62,u_shaped). short(car_62). roof(car_62,no_roof). load(car_62,triangle_load,1). 
has_car(east6,car_63).
shape(car_63,rectangle). long(car_63). roof(car_63,flat_roof). load(car_63,rectangle_load,2). 
infront(east6,car_62,car_63).
infront(east6,car_61,car_62).

has_car(east7,car_71).
shape(car_71,rectangle). long(car_71). roof(car_71,no_roof). load(car_71,rectangle_load,2). 
has_car(east7,car_72).
shape(car_72,rectangle). long(car_72). roof(car_72,flat_roof). load(car_72,circle_load,3). 
has_car(east7,car_73).
shape(car_73,rectangle). long(car_73). roof(car_73,no_roof). load(car_73,triangle_load,2). 
has_car(east7,car_74).
shape(car_74,hexagon). short(car_74). roof(car_74,flat_roof). load(car_74,triangle_load,1). 
infront(east7,car_73,car_74).
infront(east7,car_72,car_73).
infront(east7,car_71,car_72).

has_car(east8,car_81).
shape(car_81,rectangle). long(car_81). roof(car_81,no_roof). load(car_81,circle_load,1). 
has_car(east8,car_82).
shape(car_82,rectangle). long(car_82). roof(car_82,flat_roof). load(car_82,rectangle_load,2). 
has_car(east8,car_83).
shape(car_83,rectangle). short(car_83). roof(car_83,no_roof). load(car_83,triangle_load,1). 
infront(east8,car_82,car_83).
infront(east8,car_81,car_82).

has_car(east9,car_91).
shape(car_91,rectangle). long(car_91). roof(car_91,flat_roof). load(car_91,rectangle_load,3). 
has_car(east9,car_92).
shape(car_92,bucket). short(car_92). roof(car_92,no_roof). load(car_92,triangle_load,1). 
has_car(east9,car_93).
shape(car_93,u_shaped). short(car_93). roof(car_93,no_roof). load(car_93,triangle_load,1). 
infront(east9,car_92,car_93).
infront(east9,car_91,car_92).

has_car(east10,car_101).
shape(car_101,rectangle). long(car_101). roof(car_101,flat_roof). load(car_101,rectangle_load,2). 
has_car(east10,car_102).
shape(car_102,bucket). short(car_102). roof(car_102,no_roof). load(car_102,triangle_load,1). 
has_car(east10,car_103).
shape(car_103,bucket). short(car_103). roof(car_103,no_roof). load(car_103,circle_load,1). 
has_car(east10,car_104).
shape(car_104,hexagon). short(car_104). roof(car_104,flat_roof). load(car_104,rectangle_load,2). 
infront(east10,car_103,car_104).
infront(east10,car_102,car_103).
infront(east10,car_101,car_102).

has_car(west11,car_111).
shape(car_111,rectangle). short(car_111). roof(car_111,flat_roof). load(car_111,rectangle_load,1). 
has_car(west11,car_112).
shape(car_112,rectangle). short(car_112). roof(car_112,peaked_roof). load(car_112,circle_load,1). 
has_car(west11,car_113).
shape(car_113,ellipse). short(car_113). roof(car_113,arc_roof). load(car_113,circle_load,1). 
has_car(west11,car_114).
shape(car_114,rectangle). long(car_114). roof(car_114,no_roof). load(car_114,rectangle_load,3). 
infront(west11,car_113,car_114).
infront(west11,car_112,car_113).
infront(west11,car_111,car_112).

has_car(west12,car_121).
shape(car_121,ellipse). short(car_121). roof(car_121,arc_roof). load(car_121,triangle_load,1). 
has_car(west12,car_122).
shape(car_122,rectangle). long(car_122). roof(car_122,flat_roof). load(car_122,triangle_load,1). 
has_car(west12,car_123).
shape(car_123,u_shaped). short(car_123). roof(car_123,no_roof). load(car_123,rectangle_load,2). 
infront(west12,car_122,car_123).
infront(west12,car_121,car_122).

% train 13 modified to check rules
has_car(west13,car_131).
shape(car_131,bucket). short(car_131). roof(car_131,no_roof). load(car_131,circle_load,1). 
has_car(west13,car_132).
shape(car_132,rectangle). long(car_132). roof(car_132,flat_roof). load(car_132,circle_load,2). 
has_car(west13,car_133).
shape(car_133,rectangle). long(car_133). roof(car_133,no_roof). load(car_133,rectangle_load,3). 
has_car(west13,car_134).
shape(car_134,rectangle). long(car_134). roof(car_134,flat_roof). load(car_134,triangle_load,1). 
infront(west13,car_133,car_134).
infront(west13,car_132,car_133).
infront(west13,car_131,car_132).

has_car(west14,car_141).
shape(car_141,bucket). short(car_141). roof(car_141,no_roof). load(car_141,rectangle_load,1). 
has_car(west14,car_142).
shape(car_142,rectangle). short(car_142). roof(car_142,peaked_roof). load(car_142,circle_load,2). 
has_car(west14,car_143).
shape(car_143,rectangle). long(car_143). roof(car_143,no_roof). load(car_143,circle_load,2). 
has_car(west14,car_144).
shape(car_144,ellipse). short(car_144). roof(car_144,arc_roof). load(car_144,rectangle_load,2). 
infront(west14,car_143,car_144).
infront(west14,car_142,car_143).
infront(west14,car_141,car_142).

has_car(west15,car_151).
shape(car_151,hexagon). short(car_151). roof(car_151,flat_roof). load(car_151,rectangle_load,2). 
has_car(west15,car_152).
shape(car_152,rectangle). short(car_152). roof(car_152,peaked_roof). load(car_152,triangle_load,2). 
infront(west15,car_151,car_152).

has_car(west16,car_161).
shape(car_161,rectangle). short(car_161). roof(car_161,no_roof). load(car_161,circle_load,1). 
has_car(west16,car_162).
shape(car_162,rectangle). short(car_162). roof(car_162,peaked_roof). load(car_162,triangle_load,2). 
infront(west16,car_161,car_162).

has_car(west17,car_171).
shape(car_171,u_shaped). short(car_171). roof(car_171,no_roof). load(car_171,triangle_load,1). 
has_car(west17,car_172).
shape(car_172,u_shaped). short(car_172). roof(car_172,no_roof). load(car_172,circle_load,1). 
has_car(west17,car_173).
shape(car_173,rectangle). long(car_173). roof(car_173,no_roof). load(car_173,triangle_load,1). 
infront(west17,car_172,car_173).
infront(west17,car_171,car_172).

has_car(west18,car_181).
shape(car_181,ellipse). short(car_181). roof(car_181,arc_roof). load(car_181,triangle_load,2). 
has_car(west18,car_182).
shape(car_182,rectangle). short(car_182). roof(car_182,no_roof). load(car_182,rectangle_load,2). 
infront(west18,car_181,car_182).

% train 19 modified to check rules
has_car(west19,car_191).
shape(car_191,rectangle). long(car_191). roof(car_191,no_roof). load(car_191,circle_load,3). 
has_car(west19,car_192).
shape(car_192,rectangle). long(car_192). roof(car_192,flat_roof). load(car_192,triangle_load,1). 
has_car(west19,car_193).
shape(car_193,rectangle). long(car_193). roof(car_193,no_roof). load(car_193,rectangle_load,3). 
has_car(west19,car_194).
shape(car_194,u_shaped). short(car_194). roof(car_194,no_roof). load(car_194,triangle_load,2). 
infront(west19,car_193,car_194).
infront(west19,car_192,car_193).
infront(west19,car_191,car_192).

% train 20 modified to check rules
has_car(west20,car_201).
shape(car_201,ellipse). short(car_201). roof(car_201,arc_roof). load(car_201,triangle_load,2). 
has_car(west20,car_202).
shape(car_202,hexagon). short(car_202). roof(car_202,flat_roof). load(car_202,triangle_load,1). 
has_car(west20,car_203).
shape(car_203,rectangle). long(car_203). roof(car_203,flat_roof). load(car_203,rectangle_load,3). 
has_car(west20,car_204).
shape(car_204,rectangle). long(car_204). roof(car_204,flat_roof). load(car_204,triangle_load,3). 
infront(west20,car_203,car_204).
infront(west20,car_202,car_203).
infront(west20,car_201,car_202).