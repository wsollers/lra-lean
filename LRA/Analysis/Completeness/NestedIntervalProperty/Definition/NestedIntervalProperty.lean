import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

/-!
The nested interval property, abstractly and for concrete real closed
interval families.
-/

namespace LRA.Analysis.Completeness

variable (F : Type*)

/-- Nested closed bounded intervals have nonempty total intersection.

Logical form:

```lean
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n
```
-/
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n

variable (a b : ℕ → ℝ)

/-- A family of real closed intervals is nested when endpoints are ordered and each successor interval is contained in the previous one.

Logical form:

```lean
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
```
-/
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))

end LRA.Analysis.Completeness
