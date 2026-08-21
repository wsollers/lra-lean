import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt

/-!
The Dedekind cut of `ℚ` and `ℝ` at `√2` — a concrete worked example of
completeness, used by `Theorems/CompletenessAdditions.lean` and
`Failures/CompletenessAdditions.lean`.

Source: ADDITIONS.md items 19, 20, 22, 23.
-/

namespace LRA.Analysis.Completeness

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

end LRA.Analysis.Completeness
