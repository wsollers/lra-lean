import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Theorems

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`axiomaticIdentityRelation_satisfiesReflexivity` TODO

Predicate logic:

  ∀ x : Carrier, Ax_IdentityRelation x x

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem axiomaticIdentityRelation_satisfiesReflexivity (Carrier : Type u) :
    ∀ x : Carrier, Ax_IdentityRelation x x
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
  exact Ax_EqualityReflexivity x


end LRA.Identity.Construction.Axiomatic
