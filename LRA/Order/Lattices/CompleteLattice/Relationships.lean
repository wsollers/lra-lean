import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Lattices.CompleteLattice.Definition

namespace LRA.Order

universe u v

/--
`ConverseIsCompleteLatticeIff` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element), LRA.Order.CompleteLattice SetObject (LRA.Relation.Converse relation) ↔ LRA.Order.CompleteLattice SetObject relation

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
  Prove
    LRA.Order.CompleteLattice SetObject (LRA.Relation.Converse relation) ↔ LRA.Order.CompleteLattice SetObject relation

Logical form (Lean):

```lean
theorem ConverseIsCompleteLatticeIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) :
    CompleteLattice SetObject (LRA.Relation.Converse relation) ↔
      CompleteLattice SetObject relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem ConverseIsCompleteLatticeIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) :
    CompleteLattice SetObject (LRA.Relation.Converse relation) ↔
      CompleteLattice SetObject relation := by
  sorry
end LRA.Order
