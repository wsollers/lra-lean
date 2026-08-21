import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

/-!
What makes a form "indeterminate": the pattern alone (both parts tending
to `0`, or to `∞`, etc.) does not determine the limit — different choices
of functions realizing the same pattern can give different answers. The
same principle behind these two witnesses (`0/0` and `1^∞`) extends to
all seven classic forms.
-/

namespace LRA.Analysis.Limits

/-- The `0/0` pattern does not determine the limit of the quotient: `x/x → 1` and `x²/x → 0` at
`x = 0`, both realizing `f → 0`, `g → 0`, but with different quotient limits.

Logical form:

```lean
theorem ZeroOverZeroIsIndeterminate :
    ∃ (f g f' g' : ℝ → ℝ) (c L L' : ℝ), L ≠ L' ∧
      TendsTo f {x : ℝ | x ≠ c} c 0 ∧ TendsTo g {x : ℝ | x ≠ c} c 0 ∧
      TendsTo f' {x : ℝ | x ≠ c} c 0 ∧ TendsTo g' {x : ℝ | x ≠ c} c 0 ∧
      TendsTo (fun x => f x / g x) {x : ℝ | x ≠ c} c L ∧
      TendsTo (fun x => f' x / g' x) {x : ℝ | x ≠ c} c L'
```
-/
theorem ZeroOverZeroIsIndeterminate :
    ∃ (f g f' g' : ℝ → ℝ) (c L L' : ℝ), L ≠ L' ∧
      TendsTo f {x : ℝ | x ≠ c} c 0 ∧ TendsTo g {x : ℝ | x ≠ c} c 0 ∧
      TendsTo f' {x : ℝ | x ≠ c} c 0 ∧ TendsTo g' {x : ℝ | x ≠ c} c 0 ∧
      TendsTo (fun x => f x / g x) {x : ℝ | x ≠ c} c L ∧
      TendsTo (fun x => f' x / g' x) {x : ℝ | x ≠ c} c L' := by
  sorry

/-- The `1^∞` pattern does not determine the limit either: `(1 + 1/x)^x → e` but `(1 + 2/x)^x →
e²`, both realizing "base → 1, exponent → +∞," with different limits.

Logical form:

```lean
theorem OneToTheInftyIsIndeterminate :
    ∃ (f f' : ℝ → ℝ) (X : Set ℝ) (L L' : ℝ), L ≠ L' ∧
      TendsToInfty f X 1 ∧ TendsToInfty f' X 1 ∧
      TendsToInfty (fun x => (f x) ^ x) X L ∧
      TendsToInfty (fun x => (f' x) ^ x) X L'
```
-/
theorem OneToTheInftyIsIndeterminate :
    ∃ (f f' : ℝ → ℝ) (X : Set ℝ) (L L' : ℝ), L ≠ L' ∧
      TendsToInfty f X 1 ∧ TendsToInfty f' X 1 ∧
      TendsToInfty (fun x => (f x) ^ x) X L ∧
      TendsToInfty (fun x => (f' x) ^ x) X L' := by
  sorry

end LRA.Analysis.Limits
