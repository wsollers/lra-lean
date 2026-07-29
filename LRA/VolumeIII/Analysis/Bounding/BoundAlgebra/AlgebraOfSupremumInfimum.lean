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

/-- Translation preserves suprema. -/
theorem TranslationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ} (supremumHypothesis : IsSupremum s A) (c : ℝ) :
    IsSupremum (s + c) (A + {c}) := by
  sorry

/-- Translation preserves infima. -/
theorem TranslationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ} (infimumHypothesis : IsInfimum i A) (c : ℝ) :
    IsInfimum (i + c) (A + {c}) := by
  sorry

/-- Positive scalar multiplication preserves suprema. -/
theorem PositiveScalarMultiplicationPreservesSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (positiveScaleHypothesis : scale > 0) :
    IsSupremum (scale * s) (ScalarImage scale A) := by
  sorry

/-- Positive scalar multiplication preserves infima. -/
theorem PositiveScalarMultiplicationPreservesInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (positiveScaleHypothesis : scale > 0) :
    IsInfimum (scale * i) (ScalarImage scale A) := by
  sorry

/-- Negative scalar multiplication sends infima to suprema. -/
theorem NegativeScalarMultiplicationSendsInfimaToSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i scale : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (negativeScaleHypothesis : scale < 0) :
    IsSupremum (scale * i) (ScalarImage scale A) := by
  sorry

/-- Negative scalar multiplication sends suprema to infima. -/
theorem NegativeScalarMultiplicationSendsSupremaToInfima {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s scale : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (negativeScaleHypothesis : scale < 0) :
    IsInfimum (scale * s) (ScalarImage scale A) := by
  sorry

/-- Negation exchanges infima and suprema. -/
theorem NegationExchangesInfimaAndSuprema {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {i : ℝ}
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (-i) (-A) := by
  sorry

/-- The supremum of a pointwise sum is the sum of the suprema. -/
theorem SupremumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := by
  sorry

/-- The infimum of a pointwise sum is the sum of the infima. -/
theorem InfimumOfPointwiseSum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := by
  sorry

/-- The supremum of a pointwise difference is `sup A - inf B`. -/
theorem SupremumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA iB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsSupremum (sA - iB) (A - B) := by
  sorry

/-- The infimum of a pointwise difference is `inf A - sup B`. -/
theorem InfimumOfPointwiseDifference {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA sB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsInfimum (iA - sB) (A - B) := by
  sorry

/-- The supremum of a dilation is determined by the sign of the scale. -/
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

/-- The supremum of the absolute-value image is the larger endpoint magnitude. -/
theorem SupremumOfAbsoluteValueImage {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty) {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A) :
    IsSupremum (max |i| |s|) (abs '' A) := by
  sorry

/-- The supremum of a reciprocal image is controlled by the original infimum. -/
theorem SupremumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsSupremum i⁻¹ (Reciprocal A) := by
  sorry

/-- The infimum of a reciprocal image is controlled by the original supremum. -/
theorem InfimumOfReciprocalSet {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i A)
    (separatedFromZeroHypothesis : 0 < i ∨ s < 0) :
    IsInfimum s⁻¹ (Reciprocal A) := by
  sorry

/-- The supremum of a pointwise product is the maximum of the four endpoint products. -/
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

/-- The infimum of a pointwise product is the minimum of the four endpoint products. -/
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

/-- The supremum of a quotient image is the maximum of the four endpoint quotients. -/
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

/-- The infimum of a quotient image is the minimum of the four endpoint quotients. -/
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

/-- Upper bounds add under pointwise set addition. -/
theorem PointwiseSumPreservesUpperBounds {A B : Set ℝ} {uA uB : ℝ}
    (leftUpperBoundHypothesis : IsUpperBound uA A)
    (rightUpperBoundHypothesis : IsUpperBound uB B) :
    IsUpperBound (uA + uB) (A + B) := by
  sorry

/-- Lower bounds add under pointwise set addition. -/
theorem PointwiseSumPreservesLowerBounds {A B : Set ℝ} {lA lB : ℝ}
    (leftLowerBoundHypothesis : IsLowerBound lA A)
    (rightLowerBoundHypothesis : IsLowerBound lB B) :
    IsLowerBound (lA + lB) (A + B) := by
  sorry

/-- Relative upper bounds shrink when the ambient carrier is restricted. -/
theorem RelativeUpperBoundsRespectAmbientOrder [Preorder P] {A S T : Set P}
    (setContainedInSmallerAmbient : A ⊆ S)
    (smallerAmbientContainedInLarger : S ⊆ T) :
    {u | IsRelativeUpperBound S u A} =
      S ∩ {u | IsRelativeUpperBound T u A} := by
  sorry

/-- Relative suprema can depend on the ambient carrier. -/
theorem RelativeSupremaCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      ∃ sS sT : ℝ,
        IsRelativeSupremum S sS A ∧ IsRelativeSupremum T sT A ∧ sS ≠ sT := by
  sorry

/-- Supremum existence can depend on the ambient carrier. -/
theorem RelativeSupremumExistenceCanDependOnAmbientSet :
    ∃ (A S T : Set ℝ), A ⊆ S ∧ S ⊆ T ∧
      (∃ s, IsRelativeSupremum T s A) ∧
        ¬(∃ s, IsRelativeUpperBound S s A) := by
  sorry

/-- The rational square-root gap gives a bounded rational set with no rational supremum. -/
theorem RationalSquareRootGapHasNoRationalSupremum :
    {q : ℚ | q ^ 2 < 2}.Nonempty ∧
      (∃ u : ℚ, IsUpperBound u {q : ℚ | q ^ 2 < 2}) ∧
        ¬(∃ s : ℚ, IsSupremum s {q : ℚ | q ^ 2 < 2}) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
