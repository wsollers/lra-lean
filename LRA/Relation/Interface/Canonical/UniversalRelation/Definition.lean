import LRA.Relation.Interface.Definitions

namespace LRA.Relation
universe u

/--
`UniversalRelation` TODO

Predicate logic:

  ∀ (α : Type u) (a a : α), True

Predicate logic (unfolded):

  ∀ (α : Type u) (a a : α), True (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
def UniversalRelation (α : Type u) : Endorelation α := fun _ _ => True
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def UniversalRelation (α : Type u) : Endorelation α := fun _ _ => True

end LRA.Relation
