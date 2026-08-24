import LRA.Relation.Definition

namespace LRA.Relation
universe u

/--
`EmptyRelation` TODO

Predicate logic:

  ∀ (α : Type u) (a a : α), False

Predicate logic (unfolded):

  ∀ (α : Type u) (a a : α), False (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
def EmptyRelation (α : Type u) : Endorelation α := fun _ _ => False
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
def EmptyRelation (α : Type u) : Endorelation α := fun _ _ => False

end LRA.Relation
