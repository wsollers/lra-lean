import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Theorems

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`axiomaticIdentityRelation_satisfiesReflexivity` TODO

Predicate logic:

  ∀ (Carrier : Type u) (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem axiomaticIdentityRelation_satisfiesReflexivity (Carrier : Type u) :
    ∀ x : Carrier, Ax_IdentityRelation x x := by
  intro x
  have xRx
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
theorem axiomaticIdentityRelation_satisfiesReflexivity (Carrier : Type u) :
    ∀ x : Carrier, Ax_IdentityRelation x x := by
  intro x
  have xRx := Ax_IdentityReflexivity x
  exact xRx


end LRA.Identity.Constructions.Axiomatic
