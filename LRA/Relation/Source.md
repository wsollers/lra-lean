# Sources for Relation

## Primary source

- Steven Givant, “The calculus of relations,” Chapter 1 in *Introduction to Relation Algebras: Relation Algebras, Volume 1*, Springer, 2017.
  - Primary reference for the relation-calculus viewpoint: binary relations, operations on relations, relational laws, relational properties, and the algebraic organization of relation theory.
  - The LRA architecture follows mathematical ownership and dependency order rather than reproducing the chapter structure verbatim.

## Architectural use

`LRA.Relation` owns generic relation vocabulary and calculus: canonical relations, common classes of binary relations, relation operations, closure constructions, relation-valued and class-valued calculus, and named relation structures such as equivalence, partial equivalence, and tolerance relations.

Downstream subjects specialize this theory rather than redefining it. In particular, `Function` treats functions as function-like relations with extra laws, while `Order` owns order structures built from relation properties.
