import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.UpperLowerBounds

/-!
Translation, dilation, and reflection of bounded subsets of the real line.
-/

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra

/-- `Displace A c` is the translate of `A` by `c`.

Logical form:

```lean
def Displace (A : Set ℝ) (c : ℝ) : Set ℝ :=
  (fun a => a + c) '' A
```
-/
def Displace (A : Set ℝ) (c : ℝ) : Set ℝ :=
  (fun a => a + c) '' A

/-- `Dilate A scale` is the image of `A` under scalar multiplication by `scale`.

Logical form:

```lean
def Dilate (A : Set ℝ) (scale : ℝ) : Set ℝ :=
  (fun a => scale * a) '' A
```
-/
def Dilate (A : Set ℝ) (scale : ℝ) : Set ℝ :=
  (fun a => scale * a) '' A

/-- `Reflect A` is the image of `A` under negation.

Logical form:

```lean
def Reflect (A : Set ℝ) : Set ℝ :=
  (fun a => -a) '' A
```
-/
def Reflect (A : Set ℝ) : Set ℝ :=
  (fun a => -a) '' A

/-- Let `A : Set ℝ` and `c u : ℝ`. If `upperBoundHypothesis :
LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A`. Then
`LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (u + c) (Displace A c)`.

Logical form:

```lean
theorem TranslationPreservesUpperBounds {A : Set ℝ} {c u : ℝ}
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (u + c) (Displace A c)
```
-/
theorem TranslationPreservesUpperBounds {A : Set ℝ} {c u : ℝ}
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (u + c) (Displace A c) := by
  sorry

/-- Let `A : Set ℝ` and `c l : ℝ`. If `lowerBoundHypothesis :
LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A`. Then
`LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (l + c) (Displace A c)`.

Logical form:

```lean
theorem TranslationPreservesLowerBounds {A : Set ℝ} {c l : ℝ}
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (l + c) (Displace A c)
```
-/
theorem TranslationPreservesLowerBounds {A : Set ℝ} {c l : ℝ}
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (l + c) (Displace A c) := by
  sorry

/-- Let `A : Set ℝ` and `scale u : ℝ`. If `positiveScale : 0 < scale` and `upperBoundHypothesis :
LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A`. Then
`LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (scale * u) (Dilate A scale)`.

Logical form:

```lean
theorem PositiveDilationPreservesUpperBounds {A : Set ℝ} {scale u : ℝ}
    (positiveScale : 0 < scale)
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound
      (scale * u) (Dilate A scale)
```
-/
theorem PositiveDilationPreservesUpperBounds {A : Set ℝ} {scale u : ℝ}
    (positiveScale : 0 < scale)
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound
      (scale * u) (Dilate A scale) := by
  sorry

/-- Let `A : Set ℝ` and `scale l : ℝ`. If `positiveScale : 0 < scale` and `lowerBoundHypothesis :
LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A`. Then
`LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (scale * l) (Dilate A scale)`.

Logical form:

```lean
theorem PositiveDilationPreservesLowerBounds {A : Set ℝ} {scale l : ℝ}
    (positiveScale : 0 < scale)
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound
      (scale * l) (Dilate A scale)
```
-/
theorem PositiveDilationPreservesLowerBounds {A : Set ℝ} {scale l : ℝ}
    (positiveScale : 0 < scale)
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound
      (scale * l) (Dilate A scale) := by
  sorry

/-- Let `A : Set ℝ` and `scale l : ℝ`. If `negativeScale : scale < 0` and `lowerBoundHypothesis :
LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A`. Then
`LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (scale * l) (Dilate A scale)`.

Logical form:

```lean
theorem NegativeDilationSendsLowerToUpperBounds {A : Set ℝ} {scale l : ℝ}
    (negativeScale : scale < 0)
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound
      (scale * l) (Dilate A scale)
```
-/
theorem NegativeDilationSendsLowerToUpperBounds {A : Set ℝ} {scale l : ℝ}
    (negativeScale : scale < 0)
    (lowerBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound l A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound
      (scale * l) (Dilate A scale) := by
  sorry

/-- Let `A : Set ℝ` and `scale u : ℝ`. If `negativeScale : scale < 0` and `upperBoundHypothesis :
LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A`. Then
`LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (scale * u) (Dilate A scale)`.

Logical form:

```lean
theorem NegativeDilationSendsUpperToLowerBounds {A : Set ℝ} {scale u : ℝ}
    (negativeScale : scale < 0)
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound
      (scale * u) (Dilate A scale)
```
-/
theorem NegativeDilationSendsUpperToLowerBounds {A : Set ℝ} {scale u : ℝ}
    (negativeScale : scale < 0)
    (upperBoundHypothesis :
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound u A) :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound
      (scale * u) (Dilate A scale) := by
  sorry

/-- Let `A : Set ℝ` and `b : ℝ`. Then `LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound b
A ↔ LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (-b) (Reflect A)`.

Logical form:

```lean
theorem ReflectionSwapsUpperBoundsToLowerBounds {A : Set ℝ} {b : ℝ} :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound b A ↔
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (-b) (Reflect A)
```
-/
theorem ReflectionSwapsUpperBoundsToLowerBounds {A : Set ℝ} {b : ℝ} :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound b A ↔
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound (-b) (Reflect A) := by
  sorry

/-- Let `A : Set ℝ` and `b : ℝ`. Then `LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound b
A ↔ LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (-b) (Reflect A)`.

Logical form:

```lean
theorem ReflectionSwapsLowerBoundsToUpperBounds {A : Set ℝ} {b : ℝ} :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound b A ↔
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (-b) (Reflect A)
```
-/
theorem ReflectionSwapsLowerBoundsToUpperBounds {A : Set ℝ} {b : ℝ} :
    LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsLowerBound b A ↔
      LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.IsUpperBound (-b) (Reflect A) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
