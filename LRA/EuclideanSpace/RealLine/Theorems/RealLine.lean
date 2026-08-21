import Mathlib.Data.Real.Basic
import LRA.EuclideanSpace.RealLine.Definition.RealLine

/-!
Basic properties of real-line distance, intervals, and the translation/
dilation transformations.
-/

namespace LRA.EuclideanSpace

/-- Let `a b : ℝ`. Then `RealLineDistance a b ≥ 0`.

Logical form:

```lean
theorem RealLineDistanceNonneg (a b : ℝ) : RealLineDistance a b ≥ 0
```
-/
theorem RealLineDistanceNonneg (a b : ℝ) : RealLineDistance a b ≥ 0 := by
  sorry

/-- Let `a : ℝ`. Then `RealLineDistance a a = 0`.

Logical form:

```lean
theorem RealLineDistanceSelf (a : ℝ) : RealLineDistance a a = 0
```
-/
theorem RealLineDistanceSelf (a : ℝ) : RealLineDistance a a = 0 := by
  sorry

/-- Let `a b : ℝ`. Then `RealLineDistance a b = RealLineDistance b a`.

Logical form:

```lean
theorem RealLineDistanceSymm (a b : ℝ) :
    RealLineDistance a b = RealLineDistance b a
```
-/
theorem RealLineDistanceSymm (a b : ℝ) :
    RealLineDistance a b = RealLineDistance b a := by
  sorry

/-- Let `a b : ℝ`. Then `RealLineDistance a b = 0 ↔ a = b`.

Equivalently: the distance between two points vanishes exactly when the
points coincide.

Logical form:

```lean
theorem RealLineDistanceEqZeroIff (a b : ℝ) :
    RealLineDistance a b = 0 ↔ a = b
```
-/
theorem RealLineDistanceEqZeroIff (a b : ℝ) :
    RealLineDistance a b = 0 ↔ a = b := by
  sorry

/-- Let `a b c : ℝ`. Then `RealLineDistance a c ≤ RealLineDistance a b +
RealLineDistance b c`.

Logical form:

```lean
theorem RealLineDistanceTriangleInequality (a b c : ℝ) :
    RealLineDistance a c ≤ RealLineDistance a b + RealLineDistance b c
```
-/
theorem RealLineDistanceTriangleInequality (a b c : ℝ) :
    RealLineDistance a c ≤ RealLineDistance a b + RealLineDistance b c := by
  sorry

/-- Let `a b : ℝ`. Then `(OpenInterval a b).Nonempty ↔ a < b`.

Equivalently: the open interval has a point exactly when its left
endpoint lies strictly below its right endpoint.

Logical form:

```lean
theorem OpenIntervalNonemptyIff (a b : ℝ) :
    (OpenInterval a b).Nonempty ↔ a < b
```
-/
theorem OpenIntervalNonemptyIff (a b : ℝ) :
    (OpenInterval a b).Nonempty ↔ a < b := by
  sorry

/-- Let `a b : ℝ`. Then `OpenInterval a b ⊆ ClosedInterval a b`.

Logical form:

```lean
theorem OpenIntervalSubsetClosedInterval (a b : ℝ) :
    OpenInterval a b ⊆ ClosedInterval a b
```
-/
theorem OpenIntervalSubsetClosedInterval (a b : ℝ) :
    OpenInterval a b ⊆ ClosedInterval a b := by
  sorry

/-- Let `c a b : ℝ`. Then `(Translate1 c) '' (OpenInterval a b) =
OpenInterval (a + c) (b + c)`.

Logical form:

```lean
theorem TranslateMapsOpenIntervalToOpenInterval (c a b : ℝ) :
    (Translate1 c) '' (OpenInterval a b) = OpenInterval (a + c) (b + c)
```
-/
theorem TranslateMapsOpenIntervalToOpenInterval (c a b : ℝ) :
    (Translate1 c) '' (OpenInterval a b) = OpenInterval (a + c) (b + c) := by
  sorry

/-- Let `c a b : ℝ`. Then `(Translate1 c) '' (ClosedInterval a b) =
ClosedInterval (a + c) (b + c)`.

Logical form:

```lean
theorem TranslateMapsClosedIntervalToClosedInterval (c a b : ℝ) :
    (Translate1 c) '' (ClosedInterval a b) = ClosedInterval (a + c) (b + c)
```
-/
theorem TranslateMapsClosedIntervalToClosedInterval (c a b : ℝ) :
    (Translate1 c) '' (ClosedInterval a b) =
      ClosedInterval (a + c) (b + c) := by
  sorry

/-- Let `k a b : ℝ`. If `positiveScale : 0 < k`. Then `(Dilate1 k) '' (OpenInterval
a b) = OpenInterval (k * a) (k * b)`.

Logical form:

```lean
theorem PositiveDilateMapsOpenIntervalToOpenInterval {k : ℝ} (a b : ℝ)
    (positiveScale : 0 < k) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * a) (k * b)
```
-/
theorem PositiveDilateMapsOpenIntervalToOpenInterval {k : ℝ} (a b : ℝ)
    (positiveScale : 0 < k) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * a) (k * b) := by
  sorry

/-- Let `k a b : ℝ`. If `negativeScale : k < 0`. Then `(Dilate1 k) '' (OpenInterval
a b) = OpenInterval (k * b) (k * a)` — the endpoints swap because dilation
by a negative scale reflects the line through the origin.

Logical form:

```lean
theorem NegativeDilateReversesOpenInterval {k : ℝ} (a b : ℝ)
    (negativeScale : k < 0) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * b) (k * a)
```
-/
theorem NegativeDilateReversesOpenInterval {k : ℝ} (a b : ℝ)
    (negativeScale : k < 0) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * b) (k * a) := by
  sorry

/-- Let `c a b : ℝ`. Then `RealLineDistance (Translate1 c a) (Translate1 c b) =
RealLineDistance a b`: translation does not change distances.

Logical form:

```lean
theorem TranslateDistanceInvariant (c a b : ℝ) :
    RealLineDistance (Translate1 c a) (Translate1 c b) = RealLineDistance a b
```
-/
theorem TranslateDistanceInvariant (c a b : ℝ) :
    RealLineDistance (Translate1 c a) (Translate1 c b) =
      RealLineDistance a b := by
  sorry

/-- Let `k a b : ℝ`. Then `RealLineDistance (Dilate1 k a) (Dilate1 k b) =
(RealLineDistance 0 k) * RealLineDistance a b`: dilation by `k` scales
distances by `RealLineDistance 0 k`, the self-contained stand-in for
`|k|`.

Logical form:

```lean
theorem DilateScalesDistance (k a b : ℝ) :
    RealLineDistance (Dilate1 k a) (Dilate1 k b) =
      (RealLineDistance 0 k) * RealLineDistance a b
```
-/
theorem DilateScalesDistance (k a b : ℝ) :
    RealLineDistance (Dilate1 k a) (Dilate1 k b) =
      (RealLineDistance 0 k) * RealLineDistance a b := by
  sorry

end LRA.EuclideanSpace
