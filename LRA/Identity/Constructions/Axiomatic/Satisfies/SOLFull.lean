import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Satisfies
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`SatisfiesSOLFullIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u), LRA.Identity.Logic.SOL.FullIdentityTheory LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ (Carrier : Type u), ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSOLFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
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
theorem SatisfiesSOLFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic
