
import LRA.Set.Interface.ModelTheory.LStructure
import LRA.ModelTheory.Theory

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder

/--
`satisfiesIffF` TODO

Predicate logic:

  Satisfies M assignment (iffF φ ψ) ↔ (Satisfies M assignment φ ↔ Satisfies M assignment ψ)

Predicate logic (unfolded):

  ∀ {M : LRA.ModelTheory.FirstOrder.Model LRA.Set.ModelTheory.MembershipSignature} {assignment : Nat → M.1} {φ ψ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat}, LRA.Logic.FirstOrder.Satisfies M assignment ((φ.impl ψ).impl (ψ.impl φ).neg).neg ↔ LRA.Logic.FirstOrder.Satisfies M assignment φ ↔ LRA.Logic.FirstOrder.Satisfies M assignment ψ

Logical form (Lean):

```lean
theorem satisfiesIffF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (iffF φ ψ) ↔
      (Satisfies M assignment φ ↔ Satisfies M assignment ψ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem satisfiesIffF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (iffF φ ψ) ↔
      (Satisfies M assignment φ ↔ Satisfies M assignment ψ) := by
  sorry

/--
`satisfiesOrF` TODO

Predicate logic:

  Satisfies M assignment (orF φ ψ) ↔ (Satisfies M assignment φ ∨ Satisfies M assignment ψ)

Predicate logic (unfolded):

  ∀ {M : LRA.ModelTheory.FirstOrder.Model LRA.Set.ModelTheory.MembershipSignature} {assignment : Nat → M.1} {φ ψ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat}, LRA.Logic.FirstOrder.Satisfies M assignment (φ.neg.impl ψ) ↔ Or (LRA.Logic.FirstOrder.Satisfies M assignment φ) (LRA.Logic.FirstOrder.Satisfies M assignment ψ)

Logical form (Lean):

```lean
theorem satisfiesOrF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (orF φ ψ) ↔
      (Satisfies M assignment φ ∨ Satisfies M assignment ψ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem satisfiesOrF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (orF φ ψ) ↔
      (Satisfies M assignment φ ∨ Satisfies M assignment ψ) := by
  sorry

end LRA.Set.ModelTheory
