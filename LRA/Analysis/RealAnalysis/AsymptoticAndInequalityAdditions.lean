/-
Draft module; not yet imported by the active Volume III root.
New namespace/area: `LRA.Analysis.RealAnalysis.*`, the Lean home for
Chapter 1 ("Real Analysis") — the personal proof-technique/toolkit chapter,
audited as reference content rather than a strictly linear theorem sequence
per the author's explicit framing.

Source: ADDITIONS.md items 25, 26, 27 — three additions proposed after
auditing `asymptotic-notation.tex` and `inequality.tex` and being asked
"if there are other things I should include," approved with sign-off.

- Item 25 (big-O family): `asymptotic-notation.tex` defines little-o (at a
  point, at infinity, increment form) but never big-O, despite big-O being
  at least as commonly used in practice. Formalized generically enough to
  cover both the at-a-point and at-infinity cases the book's own little-o
  treatment splits into.
- Item 26 (Young's Inequality): the one-line convexity lemma Hölder's
  Inequality (`thm:ineq-holder`, already in the book) is standardly proved
  from, but which the book never states on its own.
- Item 27 (Jensen's Inequality): the umbrella convexity result that AM-GM,
  Cauchy-Schwarz, and the power-mean family are all specializations of;
  convexity itself is never defined anywhere in the chapter.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Convex.Basic

namespace LRA.Analysis.RealAnalysis

/- ================================================================
   ADDITIONS.md item 25 — Big-O notation.
   Companion to the book's own `def:little-o-at-a-point` /
   `def:little-o-at-infinity`, matching their case split.
   ================================================================ -/

/-- `f(x) = O(g(x))` as `x → a`: eventually, `|f|` is bounded by a FIXED
multiple of `|g|` — contrast with little-o, where it must be bounded by
EVERY multiple `ε|g|`, however small. Mirrors the book's own
`def:little-o-at-a-point` in shape (punctured `δ`-neighbourhood of `a`),
differing only in quantifying `∃C` instead of `∀ε`.

Logical form:

```lean
def IsBigOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∃ C > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ C * |g x|
```
-/
def IsBigOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∃ C > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ C * |g x|

/-- `f(x) = O(g(x))` as `x → ∞`: eventually (for large `x`), `|f|` is
bounded by a fixed multiple of `|g|`. Mirrors the book's own
`def:little-o-at-infinity`.

Logical form:

```lean
def IsBigOAtTop (f g : ℝ → ℝ) : Prop :=
  ∃ C > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ C * |g x|
```
-/
def IsBigOAtTop (f g : ℝ → ℝ) : Prop :=
  ∃ C > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ C * |g x|

/-- Let `a : ℝ`. If `f g : ℝ → ℝ` and `ho : ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x|
≤ ε * |g x|`. Then `IsBigOAt f g a`.

Logical form:

```lean
theorem LittleOImpliesBigOAt
    (f g : ℝ → ℝ) (a : ℝ)
    (ho : ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|) :
    IsBigOAt f g a
```
-/
theorem LittleOImpliesBigOAt
    (f g : ℝ → ℝ) (a : ℝ)
    (ho : ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|) :
    IsBigOAt f g a := by
  sorry

/-- If `f g : ℝ → ℝ` and `ho : ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|`. Then `IsBigOAtTop
f g`.

Logical form:

```lean
theorem LittleOImpliesBigOAtTop
    (f g : ℝ → ℝ)
    (ho : ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|) :
    IsBigOAtTop f g
```
-/
theorem LittleOImpliesBigOAtTop
    (f g : ℝ → ℝ)
    (ho : ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|) :
    IsBigOAtTop f g := by
  sorry

/-- Let `a b : ℝ` and `p q : ℝ`. If `ha : 0 ≤ a`, `hb : 0 ≤ b`, `hp : 1 < p`, `hq : 1 < q`, and `hpq
: 1 / p + 1 / q = 1`. Then `a * b ≤ a ^ p / p + b ^ q / q`.

Logical form:

```lean
theorem YoungsInequality
    (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (p q : ℝ) (hp : 1 < p) (hq : 1 < q) (hpq : 1 / p + 1 / q = 1) :
    a * b ≤ a ^ p / p + b ^ q / q
```
-/
theorem YoungsInequality
    (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (p q : ℝ) (hp : 1 < p) (hq : 1 < q) (hpq : 1 / p + 1 / q = 1) :
    a * b ≤ a ^ p / p + b ^ q / q := by
  sorry

/-- Convexity of `φ` on all of `ℝ`, stated in the book's own two-point
`∀x,y,λ` idiom rather than reached for via Mathlib's `ConvexOn` machinery —
matches the style of every other definition in this corpus (explicit
quantifiers, not typeclass-bundled structure).

Logical form:

```lean
def IsConvexOnR (φ : ℝ → ℝ) : Prop :=
  ∀ x y : ℝ, ∀ lam : ℝ, 0 ≤ lam → lam ≤ 1 →
    φ (lam * x + (1 - lam) * y) ≤ lam * φ x + (1 - lam) * φ y
```
-/
def IsConvexOnR (φ : ℝ → ℝ) : Prop :=
  ∀ x y : ℝ, ∀ lam : ℝ, 0 ≤ lam → lam ≤ 1 →
    φ (lam * x + (1 - lam) * y) ≤ lam * φ x + (1 - lam) * φ y

/-- Let `n : ℕ`. If `φ : ℝ → ℝ`, `hφ : IsConvexOnR φ`, `hn : 0 < n`, `x lam : Fin n → ℝ`,
`hlam_nonneg : ∀ i, 0 ≤ lam i`, and `hlam_sum : (Finset.univ.sum lam) = 1`. Then `φ
(Finset.univ.sum (fun i => lam i * x i)) ≤ Finset.univ.sum (fun i => lam i * φ (x i))`.

Logical form:

```lean
theorem JensensInequalityFinite
    (φ : ℝ → ℝ) (hφ : IsConvexOnR φ)
    (n : ℕ) (hn : 0 < n) (x lam : Fin n → ℝ)
    (hlam_nonneg : ∀ i, 0 ≤ lam i)
    (hlam_sum : (Finset.univ.sum lam) = 1) :
    φ (Finset.univ.sum (fun i => lam i * x i))
      ≤ Finset.univ.sum (fun i => lam i * φ (x i))
```
-/
theorem JensensInequalityFinite
    (φ : ℝ → ℝ) (hφ : IsConvexOnR φ)
    (n : ℕ) (hn : 0 < n) (x lam : Fin n → ℝ)
    (hlam_nonneg : ∀ i, 0 ≤ lam i)
    (hlam_sum : (Finset.univ.sum lam) = 1) :
    φ (Finset.univ.sum (fun i => lam i * x i))
      ≤ Finset.univ.sum (fun i => lam i * φ (x i)) := by
  sorry

end LRA.Analysis.RealAnalysis
