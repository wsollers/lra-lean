
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

/--
`OrderArithmetic` TODO

Predicate logic:

  (a ≤ b ∧ c ≤ d → a + c ≤ b + d) ∧ (a ≤ b ∧ c > 0 → a * c ≤ b * c) ∧ (a ≤ b ∧ c < 0 → a * c ≥ b * c) ∧ (y ≥ 0 → (|a| ≤ y ↔ -y ≤ a ∧ a ≤ y))

Predicate logic (unfolded):

  ∀ (a b c d y : Real), ((Real.instLE.1 a b ∧ Real.instLE.1 c d) → Real.instLE.1 (instHAdd.1 a c) (instHAdd.1 b d) ∧ ((Real.instLE.1 a b ∧ Real.instLT.1 Zero.toOfNat0.1 c) → Real.instLE.1 (instHMul.1 a c) (instHMul.1 b c) ∧ ((Real.instLE.1 a b ∧ Real.instLT.1 c Zero.toOfNat0.1) → Real.instLE.1 (instHMul.1 b c) (instHMul.1 a c) ∧ Real.instLE.1 Zero.toOfNat0.1 y → Real.instLE.1 (SemilatticeSup.toMax.1 a (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 a)) y ↔ (Real.instLE.1 (Real.instNeg.1 y) a ∧ Real.instLE.1 a y))))

Logical form (Lean):

```lean
theorem OrderArithmetic (a b c d y : ℝ) :
    (a ≤ b ∧ c ≤ d → a + c ≤ b + d) ∧
    (a ≤ b ∧ c > 0 → a * c ≤ b * c) ∧
    (a ≤ b ∧ c < 0 → a * c ≥ b * c) ∧
    (y ≥ 0 → (|a| ≤ y ↔ -y ≤ a ∧ a ≤ y))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem OrderArithmetic (a b c d y : ℝ) :
    (a ≤ b ∧ c ≤ d → a + c ≤ b + d) ∧
    (a ≤ b ∧ c > 0 → a * c ≤ b * c) ∧
    (a ≤ b ∧ c < 0 → a * c ≥ b * c) ∧
    (y ≥ 0 → (|a| ≤ y ↔ -y ≤ a ∧ a ≤ y)) := by
  sorry
end LRA.Analysis.RealAnalysis
