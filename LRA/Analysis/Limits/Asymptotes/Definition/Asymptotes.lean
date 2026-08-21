import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.LimitsAtInfinity.Definition
import LRA.Analysis.Limits.Divergence.Definition

/-!
Horizontal, vertical, and oblique asymptotes, defined in terms of the
existing limit-at-infinity and divergence vocabulary rather than as new
primitives.
-/

namespace LRA.Analysis.Limits

/-- `f` has horizontal asymptote `y = L` as `x → +∞`: a named restatement of `TendsToInfty`.

Logical form:

```lean
def HasHorizontalAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToInfty f X L
```
-/
def HasHorizontalAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToInfty f X L

/-- `f` has horizontal asymptote `y = L` as `x → -∞`: a named restatement of `TendsToNegInfty`.

Logical form:

```lean
def HasHorizontalAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToNegInfty f X L
```
-/
def HasHorizontalAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToNegInfty f X L

/-- `f` has a vertical asymptote at `c`: it blows up to `±∞` from at least one side. (Both sides are
not required — `1/x` at `0` blows up to `+∞` from the right and `-∞` from the left, and is still
a vertical asymptote.)

Logical form:

```lean
def HasVerticalAsymptoteAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  DivergesToInftyFromRight f A c ∨ DivergesToInftyFromLeft f A c ∨
    DivergesToNegInftyFromRight f A c ∨ DivergesToNegInftyFromLeft f A c
```
-/
def HasVerticalAsymptoteAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  DivergesToInftyFromRight f A c ∨ DivergesToInftyFromLeft f A c ∨
    DivergesToNegInftyFromRight f A c ∨ DivergesToNegInftyFromLeft f A c

/-- `f` has oblique (slant) asymptote `y = m * x + b` as `x → +∞`: the vertical gap between `f` and
the line tends to `0`.

Logical form:

```lean
def HasObliqueAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToInfty (fun x => f x - (m * x + b)) X 0
```
-/
def HasObliqueAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToInfty (fun x => f x - (m * x + b)) X 0

/-- `f` has oblique (slant) asymptote `y = m * x + b` as `x → -∞`.

Logical form:

```lean
def HasObliqueAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToNegInfty (fun x => f x - (m * x + b)) X 0
```
-/
def HasObliqueAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToNegInfty (fun x => f x - (m * x + b)) X 0

end LRA.Analysis.Limits
