import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Interface.Identity
import LRA.Identity.Constructions.Axiomatic.Axioms.Reflexivity.Satisfies
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`SatisfiesGenericIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u), LRA.Identity.IsIdentityRelation LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ (Carrier : Type u), ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesGenericIdentity (Carrier : Type u) :
    LRA.Identity.IsIdentityRelation
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)
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
theorem SatisfiesGenericIdentity (Carrier : Type u) :
    LRA.Identity.IsIdentityRelation
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  constructor
  . -- reflexive
    intro x
    have xRx := axiomaticIdentityRelation_satisfiesReflexivity Carrier x
    exact xRx

  . -- Leibniz

    intro x y xIy
    intro P

    have fx : FullLeibniz Carrier P → P x → P y :=
      fun hFull hPx =>
      axiomaticLeibnizLaw xIy P hPx

    exact fx


end LRA.Identity.Constructions.Axiomatic
