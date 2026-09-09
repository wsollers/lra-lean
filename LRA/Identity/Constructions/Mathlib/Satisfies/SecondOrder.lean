import LRA.Identity.Constructions.Mathlib.Satisfies.SOLHenkin
import LRA.Identity.Constructions.Mathlib.Satisfies.SOLFull

namespace LRA.Identity.Constructions.Mathlib

universe u

/--
`SatisfiesSecondOrderHenkinIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u) (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), LRA.Identity.Logic.SOL.HenkinIdentityTheory domain LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), ((∀ (x : Carrier), x = x) ∧ (∀ (x y : Carrier), x = y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSecondOrderHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (NativeIdentity : Carrier -> Carrier -> Prop)
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
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

/--
`SatisfiesSecondOrderFullIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u), LRA.Identity.Logic.SOL.FullIdentityTheory LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ (Carrier : Type u), ((∀ (x : Carrier), x = x) ∧ (∀ (x y : Carrier), x = y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSecondOrderFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (NativeIdentity : Carrier -> Carrier -> Prop)
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
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
