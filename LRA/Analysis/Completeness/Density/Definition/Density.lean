import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic

/-!
Order density: the defining predicate, and the rational/irrational
classification of real numbers it is stated over.
-/

namespace LRA.Analysis.Completeness

/-- A subset is order dense when it contains an element strictly between every ordered pair.

Logical form:

```lean
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  ∀ x y : S, x < y → ∃ d ∈ D, x < d ∧ d < y
```
-/
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  ∀ x y : S, x < y → ∃ d ∈ D, x < d ∧ d < y

/-- A real number is rational when it lies in the image of the rational coercion.

Logical form:

```lean
def IsRational (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)
```
-/
def IsRational (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)

/-- A real number is irrational when it is not in the image of the rational coercion.

Logical form:

```lean
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRational x
```
-/
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRational x

end LRA.Analysis.Completeness
