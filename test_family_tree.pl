:- consult('family_tree.pl').

% === TEST CASES ===

:- writeln("=== Test: Cousins of Alice ==="),
   findall(C, cousin(alice, C), Cs), writeln(Cs).

:- writeln("=== Test: Susan’s siblings ==="),
   findall(S, sibling(susan, S), Ss), writeln(Ss).

:- writeln("=== Test: John’s grandchildren ==="),
   findall(G, grandparent(john, G), Gs), writeln(Gs).

:- writeln("=== Test: Is Michael ancestor of Emma? ==="),
   (ancestor(michael, emma) -> writeln('Yes'); writeln('No')).

:- writeln("=== Test: Brian’s aunts/uncles ==="),
   findall(AU, aunt_or_uncle(AU, brian), AUs), writeln(AUs).

:- writeln("=== Test: Maternal cousins of Alice ==="),
   findall(C, maternal_cousin(alice, C), Ms), writeln(Ms).

:- writeln("=== Test: Paternal cousins of Alice ==="),
   findall(C, paternal_cousin(alice, C), Ps), writeln(Ps).

:- writeln("=== Test: Inference steps for ancestor(michael, emma) ==="),
   trackable_ancestor(michael, emma).
