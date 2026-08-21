import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

/-!
The ways a limit can fail to exist: a jump (one-sided limits disagree), an
unbounded blow-up at a finite point (vertical-asymptote behavior),
oscillation (no jump, no blow-up, but different approach paths give
different subsequential limits), and divergence at infinity.
-/

namespace LRA.Analysis.Limits

/-- `f` has a jump at `c` when its one-sided limits both exist but disagree.

Logical form:

```lean
def HasJumpAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ L₁ L₂ : ℝ, TendsToLeft f A c L₁ ∧ TendsToRight f A c L₂ ∧ L₁ ≠ L₂
```
-/
def HasJumpAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ L₁ L₂ : ℝ, TendsToLeft f A c L₁ ∧ TendsToRight f A c L₂ ∧ L₁ ≠ L₂

/-- `f` diverges to `+∞` at the finite point `c`: vertical-asymptote behavior.

Logical form:

```lean
def DivergesToInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x > M
```
-/
def DivergesToInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x > M

/-- `f` diverges to `-∞` at the finite point `c`: vertical-asymptote behavior.

Logical form:

```lean
def DivergesToNegInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < M
```
-/
def DivergesToNegInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < M

/-- `f` has no (finite) limit at `c`: the general non-existence predicate, agnostic to the reason.

Logical form:

```lean
def LimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsTo f A c L
```
-/
def LimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsTo f A c L

/-- `f` oscillates at `c`: two sequences approaching `c` (without equaling it) produce `f`-images
converging to different values — no jump, no blow-up, but `f` never settles.

Logical form:

```lean
def Oscillates (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ xs ys : ℕ → ℝ, ApproachesButNotEqual xs A c ∧ ApproachesButNotEqual ys A c ∧
    ∃ L₁ L₂ : ℝ, L₁ ≠ L₂ ∧
      Filter.Tendsto (f ∘ xs) Filter.atTop (nhds L₁) ∧
        Filter.Tendsto (f ∘ ys) Filter.atTop (nhds L₂)
```
-/
def Oscillates (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ xs ys : ℕ → ℝ, ApproachesButNotEqual xs A c ∧ ApproachesButNotEqual ys A c ∧
    ∃ L₁ L₂ : ℝ, L₁ ≠ L₂ ∧
      Filter.Tendsto (f ∘ xs) Filter.atTop (nhds L₁) ∧
        Filter.Tendsto (f ∘ ys) Filter.atTop (nhds L₂)

/-- `f` has no limit as `x → +∞` on `X`: the general non-existence predicate for limits at
infinity.

Logical form:

```lean
def DivergesAtInfinity (f : ℝ → ℝ) (X : Set ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsToInfty f X L
```
-/
def DivergesAtInfinity (f : ℝ → ℝ) (X : Set ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsToInfty f X L

end LRA.Analysis.Limits
