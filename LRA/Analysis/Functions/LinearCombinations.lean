
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

  ∀ x ∈ A, LinearCombo a b f g x = a * f x + b * g x

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a b : Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x)) = instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x))

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

  (∃ B > 0, ∀ x ∈ A, |f x| ≤ B ∧ ∃ B > 0, ∀ x ∈ A, |g x| ≤ B) → ∃ B > 0, ∀ x ∈ A, |LinearCombo a b f g x| ≤ B

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (a b : Real), (Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B) ∧ Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) B)) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHAdd.1 (instHMul.hMul a (f x)) (instHMul.hMul b (g x))))) B)

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

  ∀ (C : Set (Real → Real)) (f g : Real → Real), (Set.instMembership.mem C f ∧ Set.instMembership.mem C g) → ∀ (a b : Real), Set.instMembership.mem C (LRA.Analysis.Functions.LinearCombo a b f g)

Predicate logic (unfolded):

  ∀ (C : (Real → Real) → Prop) (f g : Real → Real), (Set.instMembership.1 C f ∧ Set.instMembership.1 C g) → ∀ (a b : Real), Set.instMembership.1 C fun x => instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x))

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

  ∀ (C : Set (Real → Real)) (T : (Real → Real) → Real) (f g : Real → Real), (Set.instMembership.mem C f ∧ Set.instMembership.mem C g) → ∀ (a b : Real), T (LRA.Analysis.Functions.LinearCombo a b f g) = instHAdd.hAdd (instHMul.hMul a (T f)) (instHMul.hMul b (T g))

Predicate logic (unfolded):

  ∀ (C : (Real → Real) → Prop) (T : (Real → Real) → Real) (f g : Real → Real), (Set.instMembership.1 C f ∧ Set.instMembership.1 C g) → ∀ (a b : Real), T fun x => instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x)) = instHAdd.1 (instHMul.1 a (T f)) (instHMul.1 b (T g))

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

  (Set (ℝ → ℝ) ∧ IsClosedUnderLinearCombinations C ∧ (ℝ → ℝ) → ℝ) → IsRealLinearRule C T ↔ ((∀ f g, f ∈ C → g ∈ C → T (fun x => f x + g x) = T f + T g) ∧ ∀ f, f ∈ C → ∀ a ∈ ℝ, T (fun x => a * f x = a * T f))

Predicate logic (unfolded):

  ∀ (C : (Real → Real) → Prop), (∀ (f g : Real → Real), Set.instMembership.1 C f → Set.instMembership.1 C g → ∀ (a b : Real), Set.instMembership.1 C fun x => instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x))) → ∀ (T : (Real → Real) → Real), ∀ (f g : Real → Real), Set.instMembership.1 C f → Set.instMembership.1 C g → ∀ (a b : Real), T fun x => instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x)) = instHAdd.1 (instHMul.1 a (T f)) (instHMul.1 b (T g)) ↔ (∀ (f g : Real → Real), Set.instMembership.1 C f → Set.instMembership.1 C g → T fun x => instHAdd.1 (f x) (g x) = instHAdd.1 (T f) (T g) ∧ ∀ (f : Real → Real), Set.instMembership.1 C f → ∀ (a : Real), T fun x => instHMul.1 a (f x) = instHMul.1 a (T f))

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

  (Set (ℝ → ℝ) ∧ IsClosedUnderLinearCombinations C ∧ (ℝ → ℝ) → ℝ ∧ IsRealLinearRule C T ∧ fun _ ∈ ℝ => 0 ∈ ℝ ∈ C) → T (fun _ => 0) = 0 ∧ ∀ f, f ∈ C → T (fun x => -f x) = -T f

Predicate logic (unfolded):

  ∀ (C : (Real → Real) → Prop), (∀ (f g : Real → Real), Set.instMembership.1 C f → Set.instMembership.1 C g → ∀ (a b : Real), Set.instMembership.1 C fun x => instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x))) → ∀ (T : (Real → Real) → Real), (∀ (f g : Real → Real), Set.instMembership.1 C f → Set.instMembership.1 C g → ∀ (a b : Real), T fun x => instHAdd.1 (instHMul.1 a (f x)) (instHMul.1 b (g x)) = instHAdd.1 (instHMul.1 a (T f)) (instHMul.1 b (T g)) ∧ Set.instMembership.1 C fun x => Zero.toOfNat0.1) → (T fun x => Zero.toOfNat0.1 = Zero.toOfNat0.1 ∧ ∀ (f : Real → Real), Set.instMembership.1 C f → T fun x => Real.instNeg.1 (f x) = Real.instNeg.1 (T f))

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
