/-
Draft module; not yet imported by the active Volume III root.
Source: notes-real-valued-functions.tex (eighth and final of 8 files —
see ISSUES.md #30-#32 for file-wide findings, including the duplicated-
Failure-modes-block bug hitting `def:function-increasing`, `def:function-
strictly-increasing`, `def:function-decreasing`, `def:function-strictly-
decreasing`, `def:function-monotone`, and `def:function-constant` — six
of this cluster's seven definitions).

This cluster (14 nodes): the increasing/strictly-increasing/decreasing/
strictly-decreasing/monotone definitions and their basic implications,
negation-reverses-monotonicity, positive-scalar-multiples-preserve-
monotonicity (correctly hypothesis-guarded to positive scalars — a
negative scalar reverses direction, which the following "monotone need
not be strict" proposition family also respects), the constant-function
definition and its characterization (constant iff both increasing and
decreasing), and constant-functions-are-bounded /
constant-functions-are-monotone.

All 14 nodes mathematically correct. No new findings beyond the already-
logged duplication bug (ISSUES.md).
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Functions.AlgebraOfFunctions

namespace LRA.Analysis.Functions

/-- `def:function-increasing`.

Logical form:

```lean
def FunctionIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f x ≤ f y
```
-/
def FunctionIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f x ≤ f y

/-- `def:function-strictly-increasing`.

Logical form:

```lean
def FunctionStrictlyIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f x < f y
```
-/
def FunctionStrictlyIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f x < f y

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ` and `h : FunctionStrictlyIncreasing f A`. Then
`FunctionIncreasing f A`.

Logical form:

```lean
theorem StrictlyIncreasingImpliesIncreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A) : FunctionIncreasing f A
```
-/
theorem StrictlyIncreasingImpliesIncreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A) : FunctionIncreasing f A := by
  sorry

/-- `def:function-decreasing`.

Logical form:

```lean
def FunctionDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f y ≤ f x
```
-/
def FunctionDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f y ≤ f x

/-- `def:function-strictly-decreasing`.

Logical form:

```lean
def FunctionStrictlyDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f y < f x
```
-/
def FunctionStrictlyDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f y < f x

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ` and `h : FunctionStrictlyDecreasing f A`. Then
`FunctionDecreasing f A`.

Logical form:

```lean
theorem StrictlyDecreasingImpliesDecreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyDecreasing f A) : FunctionDecreasing f A
```
-/
theorem StrictlyDecreasingImpliesDecreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyDecreasing f A) : FunctionDecreasing f A := by
  sorry

/-- `def:function-monotone`.

Logical form:

```lean
def FunctionMonotone (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  FunctionIncreasing f A ∨ FunctionDecreasing f A
```
-/
def FunctionMonotone (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  FunctionIncreasing f A ∨ FunctionDecreasing f A

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ`. Then `(FunctionIncreasing f A ↔ FunctionDecreasing (fun x => -f
x) A) ∧ (FunctionDecreasing f A ↔ FunctionIncreasing (fun x => -f x) A)`.

Logical form:

```lean
theorem NegationReversesMonotonicity (f : ℝ → ℝ) (A : Set ℝ) :
    (FunctionIncreasing f A ↔ FunctionDecreasing (fun x => -f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionIncreasing (fun x => -f x) A)
```
-/
theorem NegationReversesMonotonicity (f : ℝ → ℝ) (A : Set ℝ) :
    (FunctionIncreasing f A ↔ FunctionDecreasing (fun x => -f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionIncreasing (fun x => -f x) A) := by
  sorry

/-- Let `A : Set ℝ` and `lam : ℝ`. If `f : ℝ → ℝ` and `hlam : 0 < lam`. Then `(FunctionIncreasing f
A ↔ FunctionIncreasing (fun x => lam * f x) A) ∧ (FunctionDecreasing f A ↔ FunctionDecreasing
(fun x => lam * f x) A)`.

Logical form:

```lean
theorem PositiveScalarMultiplesPreserveMonotonicity (f : ℝ → ℝ) (A : Set ℝ)
    (lam : ℝ) (hlam : 0 < lam) :
    (FunctionIncreasing f A ↔ FunctionIncreasing (fun x => lam * f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionDecreasing (fun x => lam * f x) A)
```
-/
theorem PositiveScalarMultiplesPreserveMonotonicity (f : ℝ → ℝ) (A : Set ℝ)
    (lam : ℝ) (hlam : 0 < lam) :
    (FunctionIncreasing f A ↔ FunctionIncreasing (fun x => lam * f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionDecreasing (fun x => lam * f x) A) := by
  sorry

/-- The theorem asserts `∃ (A : Set ℝ) (f : ℝ → ℝ), FunctionIncreasing f A ∧ ¬
FunctionStrictlyIncreasing f A`.

Logical form:

```lean
theorem MonotoneNeedNotBeStrict :
    ∃ (A : Set ℝ) (f : ℝ → ℝ), FunctionIncreasing f A ∧
      ¬ FunctionStrictlyIncreasing f A
```
-/
theorem MonotoneNeedNotBeStrict :
    ∃ (A : Set ℝ) (f : ℝ → ℝ), FunctionIncreasing f A ∧
      ¬ FunctionStrictlyIncreasing f A := by
  sorry

/-- `def:function-constant`.

Logical form:

```lean
def FunctionConstant (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ c : ℝ, ∀ x ∈ A, f x = c
```
-/
def FunctionConstant (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ c : ℝ, ∀ x ∈ A, f x = c

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ`. Then `FunctionConstant f A ↔ (FunctionIncreasing f A ∧
FunctionDecreasing f A)`.

Logical form:

```lean
theorem ConstantFunctionCharacterization (f : ℝ → ℝ) (A : Set ℝ) :
    FunctionConstant f A ↔ (FunctionIncreasing f A ∧ FunctionDecreasing f A)
```
-/
theorem ConstantFunctionCharacterization (f : ℝ → ℝ) (A : Set ℝ) :
    FunctionConstant f A ↔ (FunctionIncreasing f A ∧ FunctionDecreasing f A) := by
  sorry

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ` and `h : FunctionConstant f A`. Then `∃ B > 0, ∀ x ∈ A, |f x| ≤
B`.

Logical form:

```lean
theorem ConstantFunctionsAreBounded (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : ∃ B > 0, ∀ x ∈ A, |f x| ≤ B
```
-/
theorem ConstantFunctionsAreBounded (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : ∃ B > 0, ∀ x ∈ A, |f x| ≤ B := by
  sorry

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ` and `h : FunctionConstant f A`. Then `FunctionMonotone f A`.

Logical form:

```lean
theorem ConstantFunctionsAreMonotone (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : FunctionMonotone f A
```
-/
theorem ConstantFunctionsAreMonotone (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : FunctionMonotone f A := by
  sorry

/- ================================================================
   ADDITIONS.md items 9-11 (Functions chapter, `real-valued-functions`
   section). Added with user sign-off. See ADDITIONS.md for the full
   rationale on each; docstrings here summarize.
   ================================================================ -/

/-- Let `A : Set ℝ`. If `f g : ℝ → ℝ`. Then `(FunctionIncreasing f A → FunctionIncreasing g A →
FunctionIncreasing (fun x => f x + g x) A) ∧ (FunctionDecreasing f A → FunctionDecreasing g A →
FunctionDecreasing (fun x => f x + g x) A) ∧ (FunctionIncreasing f A → FunctionIncreasing g A →
(∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) → FunctionIncreasing (fun x => f x * g x) A) ∧
(FunctionDecreasing f A → FunctionDecreasing g A → (∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) →
FunctionDecreasing (fun x => f x * g x) A)`.

Logical form:

```lean
theorem MonotoneFunctionAlgebra (f g : ℝ → ℝ) (A : Set ℝ) :
    (FunctionIncreasing f A → FunctionIncreasing g A →
      FunctionIncreasing (fun x => f x + g x) A) ∧
    (FunctionDecreasing f A → FunctionDecreasing g A →
      FunctionDecreasing (fun x => f x + g x) A) ∧
    (FunctionIncreasing f A → FunctionIncreasing g A →
      (∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) →
      FunctionIncreasing (fun x => f x * g x) A) ∧
    (FunctionDecreasing f A → FunctionDecreasing g A →
      (∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) →
      FunctionDecreasing (fun x => f x * g x) A)
```
-/
theorem MonotoneFunctionAlgebra (f g : ℝ → ℝ) (A : Set ℝ) :
    (FunctionIncreasing f A → FunctionIncreasing g A →
      FunctionIncreasing (fun x => f x + g x) A) ∧
    (FunctionDecreasing f A → FunctionDecreasing g A →
      FunctionDecreasing (fun x => f x + g x) A) ∧
    (FunctionIncreasing f A → FunctionIncreasing g A →
      (∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) →
      FunctionIncreasing (fun x => f x * g x) A) ∧
    (FunctionDecreasing f A → FunctionDecreasing g A →
      (∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) →
      FunctionDecreasing (fun x => f x * g x) A) := by
  sorry

/-- Let `A : Set ℝ`. If `f : ℝ → ℝ` and `h : FunctionStrictlyIncreasing f A ∨
FunctionStrictlyDecreasing f A`. Then `∀ x ∈ A, ∀ y ∈ A, f x = f y → x = y`.

Logical form:

```lean
theorem StrictlyMonotoneImpliesInjective (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A ∨ FunctionStrictlyDecreasing f A) :
    ∀ x ∈ A, ∀ y ∈ A, f x = f y → x = y
```
-/
theorem StrictlyMonotoneImpliesInjective (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A ∨ FunctionStrictlyDecreasing f A) :
    ∀ x ∈ A, ∀ y ∈ A, f x = f y → x = y := by
  sorry

/-- Let `S A : Set ℝ`. If `f : ℝ → ℝ` and `hS : S ⊆ A`. Then `(FunctionIncreasing f A →
FunctionIncreasing f S) ∧ (FunctionDecreasing f A → FunctionDecreasing f S) ∧
(FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f S) ∧ (FunctionStrictlyDecreasing
f A → FunctionStrictlyDecreasing f S)`.

Logical form:

```lean
theorem MonotonicityRestriction (f : ℝ → ℝ) (S A : Set ℝ) (hS : S ⊆ A) :
    (FunctionIncreasing f A → FunctionIncreasing f S) ∧
    (FunctionDecreasing f A → FunctionDecreasing f S) ∧
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f S) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f S)
```
-/
theorem MonotonicityRestriction (f : ℝ → ℝ) (S A : Set ℝ) (hS : S ⊆ A) :
    (FunctionIncreasing f A → FunctionIncreasing f S) ∧
    (FunctionDecreasing f A → FunctionDecreasing f S) ∧
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f S) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f S) := by
  sorry

/- ================================================================
   ADDITIONS.md items 14-15. Added with user sign-off.
   ================================================================ -/

/-- Let `A B : Set ℝ`. If `f g : ℝ → ℝ` and `hmaps : ∀ x ∈ A, f x ∈ B`. Then `(FunctionIncreasing f
A → FunctionIncreasing g B → FunctionIncreasing (g ∘ f) A) ∧ (FunctionDecreasing f A →
FunctionDecreasing g B → FunctionIncreasing (g ∘ f) A) ∧ (FunctionIncreasing f A →
FunctionDecreasing g B → FunctionDecreasing (g ∘ f) A) ∧ (FunctionDecreasing f A →
FunctionIncreasing g B → FunctionDecreasing (g ∘ f) A)`.

Logical form:

```lean
theorem CompositionOfMonotoneFunctions (f g : ℝ → ℝ) (A B : Set ℝ)
    (hmaps : ∀ x ∈ A, f x ∈ B) :
    (FunctionIncreasing f A → FunctionIncreasing g B →
      FunctionIncreasing (g ∘ f) A) ∧
    (FunctionDecreasing f A → FunctionDecreasing g B →
      FunctionIncreasing (g ∘ f) A) ∧
    (FunctionIncreasing f A → FunctionDecreasing g B →
      FunctionDecreasing (g ∘ f) A) ∧
    (FunctionDecreasing f A → FunctionIncreasing g B →
      FunctionDecreasing (g ∘ f) A)
```
-/
theorem CompositionOfMonotoneFunctions (f g : ℝ → ℝ) (A B : Set ℝ)
    (hmaps : ∀ x ∈ A, f x ∈ B) :
    (FunctionIncreasing f A → FunctionIncreasing g B →
      FunctionIncreasing (g ∘ f) A) ∧
    (FunctionDecreasing f A → FunctionDecreasing g B →
      FunctionIncreasing (g ∘ f) A) ∧
    (FunctionIncreasing f A → FunctionDecreasing g B →
      FunctionDecreasing (g ∘ f) A) ∧
    (FunctionDecreasing f A → FunctionIncreasing g B →
      FunctionDecreasing (g ∘ f) A) := by
  sorry

/-- Let `A B : Set ℝ`. If `f f' : ℝ → ℝ`, `hmaps : ∀ x ∈ A, f x ∈ B`, `hsurj : ∀ y ∈ B, ∃ x ∈ A, f x
= y`, `hleft : ∀ x ∈ A, f' (f x) = x`, and `hright : ∀ y ∈ B, f (f' y) = y`. Then
`(FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f' B) ∧
(FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f' B)`.

Logical form:

```lean
theorem InverseOfStrictlyMonotoneBijectionIsStrictlyMonotone
    (f f' : ℝ → ℝ) (A B : Set ℝ)
    (hmaps : ∀ x ∈ A, f x ∈ B) (hsurj : ∀ y ∈ B, ∃ x ∈ A, f x = y)
    (hleft : ∀ x ∈ A, f' (f x) = x) (hright : ∀ y ∈ B, f (f' y) = y) :
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f' B) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f' B)
```
-/
theorem InverseOfStrictlyMonotoneBijectionIsStrictlyMonotone
    (f f' : ℝ → ℝ) (A B : Set ℝ)
    (hmaps : ∀ x ∈ A, f x ∈ B) (hsurj : ∀ y ∈ B, ∃ x ∈ A, f x = y)
    (hleft : ∀ x ∈ A, f' (f x) = x) (hright : ∀ y ∈ B, f (f' y) = y) :
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f' B) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f' B) := by
  sorry

end LRA.Analysis.Functions
