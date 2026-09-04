import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Satisfies
import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Theorems
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`axiomaticIdentityRelation_satisfiesFirstOrderLeibniz` TODO

Predicate logic:

  LRA.Identity.EqualityFirstOrderTheory Admissible Ax_IdentityRelation ∈ Carrier → Carrier → Prop

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    Admissible : (Carrier → Prop) → Prop
  Prove
    LRA.Identity.IdentityTheory Admissible LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation

Logical form (Lean):

```lean
theorem axiomaticIdentityRelation_satisfiesFirstOrderLeibniz
    (Carrier : Type u) (Admissible : (Carrier → Prop) → Prop) :
    LRA.Identity.EqualityFirstOrderTheory Admissible
      (Ax_IdentityRelation : Carrier → Carrier → Prop)
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
theorem axiomaticIdentityRelation_satisfiesFirstOrderLeibniz
    (Carrier : Type u) (Admissible : (Carrier → Prop) → Prop) :
    LRA.Identity.EqualityFirstOrderTheory Admissible
      (Ax_IdentityRelation : Carrier → Carrier → Prop) := by
  --unfold

  constructor
  . -- reflexive
    intro x
    exact Ax_EqualityReflexivity x


  . -- leibniz
    intro x y
    intro Rxy
    intro P
    intro pIsAdmissible
    intro Px
    exact Ax_LeibnizLaw Rxy P Px


end LRA.Identity.Construction.Axiomatic
