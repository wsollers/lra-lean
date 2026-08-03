import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Algebraic behavior of suprema and infima under set operations.
-/

open scoped Pointwise

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
open scoped Pointwise

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

/-- The reciprocal image of a real set. -/
def Reciprocal (A : Set ℝ) : Set ℝ :=
  (fun a => a⁻¹) '' A

/-- The image of a real set under scalar multiplication. -/
def ScalarImage (scale : ℝ) (A : Set ℝ) : Set ℝ :=
  (fun a => scale * a) '' A

/-- Upper bounds of `A` relative to an ambient carrier `ambient`. -/
def IsRelativeUpperBound [Preorder S] (ambient : Set S) (u : S) (A : Set S) : Prop :=
  u ∈ ambient ∧ IsUpperBound u A

/-- Lower bounds of `A` relative to an ambient carrier `ambient`. -/
def IsRelativeLowerBound [Preorder S] (ambient : Set S) (l : S) (A : Set S) : Prop :=
  l ∈ ambient ∧ IsLowerBound l A

/-- A relative supremum is the least relative upper bound in the ambient carrier. -/
def IsRelativeSupremum [Preorder S] (ambient : Set S) (s : S) (A : Set S) : Prop :=
  IsRelativeUpperBound ambient s A ∧
    ∀ u, IsRelativeUpperBound ambient u A → s ≤ u

/-- A relative infimum is the greatest relative lower bound in the ambient carrier. -/
def IsRelativeInfimum [Preorder S] (ambient : Set S) (i : S) (A : Set S) : Prop :=
  IsRelativeLowerBound ambient i A ∧
    ∀ l, IsRelativeLowerBound ambient l A → l ≤ i

/-- Let `A` be a nonempty subset of `ℝ` with supremum `s`, and let `c : ℝ`.
Then the translated set `A + {c}` has supremum `s + c`. -/
theorem TranslationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ} (supremumHypothesis : IsSupremum s A) (c : ℝ) :
    IsSupremum (s + c) (A + {c}) := by
  rcases supremumHypothesis with ⟨upperBoundHypothesis, leastUpperBoundHypothesis⟩
  constructor
  · intro elementInA pointwiseSumHypothesis
    rcases pointwiseSumHypothesis with ⟨elementInA, elementInSingleton, singletonElement, singletonHypothesis, sumHypothosis⟩
    sorry
  · sorry

/-- Let `A` be a nonempty subset of `ℝ` with infimum `i`, and let `c : ℝ`.
Then the translated set `A + {c}` has infimum `i + c`. -/
theorem TranslationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ} (infimumHypothesis : IsInfimum i A) (c : ℝ) :
    IsInfimum (i + c) (A + {c}) := by
  sorry

/-- Let `A` be a nonempty subset of `ℝ` with supremum `s`, and let
`scale > 0`. Then the scalar image `scale • A` has supremum `scale * s`. -/
theorem PositiveScalarMultiplicationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (positiveScaleHypothesis : scale > 0) :
    IsSupremum (scale * s) (ScalarImage scale A) := by
  sorry

/-- Let `A` be a nonempty subset of `ℝ` with infimum `i`, and let `scale > 0`.
Then the scalar image `scale • A` has infimum `scale * i`. -/
theorem PositiveScalarMultiplicationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (positiveScaleHypothesis : scale > 0) :
    IsInfimum (scale * i) (ScalarImage scale A) := by
  sorry

/-- Let `A` be a nonempty subset of `ℝ` with infimum `i`, and let `scale < 0`.
Then the scalar image `scale • A` has supremum `scale * i`. -/
theorem NegativeScalarMultiplicationSendsInfimaToSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (negativeScaleHypothesis : scale < 0) :
    IsSupremum (scale * i) (ScalarImage scale A) := by
  sorry

/-- Let `A` be a nonempty subset of `ℝ` with supremum `s`, and let `scale < 0`.
Then the scalar image `scale • A` has infimum `scale * s`. -/
theorem NegativeScalarMultiplicationSendsSupremaToInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (negativeScaleHypothesis : scale < 0) :
    IsInfimum (scale * s) (ScalarImage scale A) := by
  sorry

/-- Let `A` be a nonempty subset of `ℝ` with infimum `i`. Then the negated set
`-A` has supremum `-i`. -/
theorem NegationExchangesInfimaAndSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i : ℝ}
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (-i) (-A) := by
  sorry

/-- Let `A B : Set ℝ` and `sA sB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`, and
`rightSupremumHypothesis : IsSupremum sB B`. Then `IsSupremum (sA + sB) (A + B)`. -/
theorem SupremumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := by
  sorry

/-- Let `A B : Set ℝ` and `iA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftInfimumHypothesis : IsInfimum iA A`, and
`rightInfimumHypothesis : IsInfimum iB B`. Then `IsInfimum (iA + iB) (A + B)`. -/
theorem InfimumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := by
  sorry

/-- Let `A B : Set ℝ` and `sA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`, and
`rightInfimumHypothesis : IsInfimum iB B`. Then `IsSupremum (sA - iB) (A - B)`. -/
theorem SupremumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsSupremum (sA - iB) (A - B) := by
  sorry

/-- Let `A B : Set ℝ` and `iA sB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftInfimumHypothesis : IsInfimum iA A`, and
`rightSupremumHypothesis : IsSupremum sB B`. Then `IsInfimum (iA - sB) (A - B)`. -/
theorem InfimumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA sB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsInfimum (iA - sB) (A - B) := by
  sorry

/-- Let `A : Set ℝ`, `scale : ℝ`, and `s i : ℝ`. If `nonemptyHypothesis : A.Nonempty`,
`boundedHypothesis : IsBounded A`, `supremumHypothesis : IsSupremum s A`, and `infimumHypothesis
: IsInfimum i A`. Then `IsSupremum (if scale > 0 then scale * s else if scale = 0 then 0 else
scale * i) (ScalarImage scale A)`. -/
theorem SupremumOfDilation {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    (scale : ℝ) {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum
      (if scale > 0 then scale * s else if scale = 0 then 0 else scale * i)
      (ScalarImage scale A) := by
  sorry

/-- Let `A : Set ℝ` and `s i : ℝ`. If `nonemptyHypothesis : A.Nonempty`, `supremumHypothesis :
IsSupremum s A`, and `infimumHypothesis : IsInfimum i A`. Then `IsSupremum (max |i| |s|) (abs ''
A)`. -/
theorem SupremumOfAbsoluteValueImage {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (max |i| |s|) (abs '' A) := by
  sorry

/-- Let `A : Set ℝ` and `s i : ℝ`. If `nonemptyHypothesis : A.Nonempty`, `boundedHypothesis :
IsBounded A`, `supremumHypothesis : IsSupremum s A`, `infimumHypothesis : IsInfimum i A`, and
`separatedFromZeroHypothesis : 0 < i ∨ s < 0`. Then `IsSupremum i⁻¹ (Reciprocal A)`. -/
theorem SupremumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsSupremum i⁻¹ (Reciprocal A) := by
  sorry

/-- Let `A : Set ℝ` and `s i : ℝ`. If `nonemptyHypothesis : A.Nonempty`, `boundedHypothesis :
IsBounded A`, `supremumHypothesis : IsSupremum s A`, `infimumHypothesis : IsInfimum i A`, and
`separatedFromZeroHypothesis : 0 < i ∨ s < 0`. Then `IsInfimum s⁻¹ (Reciprocal A)`. -/
theorem InfimumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsInfimum s⁻¹ (Reciprocal A) := by
  sorry

/-- Let `A B : Set ℝ` and `sA sB iA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`,
`leftInfimumHypothesis : IsInfimum iA A`, `rightSupremumHypothesis : IsSupremum sB B`, and
`rightInfimumHypothesis : IsInfimum iB B`. Then `IsSupremum (max (max (iA * iB) (iA * sB)) (max
(sA * iB) (sA * sB))) (A * B)`. -/
theorem SupremumOfPointwiseProduct {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsSupremum
      (max (max (iA * iB) (iA * sB)) (max (sA * iB) (sA * sB)))
      (A * B) := by
  sorry

/-- Let `A B : Set ℝ` and `sA sB iA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`,
`leftInfimumHypothesis : IsInfimum iA A`, `rightSupremumHypothesis : IsSupremum sB B`, and
`rightInfimumHypothesis : IsInfimum iB B`. Then `IsInfimum (min (min (iA * iB) (iA * sB)) (min
(sA * iB) (sA * sB))) (A * B)`. -/
theorem InfimumOfPointwiseProduct {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum
      (min (min (iA * iB) (iA * sB)) (min (sA * iB) (sA * sB)))
      (A * B) := by
  sorry

/-- Let `A B : Set ℝ` and `sA sB iA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`,
`leftInfimumHypothesis : IsInfimum iA A`, `rightSupremumHypothesis : IsSupremum sB B`,
`rightInfimumHypothesis : IsInfimum iB B`, and `denominatorSeparatedFromZeroHypothesis : 0 < iB
∨ sB < 0`. Then `IsSupremum (max (max (iA / iB) (iA / sB)) (max (sA / iB) (sA / sB))) (A *
Reciprocal B)`. -/
theorem SupremumOfQuotientSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B)
    (denominatorSeparatedFromZeroHypothesis : 0 < iB ∨ sB < 0) :
    IsSupremum
      (max (max (iA / iB) (iA / sB)) (max (sA / iB) (sA / sB)))
      (A * Reciprocal B) := by
  sorry

/-- Let `A B : Set ℝ` and `sA sB iA iB : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `leftSupremumHypothesis : IsSupremum sA A`,
`leftInfimumHypothesis : IsInfimum iA A`, `rightSupremumHypothesis : IsSupremum sB B`,
`rightInfimumHypothesis : IsInfimum iB B`, and `denominatorSeparatedFromZeroHypothesis : 0 < iB
∨ sB < 0`. Then `IsInfimum (min (min (iA / iB) (iA / sB)) (min (sA / iB) (sA / sB))) (A *
Reciprocal B)`. -/
theorem InfimumOfQuotientSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB iA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B)
    (rightInfimumHypothesis : IsInfimum iB B)
    (denominatorSeparatedFromZeroHypothesis : 0 < iB ∨ sB < 0) :
    IsInfimum
      (min (min (iA / iB) (iA / sB)) (min (sA / iB) (sA / sB)))
      (A * Reciprocal B) := by
  sorry

/-- Let `A B : Set ℝ` and `uA uB : ℝ`. If `leftUpperBoundHypothesis : IsUpperBound uA A` and
`rightUpperBoundHypothesis : IsUpperBound uB B`. Then `IsUpperBound (uA + uB) (A + B)`. -/
theorem PointwiseSumPreservesUpperBounds {A B : Set ℝ} {uA uB : ℝ}
    (leftUpperBoundHypothesis : IsUpperBound uA A)
    (rightUpperBoundHypothesis : IsUpperBound uB B) :
    IsUpperBound (uA + uB) (A + B) := by
  sorry

/-- Let `A B : Set ℝ` and `lA lB : ℝ`. If `leftLowerBoundHypothesis : IsLowerBound lA A` and
`rightLowerBoundHypothesis : IsLowerBound lB B`. Then `IsLowerBound (lA + lB) (A + B)`. -/
theorem PointwiseSumPreservesLowerBounds {A B : Set ℝ} {lA lB : ℝ}
    (leftLowerBoundHypothesis : IsLowerBound lA A)
    (rightLowerBoundHypothesis : IsLowerBound lB B) :
    IsLowerBound (lA + lB) (A + B) := by
  sorry

/-- Let `A S T : Set P`. If `[Preorder P]`, `setContainedInSmallerAmbient : A ⊆ S`, and
`smallerAmbientContainedInLarger : S ⊆ T`. Then `{u | IsRelativeUpperBound S u A} = S ∩ {u |
IsRelativeUpperBound T u A}`. -/
theorem RelativeUpperBoundsRespectAmbientOrder [Preorder P] {A S T : Set P}
    (setContainedInSmallerAmbient : A ⊆ S)
    (smallerAmbientContainedInLarger : S ⊆ T) :
    {u | IsRelativeUpperBound S u A} =
      S ∩ {u | IsRelativeUpperBound T u A} := by
  sorry

/-- The theorem asserts `∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧ ∃ sS sT : ℝ, IsRelativeSupremum S sS A ∧
IsRelativeSupremum T sT A ∧ sS ≠ sT`. -/
theorem RelativeSupremaCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      ∃ sS sT : ℝ,
        IsRelativeSupremum S sS A ∧ IsRelativeSupremum T sT A ∧ sS ≠ sT := by
  sorry

/-- The theorem asserts `∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧ (∃ s, IsRelativeSupremum T s A) ∧ ¬(∃ s,
IsRelativeUpperBound S s A)`. -/
theorem RelativeSupremumExistenceCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      (∃ s, IsRelativeSupremum T s A) ∧
        ¬(∃ s, IsRelativeUpperBound S s A) := by
  sorry

/-- The theorem asserts `{q : ℚ | q ^ 2 < 2}.Nonempty ∧ (∃ u : ℚ, IsUpperBound u {q : ℚ | q ^ 2 <
2}) ∧ ¬(∃ s : ℚ, IsSupremum s {q : ℚ | q ^ 2 < 2})`. -/
theorem RationalSquareRootGapHasNoRationalSupremum :
    {q : ℚ | q ^ 2 < 2}.Nonempty ∧
      (∃ u : ℚ, IsUpperBound u {q : ℚ | q ^ 2 < 2}) ∧
        ¬(∃ s : ℚ, IsSupremum s {q : ℚ | q ^ 2 < 2}) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
