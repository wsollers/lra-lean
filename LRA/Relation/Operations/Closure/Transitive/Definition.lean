import LRA.Relation.Definition

namespace LRA.Relation

universe u

/--
`TransitiveClosure` TODO

Predicate logic:

  inductive TransitiveClosure {Alpha : Type u}
    (relation : Endorelation Alpha) : Endorelation Alpha
  | base {left right : Alpha} :
      relation left right → TransitiveClosure relation left right
  | trans {left middle right : Alpha} :
      TransitiveClosure relation left middle →
      TransitiveClosure relation middle right →
      TransitiveClosure relation left right

Predicate logic (unfolded):

  inductive TransitiveClosure {Alpha : Type u}
    (relation : Endorelation Alpha) : Endorelation Alpha
  | base {left right : Alpha} :
      relation left right → TransitiveClosure relation left right
  | trans {left middle right : Alpha} :
      TransitiveClosure relation left middle →
      TransitiveClosure relation middle right →
      TransitiveClosure relation left right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive TransitiveClosure {Alpha : Type u}
    (relation : Endorelation Alpha) : Endorelation Alpha
  | base {left right : Alpha} :
      relation left right → TransitiveClosure relation left right
  | trans {left middle right : Alpha} :
      TransitiveClosure relation left middle →
      TransitiveClosure relation middle right →
      TransitiveClosure relation left right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
inductive TransitiveClosure {Alpha : Type u}
    (relation : Endorelation Alpha) : Endorelation Alpha
  | base {left right : Alpha} :
      relation left right → TransitiveClosure relation left right
  | trans {left middle right : Alpha} :
      TransitiveClosure relation left middle →
      TransitiveClosure relation middle right →
      TransitiveClosure relation left right

end LRA.Relation
