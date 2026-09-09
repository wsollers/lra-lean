import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Constructions.Mathlib

universe u

/--
`SatisfiesSOLFullIdentity` TODO

Predicate logic:

  ∀ (Carrier : Type u), LRA.Identity.Logic.SOL.FullIdentityTheory LRA.Identity.Constructions.Mathlib.NativeIdentity

Predicate logic (unfolded):

  ∀ (Carrier : Type u), ((∀ (x : Carrier), x = x) ∧ (∀ (x y : Carrier), x = y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem SatisfiesSOLFullIdentity (Carrier : Type u) :
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
theorem SatisfiesSOLFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
