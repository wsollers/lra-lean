
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

/--
`LinearCombo` TODO

Predicate logic:

  def LinearCombo (a b : ℝ) (f g : ℝ → ℝ) : ℝ → ℝ := fun x => a * f x + b * g x

Predicate logic (unfolded):

  def LinearCombo (a b : ℝ) (f g : ℝ → ℝ) : ℝ → ℝ := fun x => a * f x + b * g x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LinearCombo (a b : ℝ) (f g : ℝ → ℝ) : ℝ → ℝ := fun x => a * f x + b * g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LinearCombo (a b : ℝ) (f g : ℝ → ℝ) : ℝ → ℝ := fun x => a * f x + b * g x

/--
`LinearCombinationClosure` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a b : Real) (A : Set Real) (x : Real), x ∈ A → LRA.Analysis.Functions.LinearCombo a b f g x = instHAdd.hAdd (instHMul.hMul a (f x)) (instHMul.hMul b (g x))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    A : Set ℝ
  Prove
    x ∈ A → { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (g x)) = { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (g x))

Logical form (Lean):

```lean
theorem LinearCombinationClosure (f g : ℝ → ℝ) (a b : ℝ) (A : Set ℝ) :
    ∀ x ∈ A, LinearCombo a b f g x = a * f x + b * g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem LinearCombinationClosure (f g : ℝ → ℝ) (a b : ℝ) (A : Set ℝ) :
    ∀ x ∈ A, LinearCombo a b f g x = a * f x + b * g x := by
  sorry
/--
`BoundedLinearCombination` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (a b : Real), ((Exists fun B => (GT.gt B 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (GT.gt B 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → Exists fun B => (GT.gt B 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (LRA.Analysis.Functions.LinearCombo a b f g x)) B))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    a b : ℝ
  Prove
    ((Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))) ∧ (Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (g x)) B)))) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (g x)))) B))

Logical form (Lean):

```lean
theorem BoundedLinearCombination (f g : ℝ → ℝ) (A : Set ℝ) (a b : ℝ)
    (hf : ∃ B > 0, ∀ x ∈ A, |f x| ≤ B) (hg : ∃ B > 0, ∀ x ∈ A, |g x| ≤ B) :
    ∃ B > 0, ∀ x ∈ A, |LinearCombo a b f g x| ≤ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem BoundedLinearCombination (f g : ℝ → ℝ) (A : Set ℝ) (a b : ℝ)
    (hf : ∃ B > 0, ∀ x ∈ A, |f x| ≤ B) (hg : ∃ B > 0, ∀ x ∈ A, |g x| ≤ B) :
    ∃ B > 0, ∀ x ∈ A, |LinearCombo a b f g x| ≤ B := by
  sorry
/--
`IsClosedUnderLinearCombinations` TODO

Predicate logic:

  ∀ (C : Set (Real → Real)) (f g : Real → Real), (f ∈ C ∧ g ∈ C) → ∀ (a b : Real), LRA.Analysis.Functions.LinearCombo a b f g ∈ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (f ∈ C ∧ g ∈ C) → ∀ (a b : Real), fun ∈ Cx => { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (g x))

Logical form (Lean):

```lean
def IsClosedUnderLinearCombinations (C : Set (ℝ → ℝ)) : Prop :=
  ∀ f g, f ∈ C → g ∈ C → ∀ a b : ℝ, LinearCombo a b f g ∈ C
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsClosedUnderLinearCombinations (C : Set (ℝ → ℝ)) : Prop :=
  ∀ f g, f ∈ C → g ∈ C → ∀ a b : ℝ, LinearCombo a b f g ∈ C

/--
`IsRealLinearRule` TODO

Predicate logic:

  ∀ (C : Set (Real → Real)) (T : (Real → Real) → Real) (f g : Real → Real), (f ∈ C ∧ g ∈ C) → ∀ (a b : Real), T (LRA.Analysis.Functions.LinearCombo a b f g) = instHAdd.hAdd (instHMul.hMul a (T f)) (instHMul.hMul b (T g))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (f ∈ C ∧ g ∈ C) → ∀ (a b : Real), T fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (g x)) = { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (T f)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (T g))

Logical form (Lean):

```lean
def IsRealLinearRule (C : Set (ℝ → ℝ)) (T : (ℝ → ℝ) → ℝ) : Prop :=
  ∀ f g, f ∈ C → g ∈ C → ∀ a b : ℝ, T (LinearCombo a b f g) = a * T f + b * T g
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsRealLinearRule (C : Set (ℝ → ℝ)) (T : (ℝ → ℝ) → ℝ) : Prop :=
  ∀ f g, f ∈ C → g ∈ C → ∀ a b : ℝ, T (LinearCombo a b f g) = a * T f + b * T g

/--
`RealLinearRuleTest` TODO

Predicate logic:

  ∀ (C : Set (Real → Real)), LRA.Analysis.Functions.IsClosedUnderLinearCombinations C → ∀ (T : (Real → Real) → Real), LRA.Analysis.Functions.IsRealLinearRule C T ↔ ((∀ (f g : Real → Real), f ∈ C → g ∈ C → T fun x => instHAdd.hAdd (f x) (g x) = instHAdd.hAdd (T f) (T g)) ∧ (∀ (f : Real → Real), f ∈ C → ∀ (a : Real), T fun x => instHMul.hMul a (f x) = instHMul.hMul a (T f)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    C : Set (ℝ → ℝ)
    T : (ℝ → ℝ) → ℝ
  Prove
    LRA.Analysis.Functions.IsClosedUnderLinearCombinations C → ∀ (T : (Real → Real) → Real), LRA.Analysis.Functions.IsRealLinearRule C T ↔ ((∀ (f g : Real → Real), f ∈ C → g ∈ C → T fun x => instHAdd.hAdd (f x) (g x) = instHAdd.hAdd (T f) (T g)) ∧ (∀ (f : Real → Real), f ∈ C → ∀ (a : Real), T fun x => instHMul.hMul a (f x) = instHMul.hMul a (T f)))

Logical form (Lean):

```lean
theorem RealLinearRuleTest (C : Set (ℝ → ℝ))
    (hC : IsClosedUnderLinearCombinations C) (T : (ℝ → ℝ) → ℝ) :
    IsRealLinearRule C T ↔
      ((∀ f g, f ∈ C → g ∈ C → T (fun x => f x + g x) = T f + T g) ∧
        (∀ f, f ∈ C → ∀ a : ℝ, T (fun x => a * f x) = a * T f))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem RealLinearRuleTest (C : Set (ℝ → ℝ))
    (hC : IsClosedUnderLinearCombinations C) (T : (ℝ → ℝ) → ℝ) :
    IsRealLinearRule C T ↔
      ((∀ f g, f ∈ C → g ∈ C → T (fun x => f x + g x) = T f + T g) ∧
        (∀ f, f ∈ C → ∀ a : ℝ, T (fun x => a * f x) = a * T f)) := by
  sorry
/--
`RealLinearRuleBasicValues` TODO

Predicate logic:

  ∀ (C : Set (Real → Real)), LRA.Analysis.Functions.IsClosedUnderLinearCombinations C → ∀ (T : (Real → Real) → Real), (LRA.Analysis.Functions.IsRealLinearRule C T ∧ fun ∈ Cx => 0) → (T fun x => 0 = 0 ∧ (∀ (f : Real → Real), f ∈ C → T fun x => Real.instNeg.neg (f x) = Real.instNeg.neg (T f)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    C : Set (ℝ → ℝ)
    T : (ℝ → ℝ) → ℝ
  Prove
    (∀ (f g : Real → Real), f ∈ C → g ∈ C → ∀ (a b : Real), fun ∈ Cx => { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (g x))) → ∀ (T : (Real → Real) → Real), ((∀ (f g : Real → Real), f ∈ C → g ∈ C → ∀ (a b : Real), T fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (g x)) = { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul a (T f)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b (T g))) ∧ fun ∈ Cx => 0) → (T fun x => 0 = 0 ∧ (∀ (f : Real → Real), f ∈ C → T fun x => Real.instNeg.neg (f x) = Real.instNeg.neg (T f)))

Logical form (Lean):

```lean
theorem RealLinearRuleBasicValues (C : Set (ℝ → ℝ))
    (hC : IsClosedUnderLinearCombinations C) (T : (ℝ → ℝ) → ℝ)
    (hT : IsRealLinearRule C T) (h0 : (fun _ : ℝ => (0 : ℝ)) ∈ C) :
    T (fun _ => 0) = 0 ∧ ∀ f, f ∈ C → T (fun x => -f x) = -T f
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem RealLinearRuleBasicValues (C : Set (ℝ → ℝ))
    (hC : IsClosedUnderLinearCombinations C) (T : (ℝ → ℝ) → ℝ)
    (hT : IsRealLinearRule C T) (h0 : (fun _ : ℝ => (0 : ℝ)) ∈ C) :
    T (fun _ => 0) = 0 ∧ ∀ f, f ∈ C → T (fun x => -f x) = -T f := by
  sorry
end LRA.Analysis.Functions
