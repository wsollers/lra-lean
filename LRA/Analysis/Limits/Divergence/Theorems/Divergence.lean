import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Divergence.Definition

/-!
Each way of diverging implies the general non-existence predicate, plus
concrete witnesses for jump and oscillation.
-/

namespace LRA.Analysis.Limits

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `h : HasJumpAt f A c`. Then `LimitDoesNotExist f
A c`.

Logical form:

```lean
theorem HasJumpAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : HasJumpAt f A c) :
    LimitDoesNotExist f A c
```
-/
theorem HasJumpAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : HasJumpAt f A c) :
    LimitDoesNotExist f A c := by
  sorry

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `h : Oscillates f A c`. Then `LimitDoesNotExist f
A c`.

Logical form:

```lean
theorem OscillatesImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : Oscillates f A c) :
    LimitDoesNotExist f A c
```
-/
theorem OscillatesImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : Oscillates f A c) :
    LimitDoesNotExist f A c := by
  sorry

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hA : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ`,
and `h : DivergesToInftyAt f A c`. Then `LimitDoesNotExist f A c`.

Logical form:

```lean
theorem DivergesToInftyAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hA : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h : DivergesToInftyAt f A c) :
    LimitDoesNotExist f A c
```
-/
theorem DivergesToInftyAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hA : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h : DivergesToInftyAt f A c) :
    LimitDoesNotExist f A c := by
  sorry

/-- The Heaviside-style step function `fun x => if x < 0 then 0 else 1` has a jump at `0`.

Logical form:

```lean
theorem StepFunctionHasJumpAtZero :
    HasJumpAt (fun x : ℝ => if x < 0 then (0 : ℝ) else 1) Set.univ 0
```
-/
theorem StepFunctionHasJumpAtZero :
    HasJumpAt (fun x : ℝ => if x < 0 then (0 : ℝ) else 1) Set.univ 0 := by
  sorry

/-- `fun x => Real.sin (1 / x)` oscillates at `0`: it takes every value in `[-1, 1]` in every
punctured neighborhood of `0`, so no single limit value fits.

Logical form:

```lean
theorem SinOfReciprocalOscillatesAtZero :
    Oscillates (fun x : ℝ => Real.sin (1 / x)) {x : ℝ | x ≠ 0} 0
```
-/
theorem SinOfReciprocalOscillatesAtZero :
    Oscillates (fun x : ℝ => Real.sin (1 / x)) {x : ℝ | x ≠ 0} 0 := by
  sorry

end LRA.Analysis.Limits
