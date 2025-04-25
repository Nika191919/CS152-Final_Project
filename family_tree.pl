% === FACTS ===

% Gender
male(john). male(michael). male(david). male(alex). male(brian).
female(linda). female(susan). female(claire). female(emma). female(alice).

% Parent relationships
parent(john, michael). parent(john, susan).
parent(linda, michael). parent(linda, susan).

parent(michael, alex). parent(michael, emma).
parent(claire, alex). parent(claire, emma).

parent(susan, brian). parent(susan, alice).
parent(david, brian). parent(david, alice).

% === RULES ===

child(X, Y) :- parent(Y, X).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

aunt_or_uncle(X, Y) :- parent(Z, Y), sibling(X, Z).

cousin(X, Y) :- parent(A, X), parent(B, Y), sibling(A, B), X \= Y.

% === Advanced Queries ===

% Maternal cousin (cousin via mother's sibling)
maternal_cousin(X, Y) :-
    parent(MX, X), female(MX),
    parent(MY, Y), female(MY),
    sibling(MX, MY), X \= Y.

% Paternal cousin (via father’s sibling)
paternal_cousin(X, Y) :-
    parent(PX, X), male(PX),
    parent(PY, Y), male(PY),
    sibling(PX, PY), X \= Y.

% Count number of inference steps (proof depth)
:- dynamic steps/1.
steps(0).

reset_steps :- retractall(steps(_)), assert(steps(0)).
inc_steps :- retract(steps(N)), N1 is N+1, assert(steps(N1)).
trackable_parent(X, Y) :- inc_steps, parent(X, Y).

trackable_ancestor(X, Y) :- reset_steps, ancestor_tracked(X, Y), steps(N), write('Inference steps: '), writeln(N).
ancestor_tracked(X, Y) :- trackable_parent(X, Y).
ancestor_tracked(X, Y) :- trackable_parent(X, Z), ancestor_tracked(Z, Y).
