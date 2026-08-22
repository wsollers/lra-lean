import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import LRA.Analysis.Completeness.Completeness.Definition

/-!
The rationals lack the least-upper-bound property. The failure is witnessed by
the Dedekind cut of `ℚ` at `√2`, whose lower set is nonempty and bounded above
but has no least upper bound in `ℚ`.

Source: ADDITIONS.md items 19, 20, 22, 23.
-/

namespace LRA.Analysis.Completeness

section RationalLeastUpperBoundFailure

/-- The rational lower cut at `√2` is nonempty and bounded above, but has no least upper bound in `ℚ`.

Logical form:

```lean
theorem RationalsLackLubProperty :
    RationalCutLowerAtSqrtTwo.Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB RationalCutLowerAtSqrtTwo s
```
-/
theorem RationalsLackLubProperty :
    RationalCutLowerAtSqrtTwo.Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB RationalCutLowerAtSqrtTwo s := by
  sorry

/-- `ℚ` does not satisfy the least-upper-bound property.

Logical form:

```lean
def RationalsDoNotHaveLeastUpperBoundProperty : Prop :=
  ¬ HasLeastUpperBoundProperty ℚ
```
-/
def RationalsDoNotHaveLeastUpperBoundProperty : Prop :=
  ¬ HasLeastUpperBoundProperty ℚ

/-- The rational cut at `√2` proves that `ℚ` does not have the least-upper-bound property.

Logical form:

```lean
theorem RationalSqrtTwoCutProvesRationalsDoNotHaveLeastUpperBoundProperty :
    RationalsDoNotHaveLeastUpperBoundProperty
```
-/
theorem RationalSqrtTwoCutProvesRationalsDoNotHaveLeastUpperBoundProperty :
    RationalsDoNotHaveLeastUpperBoundProperty := by
  sorry

/-- Neither side of the rational Dedekind cut at `√2` has an endpoint in `ℚ`.

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

end RationalLeastUpperBoundFailure

end LRA.Analysis.Completeness
