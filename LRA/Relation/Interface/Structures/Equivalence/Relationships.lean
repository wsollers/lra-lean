import LRA.Relation.Interface.Canonical.IdentityRelation.Definition
import LRA.Relation.Interface.Structures.Definition

namespace LRA.Relation

universe u

/--
`IdentityRelationIsEquivalenceRelation` TODO

Predicate logic:

  ∀ {α : Type u}, LRA.Relation.EquivalenceRelation (LRA.Relation.IdentityRelation α)

Predicate logic (unfolded):

  Ambient
    (α)
  Objects
    (none)
  Prove
    ((∀ (x : α), x = x) ∧ ((∀ (x y : α), x = y → y = x) ∧ (∀ (x y z : α), x = y → y = z → x = z)))

Logical form (Lean):

```lean
theorem IdentityRelationIsEquivalenceRelation {α : Type u} :
    EquivalenceRelation (IdentityRelation α)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem IdentityRelationIsEquivalenceRelation {α : Type u} :
    EquivalenceRelation (IdentityRelation α) := by
  sorry
end LRA.Relation
