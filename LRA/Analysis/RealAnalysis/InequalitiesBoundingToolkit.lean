
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

/--
`OrderArithmetic` TODO

Predicate logic:

  ∀ (a b c d y : Real), ((Real.instLE.le a b ∧ Real.instLE.le c d) → Real.instLE.le (instHAdd.hAdd a c) (instHAdd.hAdd b d) ∧ ((Real.instLE.le a b ∧ GT.gt c 0) → Real.instLE.le (instHMul.hMul a c) (instHMul.hMul b c) ∧ ((Real.instLE.le a b ∧ Real.instLT.lt c 0) → GE.ge (instHMul.hMul a c) (instHMul.hMul b c) ∧ (GE.ge y 0 → Real.instLE.le (abs a) y ↔ (Real.instLE.le (Real.instNeg.neg y) a ∧ Real.instLE.le a y)))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c d y : ℝ
  Prove
    ((Real.instLE.le a b ∧ Real.instLE.le c d) → Real.instLE.le (instHAdd.hAdd a c) (instHAdd.hAdd b d) ∧ ((Real.instLE.le a b ∧ GT.gt c 0) → Real.instLE.le (instHMul.hMul a c) (instHMul.hMul b c) ∧ ((Real.instLE.le a b ∧ Real.instLT.lt c 0) → GE.ge (instHMul.hMul a c) (instHMul.hMul b c) ∧ (GE.ge y 0 → Real.instLE.le (abs a) y ↔ (Real.instLE.le (Real.instNeg.neg y) a ∧ Real.instLE.le a y)))))

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
