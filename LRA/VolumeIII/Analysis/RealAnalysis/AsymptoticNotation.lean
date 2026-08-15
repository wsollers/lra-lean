/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/asymptotic-notation/notes-asymptotic-notation.tex.
Audited clean (no ISSUES.md findings). Companion to
`AsymptoticAndInequalityAdditions.lean`, which holds ADDITIONS.md item 25
(the big-O family this section itself never defines) — this file covers
the little-o content the section DOES contain.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.RealAnalysis

/-- `def:little-o-at-a-point`. `f(x) = o(g(x))` as `x → a`.

Logical form:

```lean
def IsLittleOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|
```
-/
def IsLittleOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|

/-- `def:little-o-at-infinity`. `f(x) = o(g(x))` as `x → ∞`.

Logical form:

```lean
def IsLittleOAtTop (f g : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|
```
-/
def IsLittleOAtTop (f g : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|

/-- `def:increment-little-o`. `r(h) = o(h)` as `h → 0` — the form used in
first-order (differentiability) approximation.

Logical form:

```lean
def IsIncrementLittleO (r : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h, 0 < |h| → |h| < δ → |r h| ≤ ε * |h|
```
-/
def IsIncrementLittleO (r : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h, 0 < |h| → |h| < δ → |r h| ≤ ε * |h|

/-- Let `a : ℝ`. If `f g : ℝ → ℝ` and `hg : Filter.Eventually (fun x => g x ≠ 0) (nhdsWithin a
{a}ᶜ)`. Then `IsLittleOAt f g a ↔ Filter.Tendsto (fun x => f x / g x) (nhdsWithin a {a}ᶜ) (nhds
0)`.

Logical form:

```lean
theorem LittleOQuotientCharacterization (f g : ℝ → ℝ) (a : ℝ)
    (hg : Filter.Eventually (fun x => g x ≠ 0) (nhdsWithin a {a}ᶜ)) :
    IsLittleOAt f g a ↔
      Filter.Tendsto (fun x => f x / g x) (nhdsWithin a {a}ᶜ) (nhds 0)
```
-/
theorem LittleOQuotientCharacterization (f g : ℝ → ℝ) (a : ℝ)
    (hg : Filter.Eventually (fun x => g x ≠ 0) (nhdsWithin a {a}ᶜ)) :
    IsLittleOAt f g a ↔
      Filter.Tendsto (fun x => f x / g x) (nhdsWithin a {a}ᶜ) (nhds 0) := by
  sorry

/-- Let `a : ℝ`. If `f1 f2 g : ℝ → ℝ`, `h1 : IsLittleOAt f1 g a`, and `h2 : IsLittleOAt f2 g a`.
Then `IsLittleOAt (fun x => f1 x + f2 x) g a`.

Logical form:

```lean
theorem LittleOSumRule (f1 f2 g : ℝ → ℝ) (a : ℝ)
    (h1 : IsLittleOAt f1 g a) (h2 : IsLittleOAt f2 g a) :
    IsLittleOAt (fun x => f1 x + f2 x) g a
```
-/
theorem LittleOSumRule (f1 f2 g : ℝ → ℝ) (a : ℝ)
    (h1 : IsLittleOAt f1 g a) (h2 : IsLittleOAt f2 g a) :
    IsLittleOAt (fun x => f1 x + f2 x) g a := by
  sorry

/-- Let `a : ℝ`. If `f g m : ℝ → ℝ`, `hf : IsLittleOAt f g a`, and `hm : ∃ M > 0, ∃ η > 0, ∀ x, 0 <
|x - a| → |x - a| < η → |m x| ≤ M`. Then `IsLittleOAt (fun x => m x * f x) g a`.

Logical form:

```lean
theorem LittleOBoundedFactorRule (f g m : ℝ → ℝ) (a : ℝ)
    (hf : IsLittleOAt f g a)
    (hm : ∃ M > 0, ∃ η > 0, ∀ x, 0 < |x - a| → |x - a| < η → |m x| ≤ M) :
    IsLittleOAt (fun x => m x * f x) g a
```
-/
theorem LittleOBoundedFactorRule (f g m : ℝ → ℝ) (a : ℝ)
    (hf : IsLittleOAt f g a)
    (hm : ∃ M > 0, ∃ η > 0, ∀ x, 0 < |x - a| → |x - a| < η → |m x| ≤ M) :
    IsLittleOAt (fun x => m x * f x) g a := by
  sorry

end LRA.Analysis.RealAnalysis
