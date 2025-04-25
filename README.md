# CS152-Final_Project

# Prolog Family Tree Reasoner — CS152 Final Project

This project implements a logic-based family tree reasoner using **Prolog** as part of the CS152 course on Artificial Intelligence at Minerva University.

It models family relationships like siblings, cousins, ancestors, and allows inference-based queries — applying key course learning outcomes:  
- `#cs152-ailogic`  
- `#cs152-aicoding`

---

## 🔧 Features
- ✅ Define parent, male/female relationships
- ✅ Infer siblings, grandparents, aunts/uncles
- ✅ Compute recursive ancestors
- ✅ Advanced: maternal/paternal cousins
- ✅ Track number of inference steps for queries

---

## ▶ How to Run in [SWISH](https://swish.swi-prolog.org/)
1. Paste `family_tree.pl` into [SWISH](https://swish.swi-prolog.org/)
2. Run queries like:
```prolog
?- cousin(alice, Who).
?- ancestor(michael, emma).
?- trackable_ancestor(michael, emma).
