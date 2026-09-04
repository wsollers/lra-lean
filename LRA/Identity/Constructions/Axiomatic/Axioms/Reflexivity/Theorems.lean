import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Definitions

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`axiomaticIdentityRelation_isReflexive` TODO

Predicate logic:

  LRA.Identity.IsReflexiveIdentityRelation Ax_IdentityRelation ∈ Carrier → Carrier → Prop

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x x

Logical form (Lean):

```lean
theorem axiomaticIdentityRelation_isReflexive (Carrier : Type u) :
    LRA.Identity.IsReflexiveIdentityRelation (Ax_IdentityRelation : Carrier → Carrier → Prop)
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
theorem axiomaticIdentityRelation_isReflexive (Carrier : Type u) :
    LRA.Identity.IsReflexiveIdentityRelation (Ax_IdentityRelation : Carrier → Carrier → Prop) := by
  intro x
  exact Ax_EqualityReflexivity x


end LRA.Identity.Construction.Axiomatic
