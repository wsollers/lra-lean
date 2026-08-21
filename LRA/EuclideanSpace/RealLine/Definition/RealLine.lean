import Mathlib.Data.Real.Basic

/-!
Lecture 1: the real line. The point type is `ℝ` itself, reused directly
from `LRA.NumberSystems.RealNumbers` — no new point structure is needed
for one dimension. Distance is built directly from `ℝ`'s own order and
subtraction (the lecture's own conditional form), not from an imported
absolute value: `EuclideanSpace` sits before `LRA.Analysis` in the
subject chain, so it cannot reach forward to `LRA.Analysis.RealAnalysis`'s
`AbsR`.
-/

namespace LRA.EuclideanSpace

/-- The distance between two points of the real line: the length of the
segment between them, taken positively regardless of which point is
larger.

Logical form:

```lean
noncomputable def RealLineDistance (a b : ℝ) : ℝ :=
  if b ≥ a then b - a else a - b
```
-/
noncomputable def RealLineDistance (a b : ℝ) : ℝ :=
  if b ≥ a then b - a else a - b

/-- The open interval `(a, b)`: points strictly between `a` and `b`.

Logical form:

```lean
def OpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x < b}
```
-/
def OpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x < b}

/-- The closed interval `[a, b]`: points between `a` and `b`, endpoints
included.

Logical form:

```lean
def ClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x ≤ b}
```
-/
def ClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x ≤ b}

/-- The half-open interval `[a, b)`: the left endpoint included, the
right endpoint excluded.

Logical form:

```lean
def LeftClosedRightOpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x < b}
```
-/
def LeftClosedRightOpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x < b}

/-- The half-open interval `(a, b]`: the left endpoint excluded, the
right endpoint included.

Logical form:

```lean
def LeftOpenRightClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x ≤ b}
```
-/
def LeftOpenRightClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x ≤ b}

/-- The open ray `(a, ∞)`: points strictly above `a`.

Logical form:

```lean
def OpenRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a < x}
```
-/
def OpenRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a < x}

/-- The closed ray `[a, ∞)`: points at or above `a`.

Logical form:

```lean
def ClosedRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x}
```
-/
def ClosedRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x}

/-- The open ray `(-∞, b)`: points strictly below `b`.

Logical form:

```lean
def OpenRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x < b}
```
-/
def OpenRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x < b}

/-- The closed ray `(-∞, b]`: points at or below `b`.

Logical form:

```lean
def ClosedRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x ≤ b}
```
-/
def ClosedRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x ≤ b}

/-- Translation by `c`: shifts every point of the line by `c` units.

Logical form:

```lean
def Translate1 (c x : ℝ) : ℝ := x + c
```
-/
def Translate1 (c x : ℝ) : ℝ := x + c

/-- Dilation by `k`: scales every point of the line by `k`, stretching
for `|k| > 1`, compressing for `0 < |k| < 1`, and reflecting through the
origin when `k < 0`.

Logical form:

```lean
def Dilate1 (k x : ℝ) : ℝ := k * x
```
-/
def Dilate1 (k x : ℝ) : ℝ := k * x

end LRA.EuclideanSpace
