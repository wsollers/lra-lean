import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import LRA.Analysis.Completeness.Completeness.Definition

namespace LRA.Analysis.Completeness

/--
`ExistsUniqueNonnegSqrt` TODO

Predicate logic:

  (0 ≤ a) → ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a

Predicate logic (unfolded):

  ∀ (a : Real), Real.instLE.1 Zero.toOfNat0.1 a → Exists fun x => ((fun b => (Real.instLE.1 Zero.toOfNat0.1 b ∧ instHPow.1 b (instOfNatNat 2).1 = a)) x ∧ ∀ (y : Real), (Real.instLE.1 Zero.toOfNat0.1 y ∧ instHPow.1 y (instOfNatNat 2).1 = a) → y = x)

Logical form (Lean):

```lean
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a := by
  sorry
/--
`RealDedekindCutAtSqrtTwoHasNoGap` TODO

Predicate logic:

  (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧ (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧ ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x)

Predicate logic (unfolded):

  ((Exists fun m => (Set.instMembership.1 LRA.Analysis.Completeness.RealCutLowerAtSqrtTwo m ∧ ∀ (x : Real), Set.instMembership.1 LRA.Analysis.Completeness.RealCutLowerAtSqrtTwo x → Real.instLE.1 x m)) → False ∧ (Set.instMembership.1 LRA.Analysis.Completeness.RealCutUpperAtSqrtTwo instOfNatAtLeastTwo.1.sqrt ∧ ∀ (x : Real), Set.instMembership.1 LRA.Analysis.Completeness.RealCutUpperAtSqrtTwo x → Real.instLE.1 instOfNatAtLeastTwo.1.sqrt x))

Logical form (Lean):

```lean
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x)
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
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x) := by
  sorry
/--
`BisectionStepsTowardSqrtTwo` TODO

Predicate logic:

  1 ∈ ℝ < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧ 1.4 ∈ ℝ < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧ 1.41 ∈ ℝ < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42

Predicate logic (unfolded):

  (Real.instLT.1 One.toOfNat1.1 instOfNatAtLeastTwo.1.sqrt ∧ (Real.instLT.1 instOfNatAtLeastTwo.1.sqrt instOfNatAtLeastTwo.1 ∧ (Real.instLT.1 (NNRatCast.toOfScientific.1 14 Bool.true 1) instOfNatAtLeastTwo.1.sqrt ∧ (Real.instLT.1 instOfNatAtLeastTwo.1.sqrt (NNRatCast.toOfScientific.1 15 Bool.true 1) ∧ (Real.instLT.1 (NNRatCast.toOfScientific.1 141 Bool.true 2) instOfNatAtLeastTwo.1.sqrt ∧ Real.instLT.1 instOfNatAtLeastTwo.1.sqrt (NNRatCast.toOfScientific.1 142 Bool.true 2))))))

Logical form (Lean):

```lean
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42 := by
  sorry
end LRA.Analysis.Completeness
