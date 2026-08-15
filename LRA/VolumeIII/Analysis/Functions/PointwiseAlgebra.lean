/-
Draft module; not yet imported by the active Volume III root.
Source: notes-real-valued-functions.tex (second of 8 files for this
section — see ISSUES.md #30-#32 for the file-wide findings).

This cluster (14 nodes): the 9 pointwise operation definitions (sum,
difference, product, scalar multiple, absolute value, max, min,
quotient, reciprocal), function-algebra-closure, function-quotient-
closure, and 3 supporting propositions (max/min via absolute value,
max/min bounds, quotient undefined when denominator vanishes). All 14
are mathematically correct.

Finding (see ISSUES.md #31, 🟡): `thm:function-algebra-closure`'s own
dependency list cites only `def:pointwise-sum-of-functions` and
`def:pointwise-minimum-of-two-functions` — but the theorem's conclusion
covers ALL SEVEN operations (f+g, f-g, fg, λf, |f|, max(f,g), min(f,g)),
so five of the seven relevant definitions (difference, product, scalar
multiple, absolute value, maximum) are missing from the dependency list.

Note on `prop:quotient-undefined-when-denominator-vanishes`: Lean's `ℝ`
has TOTAL division (`x/0 := 0`), so nothing in Lean literally "fails to
be a function" the way the `.tex`'s own semi-formal function-with-a-
domain-restriction framework does. Formalized faithfully below as: a
zero of the denominator on `A` means the WELL-DEFINEDNESS PRECONDITION
of `def:pointwise-quotient-of-functions` (`∀x∈A, g x ≠ 0`) fails — which
is the actual content the `.tex` is asserting, translated to a setting
where the quotient function itself is always total.
-/

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

/-- `def:pointwise-sum-of-functions`.

Logical form:

```lean
def PointwiseSum (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x + g x
```
-/
def PointwiseSum (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x + g x

/-- `def:pointwise-difference-of-functions`.

Logical form:

```lean
def PointwiseDiff (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x - g x
```
-/
def PointwiseDiff (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x - g x

/-- `def:pointwise-product-of-functions`.

Logical form:

```lean
def PointwiseProd (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x * g x
```
-/
def PointwiseProd (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x * g x

/-- `def:pointwise-scalar-multiple-of-a-function`.

Logical form:

```lean
def PointwiseScalarMul (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => lam * f x
```
-/
def PointwiseScalarMul (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => lam * f x

/-- `def:pointwise-absolute-value-of-a-function`.

Logical form:

```lean
def PointwiseAbs (f : ℝ → ℝ) : ℝ → ℝ := fun x => |f x|
```
-/
def PointwiseAbs (f : ℝ → ℝ) : ℝ → ℝ := fun x => |f x|

/-- `def:pointwise-maximum-of-two-functions`.

Logical form:

```lean
def PointwiseMax (f g : ℝ → ℝ) : ℝ → ℝ := fun x => max (f x) (g x)
```
-/
def PointwiseMax (f g : ℝ → ℝ) : ℝ → ℝ := fun x => max (f x) (g x)

/-- `def:pointwise-minimum-of-two-functions`.

Logical form:

```lean
def PointwiseMin (f g : ℝ → ℝ) : ℝ → ℝ := fun x => min (f x) (g x)
```
-/
def PointwiseMin (f g : ℝ → ℝ) : ℝ → ℝ := fun x => min (f x) (g x)

/-- `def:pointwise-quotient-of-functions`. Total in Lean (division by
zero is `0`); the `.tex`'s nonvanishing-denominator hypothesis is
carried as a separate hypothesis on theorems that need it.

Logical form:

```lean
noncomputable def PointwiseQuotient (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x / g x
```
-/
noncomputable def PointwiseQuotient (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x / g x

/-- `def:pointwise-reciprocal-of-a-function`.

Logical form:

```lean
noncomputable def PointwiseReciprocal (f : ℝ → ℝ) : ℝ → ℝ := fun x => 1 / f x
```
-/
noncomputable def PointwiseReciprocal (f : ℝ → ℝ) : ℝ → ℝ := fun x => 1 / f x

-- `thm:function-algebra-closure`
/-- Let `lam : ℝ` and `A : Set ℝ`. If `f g : ℝ → ℝ`. Then `(∀ x ∈ A, PointwiseSum f g x = f x + g x)
∧ (∀ x ∈ A, PointwiseDiff f g x = f x - g x) ∧ (∀ x ∈ A, PointwiseProd f g x = f x * g x) ∧ (∀ x
∈ A, PointwiseScalarMul lam f x = lam * f x) ∧ (∀ x ∈ A, PointwiseAbs f x = |f x|) ∧ (∀ x ∈ A,
PointwiseMax f g x = max (f x) (g x)) ∧ (∀ x ∈ A, PointwiseMin f g x = min (f x) (g x))`.

Logical form:

```lean
theorem FunctionAlgebraClosure (f g : ℝ → ℝ) (lam : ℝ) (A : Set ℝ) :
    (∀ x ∈ A, PointwiseSum f g x = f x + g x) ∧
      (∀ x ∈ A, PointwiseDiff f g x = f x - g x) ∧
      (∀ x ∈ A, PointwiseProd f g x = f x * g x) ∧
      (∀ x ∈ A, PointwiseScalarMul lam f x = lam * f x) ∧
      (∀ x ∈ A, PointwiseAbs f x = |f x|) ∧
      (∀ x ∈ A, PointwiseMax f g x = max (f x) (g x)) ∧
      (∀ x ∈ A, PointwiseMin f g x = min (f x) (g x))
```
-/
theorem FunctionAlgebraClosure (f g : ℝ → ℝ) (lam : ℝ) (A : Set ℝ) :
    (∀ x ∈ A, PointwiseSum f g x = f x + g x) ∧
      (∀ x ∈ A, PointwiseDiff f g x = f x - g x) ∧
      (∀ x ∈ A, PointwiseProd f g x = f x * g x) ∧
      (∀ x ∈ A, PointwiseScalarMul lam f x = lam * f x) ∧
      (∀ x ∈ A, PointwiseAbs f x = |f x|) ∧
      (∀ x ∈ A, PointwiseMax f g x = max (f x) (g x)) ∧
      (∀ x ∈ A, PointwiseMin f g x = min (f x) (g x)) := by
  sorry

-- `thm:function-quotient-closure`
/-- Let `A : Set ℝ`. If `f g : ℝ → ℝ` and `h : ∀ x ∈ A, g x ≠ 0`. Then `∀ x ∈ A, PointwiseQuotient f
g x = f x / g x`.

Logical form:

```lean
theorem FunctionQuotientClosure (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, g x ≠ 0) : ∀ x ∈ A, PointwiseQuotient f g x = f x / g x
```
-/
theorem FunctionQuotientClosure (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, g x ≠ 0) : ∀ x ∈ A, PointwiseQuotient f g x = f x / g x := by
  sorry

/-- Let `A : Set ℝ`. If `f g : ℝ → ℝ`. Then `∀ x ∈ A, PointwiseMax f g x = (f x + g x + |f x - g x|)
/ 2 ∧ PointwiseMin f g x = (f x + g x - |f x - g x|) / 2`.

Logical form:

```lean
theorem PointwiseMaxMinAbsoluteValueFormulas (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMax f g x = (f x + g x + |f x - g x|) / 2 ∧
      PointwiseMin f g x = (f x + g x - |f x - g x|) / 2
```
-/
theorem PointwiseMaxMinAbsoluteValueFormulas (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMax f g x = (f x + g x + |f x - g x|) / 2 ∧
      PointwiseMin f g x = (f x + g x - |f x - g x|) / 2 := by
  sorry

/-- Let `A : Set ℝ`. If `f g : ℝ → ℝ`. Then `∀ x ∈ A, PointwiseMin f g x ≤ f x ∧ f x ≤ PointwiseMax
f g x ∧ PointwiseMin f g x ≤ g x ∧ g x ≤ PointwiseMax f g x`.

Logical form:

```lean
theorem PointwiseMaxMinBounds (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMin f g x ≤ f x ∧ f x ≤ PointwiseMax f g x ∧
      PointwiseMin f g x ≤ g x ∧ g x ≤ PointwiseMax f g x
```
-/
theorem PointwiseMaxMinBounds (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMin f g x ≤ f x ∧ f x ≤ PointwiseMax f g x ∧
      PointwiseMin f g x ≤ g x ∧ g x ≤ PointwiseMax f g x := by
  sorry

/-- Let `A : Set ℝ` and `x₀ : ℝ`. If `f g : ℝ → ℝ`, `hx₀ : x₀ ∈ A`, and `hg : g x₀ = 0`. Then `¬ (∀
x ∈ A, g x ≠ 0)`.

Logical form:

```lean
theorem QuotientUndefinedWhenDenominatorVanishes (f g : ℝ → ℝ)
    (A : Set ℝ) (x₀ : ℝ) (hx₀ : x₀ ∈ A) (hg : g x₀ = 0) :
    ¬ (∀ x ∈ A, g x ≠ 0)
```
-/
theorem QuotientUndefinedWhenDenominatorVanishes (f g : ℝ → ℝ)
    (A : Set ℝ) (x₀ : ℝ) (hx₀ : x₀ ∈ A) (hg : g x₀ = 0) :
    ¬ (∀ x ∈ A, g x ≠ 0) := by
  sorry

end LRA.Analysis.Functions
