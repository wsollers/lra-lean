import LRA.Identity.Constructions.Mathlib.Satisfies.SOLFull
import LRA.Identity.Laws.ModelTheory.Relationships

namespace LRA.Identity.Constructions.Mathlib

universe u

/--
`SatisfiesSOLHenkinIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u) (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), LRA.Identity.Logic.SOL.HenkinIdentityTheory domain LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), ((∀ (x : Carrier), x = x) ∧ (∀ (x y : Carrier), x = y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSOLHenkinIdentity (Carrier : Type u)
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
theorem SatisfiesSOLHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

/--
`SatisfiesSOLHenkinModelIdentity` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.HenkinModel S), LRA.Identity.Logic.SOL.HenkinIdentityTheory (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M) LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.HenkinModel S), ((∀ (x : M.Domain), x = x) ∧ (∀ (x y : M.Domain), x = y → ∀ (P : M.Domain → Prop), (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M).Admissible P → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSOLHenkinModelIdentity
    {S : LRA.Logic.Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory
      (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M)
      (NativeIdentity : M.Domain -> M.Domain -> Prop)
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
theorem SatisfiesSOLHenkinModelIdentity
    {S : LRA.Logic.Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory
      (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M)
      (NativeIdentity : M.Domain -> M.Domain -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
