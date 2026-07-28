import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.UpperLowerBounds

/-!
Translation, dilation, and reflection of bounded subsets of the real line.
-/

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra

/-- `Displace A c` is the translate of `A` by `c`. -/
def Displace (A : Set ℝ) (c : ℝ) : Set ℝ :=
  (fun a => a + c) '' A

/-- `Dilate A scale` is the image of `A` under scalar multiplication by `scale`. -/
def Dilate (A : Set ℝ) (scale : ℝ) : Set ℝ :=
  (fun a => scale * a) '' A

/-- `Reflect A` is the image of `A` under negation. -/
def Reflect (A : Set ℝ) : Set ℝ :=
  (fun a => -a) '' A

/-- Translation preserves upper bounds. -/
theorem TranslationPreservesUpperBounds {A : Set ℝ} {c u : ℝ}
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (u + c) (Displace A c) := by
  sorry

/-- Translation preserves lower bounds. -/
theorem TranslationPreservesLowerBounds {A : Set ℝ} {c l : ℝ}
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (l + c) (Displace A c) := by
  sorry

/-- Positive dilation preserves upper bounds. -/
theorem PositiveDilationPreservesUpperBounds {A : Set ℝ} {scale u : ℝ}
    (positiveScale : 0 < scale)
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound
      (scale * u) (Dilate A scale) := by
  sorry

/-- Positive dilation preserves lower bounds. -/
theorem PositiveDilationPreservesLowerBounds {A : Set ℝ} {scale l : ℝ}
    (positiveScale : 0 < scale)
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound
      (scale * l) (Dilate A scale) := by
  sorry

/-- Negative dilation sends lower bounds to upper bounds. -/
theorem NegativeDilationSendsLowerToUpperBounds {A : Set ℝ} {scale l : ℝ}
    (negativeScale : scale < 0)
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound
      (scale * l) (Dilate A scale) := by
  sorry

/-- Negative dilation sends upper bounds to lower bounds. -/
theorem NegativeDilationSendsUpperToLowerBounds {A : Set ℝ} {scale u : ℝ}
    (negativeScale : scale < 0)
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound
      (scale * u) (Dilate A scale) := by
  sorry

/-- Reflection swaps upper bounds with lower bounds. -/
theorem ReflectionSwapsUpperBoundsToLowerBounds {A : Set ℝ} {b : ℝ} :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound b A ↔
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (-b) (Reflect A) := by
  sorry

/-- Reflection swaps lower bounds with upper bounds. -/
theorem ReflectionSwapsLowerBoundsToUpperBounds {A : Set ℝ} {b : ℝ} :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound b A ↔
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (-b) (Reflect A) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
