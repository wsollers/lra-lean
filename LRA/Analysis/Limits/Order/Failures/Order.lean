import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

/--
`PointwiseStrictOrderNeedNotPersistInTheLimit` TODO

Predicate logic:

  ∃ f g ∈ ℝ → ℝ A ∈ Set ℝ c Lf Lg ∈ ℝ, (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg

Predicate logic (unfolded):

  Exists fun f => Exists fun g => Exists fun A => Exists fun c => Exists fun Lf => Exists fun Lg => (∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (f x) (g x) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) Lg))) ε) ∧ Lf = Lg)))

Logical form (Lean):

```lean
theorem PointwiseStrictOrderNeedNotPersistInTheLimit :
    ∃ (f g : ℝ → ℝ) (A : Set ℝ) (c Lf Lg : ℝ),
      (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem PointwiseStrictOrderNeedNotPersistInTheLimit :
    ∃ (f g : ℝ → ℝ) (A : Set ℝ) (c Lf Lg : ℝ),
      (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg := by
  sorry

end LRA.Analysis.Limits
