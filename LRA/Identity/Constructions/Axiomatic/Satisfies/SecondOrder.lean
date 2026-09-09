import LRA.Identity.Constructions.Axiomatic.Satisfies.SOLHenkin
import LRA.Identity.Constructions.Axiomatic.Satisfies.SOLFull
import LRA.Identity.Interface.SecondOrder

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`SatisfiesSecondOrderHenkinIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u) (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), LRA.Identity.Logic.SOL.HenkinIdentityTheory domain LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSecondOrderHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
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
theorem SatisfiesSecondOrderHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

/--
`SatisfiesSecondOrderFullIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u), LRA.Identity.Logic.SOL.FullIdentityTheory LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ (Carrier : Type u), ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSecondOrderFullIdentity (Carrier : Type u) :
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
theorem SatisfiesSecondOrderFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic
