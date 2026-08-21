import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Asymptotes.Definition

/-!
A horizontal asymptote is the slope-zero case of an oblique asymptote; the
standard slope/intercept computation for oblique asymptotes; and `1/x` as
a worked example carrying both a horizontal and a vertical asymptote.
-/

namespace LRA.Analysis.Limits

/-- Let `X : Set ℝ` and `L : ℝ`. If `f : ℝ → ℝ` and `h : HasHorizontalAsymptoteAtPosInfty f X L`.
Then `HasObliqueAsymptoteAtPosInfty f X 0 L`.

Logical form:

```lean
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtPosInfty f X L) :
    HasObliqueAsymptoteAtPosInfty f X 0 L
```
-/
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtPosInfty f X L) :
    HasObliqueAsymptoteAtPosInfty f X 0 L := by
  sorry

/-- Let `X : Set ℝ` and `L : ℝ`. If `f : ℝ → ℝ` and `h : HasHorizontalAsymptoteAtNegInfty f X L`.
Then `HasObliqueAsymptoteAtNegInfty f X 0 L`.

Logical form:

```lean
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtNegInfty f X L) :
    HasObliqueAsymptoteAtNegInfty f X 0 L
```
-/
theorem HorizontalAsymptoteIsObliqueWithZeroSlopeAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (h : HasHorizontalAsymptoteAtNegInfty f X L) :
    HasObliqueAsymptoteAtNegInfty f X 0 L := by
  sorry

/-- The standard slope/intercept computation: `f` has oblique asymptote `y = m * x + b` at `+∞` iff
`f x / x → m` and `f x - m * x → b` as `x → +∞`.

Logical form:

```lean
theorem ObliqueAsymptoteIffSlopeAndInterceptLimits (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) :
    HasObliqueAsymptoteAtPosInfty f X m b ↔
      TendsToInfty (fun x => f x / x) X m ∧ TendsToInfty (fun x => f x - m * x) X b
```
-/
theorem ObliqueAsymptoteIffSlopeAndInterceptLimits (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) :
    HasObliqueAsymptoteAtPosInfty f X m b ↔
      TendsToInfty (fun x => f x / x) X m ∧ TendsToInfty (fun x => f x - m * x) X b := by
  sorry

/-- `1/x` has horizontal asymptote `y = 0` at both `+∞` and `-∞`, and a vertical asymptote at `0`.

Logical form:

```lean
theorem ReciprocalHasHorizontalAndVerticalAsymptotes :
    HasHorizontalAsymptoteAtPosInfty (fun x : ℝ => 1 / x) {x : ℝ | x > 0} 0 ∧
      HasHorizontalAsymptoteAtNegInfty (fun x : ℝ => 1 / x) {x : ℝ | x < 0} 0 ∧
      HasVerticalAsymptoteAt (fun x : ℝ => 1 / x) {x : ℝ | x ≠ 0} 0
```
-/
theorem ReciprocalHasHorizontalAndVerticalAsymptotes :
    HasHorizontalAsymptoteAtPosInfty (fun x : ℝ => 1 / x) {x : ℝ | x > 0} 0 ∧
      HasHorizontalAsymptoteAtNegInfty (fun x : ℝ => 1 / x) {x : ℝ | x < 0} 0 ∧
      HasVerticalAsymptoteAt (fun x : ℝ => 1 / x) {x : ℝ | x ≠ 0} 0 := by
  sorry

end LRA.Analysis.Limits
