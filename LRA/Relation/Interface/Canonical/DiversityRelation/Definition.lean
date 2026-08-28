import LRA.Relation.Interface.Definitions

namespace LRA.Relation
universe u

/--
`DiversityRelation` TODO

Predicate logic:

  ∀ (α : Type u) (a a_1 : α), a = a_1 → False

Predicate logic (unfolded):

  ∀ (α : Type u) (a a_1 : α), a = a_1 → False

Logical form (Lean):

```lean
def DiversityRelation (α : Type u) : Endorelation α := fun x y => x ≠ y
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
def DiversityRelation (α : Type u) : Endorelation α := fun x y => x ≠ y

end LRA.Relation
