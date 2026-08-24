import LRA.Relation.Definition

namespace LRA.Relation
universe u

/--
`IdentityRelation` TODO

Predicate logic:

  ∀ (α : Type u) (a a_1 : α), a = a_1

Predicate logic (unfolded):

  ∀ (α : Type u) (a a_1 : α), a = a_1

Logical form (Lean):

```lean
def IdentityRelation (α : Type u) : Endorelation α := fun x y => x = y
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
def IdentityRelation (α : Type u) : Endorelation α := fun x y => x = y

end LRA.Relation
