/-
Draft module; not yet imported by the active Volume III root.
New namespace/area: `LRA.Analysis.Completeness.*`, mirroring the
book's own promotion of `completeness` from a section of the Bounds chapter
to its own top-level chapter (see ISSUES.md's "Completeness chapter" table
header for that history). Historical note: the Archimedean-property and
density Lean draft modules from earlier in this pass
(`ArchimedeanProperty.lean`, `Density.lean`) still live under
`Bounding` — they were written before the chapter promotion was
known, and are left in place rather than moved, to avoid churn on already-
delivered files. New completeness content goes here going forward.

Source: ADDITIONS.md items 19, 20, 22, 23 — three theorems/examples added
with user sign-off after being asked directly "are there other completeness
theorems I should include, or perhaps examples." Item 21 (the relative-sup
crossover example) lives in `RelativeBounds.lean`
(`LRA.Analysis.Bounds`) instead, since it needs the
`IsRelativeSupremum` machinery defined there.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Order.Bounds.Basic

namespace LRA.Analysis.Completeness

/-- Let `a : ℝ`. If `ha : 0 ≤ a`. Then `∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a`.

Logical form:

```lean
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a
```
-/
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a := by
  sorry

/-- The theorem asserts `({x : ℚ | x ^ 2 < 2} : Set ℚ).Nonempty ∧ (∃ u : ℚ, ∀ x ∈ ({x : ℚ | x ^ 2 <
2} : Set ℚ), x ≤ u) ∧ ¬ ∃ s : ℚ, IsLUB ({x : ℚ | x ^ 2 < 2} : Set ℚ) s`.

Logical form:

```lean
theorem RationalsLackLubProperty :
    ({x : ℚ | x ^ 2 < 2} : Set ℚ).Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ ({x : ℚ | x ^ 2 < 2} : Set ℚ), x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB ({x : ℚ | x ^ 2 < 2} : Set ℚ) s
```
-/
theorem RationalsLackLubProperty :
    ({x : ℚ | x ^ 2 < 2} : Set ℚ).Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ ({x : ℚ | x ^ 2 < 2} : Set ℚ), x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB ({x : ℚ | x ^ 2 < 2} : Set ℚ) s := by
  sorry

/-- The lower part of a Dedekind cut of `ℚ` at `√2` — `def:relative-bounds`'s
own worked example, made concrete as a cut. See ADDITIONS.md #23.

Logical form:

```lean
def RationalCutLowerAtSqrtTwo : Set ℚ := {q : ℚ | q < 0 ∨ q ^ 2 < 2}
```
-/
def RationalCutLowerAtSqrtTwo : Set ℚ := {q : ℚ | q < 0 ∨ q ^ 2 < 2}

/-- The upper part of the same cut.

Logical form:

```lean
def RationalCutUpperAtSqrtTwo : Set ℚ := {q : ℚ | 0 ≤ q ∧ 2 ≤ q ^ 2}
```
-/
def RationalCutUpperAtSqrtTwo : Set ℚ := {q : ℚ | 0 ≤ q ∧ 2 ≤ q ^ 2}

/-- The theorem asserts `(¬ ∃ m ∈ RationalCutLowerAtSqrtTwo, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m)
∧ (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo, ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x)`.

Logical form:

```lean
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x)
```
-/
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x) := by
  sorry

/-- The lower part of the corresponding cut of `ℝ` at `√2`.

Logical form:

```lean
def RealCutLowerAtSqrtTwo : Set ℝ := {x : ℝ | x < Real.sqrt 2}
```
-/
def RealCutLowerAtSqrtTwo : Set ℝ := {x : ℝ | x < Real.sqrt 2}

/-- The upper part of the corresponding cut of `ℝ` at `√2`.

Logical form:

```lean
def RealCutUpperAtSqrtTwo : Set ℝ := {x : ℝ | Real.sqrt 2 ≤ x}
```
-/
def RealCutUpperAtSqrtTwo : Set ℝ := {x : ℝ | Real.sqrt 2 ≤ x}

/-- The theorem asserts `(¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
(Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧ ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x)`.

Logical form:

```lean
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x)
```
-/
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x) := by
  sorry

/-- The theorem asserts `(1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧ (1.4 : ℝ) < Real.sqrt 2 ∧
Real.sqrt 2 < 1.5 ∧ (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42`.

Logical form:

```lean
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42
```
-/
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42 := by
  sorry

end LRA.Analysis.Completeness
