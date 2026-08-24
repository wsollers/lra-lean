
import Mathlib.Data.Real.Basic
import LRA.Analysis.Functions.AlgebraOfFunctions

namespace LRA.Analysis.Functions

/--
`FunctionIncreasing` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → ∀ (y : Real), (Set.instMembership.mem A y ∧ Real.instLE.le x y) → Real.instLE.le (f x) (f y)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → ∀ (y : Real), (Set.instMembership.1 A y ∧ Real.instLE.1 x y) → Real.instLE.1 (f x) (f y)

Logical form (Lean):

```lean
def FunctionIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f x ≤ f y
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
def FunctionIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f x ≤ f y

/--
`FunctionStrictlyIncreasing` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → ∀ (y : Real), (Set.instMembership.mem A y ∧ Real.instLT.lt x y) → Real.instLT.lt (f x) (f y)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → ∀ (y : Real), (Set.instMembership.1 A y ∧ Real.instLT.1 x y) → Real.instLT.1 (f x) (f y)

Logical form (Lean):

```lean
def FunctionStrictlyIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f x < f y
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
def FunctionStrictlyIncreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f x < f y

/--
`StrictlyIncreasingImpliesIncreasing` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionIncreasing f A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f x) (f y)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), (Set.instMembership.1 A y ∧ Real.instLE.1 x y) → Real.instLE.1 (f x) (f y)

Logical form (Lean):

```lean
theorem StrictlyIncreasingImpliesIncreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A) : FunctionIncreasing f A
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
theorem StrictlyIncreasingImpliesIncreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A) : FunctionIncreasing f A := by
  sorry

/--
`FunctionDecreasing` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → ∀ (y : Real), (Set.instMembership.mem A y ∧ Real.instLE.le x y) → Real.instLE.le (f y) (f x)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → ∀ (y : Real), (Set.instMembership.1 A y ∧ Real.instLE.1 x y) → Real.instLE.1 (f y) (f x)

Logical form (Lean):

```lean
def FunctionDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f y ≤ f x
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
def FunctionDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x ≤ y → f y ≤ f x

/--
`FunctionStrictlyDecreasing` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → ∀ (y : Real), (Set.instMembership.mem A y ∧ Real.instLT.lt x y) → Real.instLT.lt (f y) (f x)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → ∀ (y : Real), (Set.instMembership.1 A y ∧ Real.instLT.1 x y) → Real.instLT.1 (f y) (f x)

Logical form (Lean):

```lean
def FunctionStrictlyDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f y < f x
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
def FunctionStrictlyDecreasing (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x < y → f y < f x

/--
`StrictlyDecreasingImpliesDecreasing` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionDecreasing f A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f y) (f x)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), (Set.instMembership.1 A y ∧ Real.instLE.1 x y) → Real.instLE.1 (f y) (f x)

Logical form (Lean):

```lean
theorem StrictlyDecreasingImpliesDecreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyDecreasing f A) : FunctionDecreasing f A
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
theorem StrictlyDecreasingImpliesDecreasing (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyDecreasing f A) : FunctionDecreasing f A := by
  sorry

/--
`FunctionMonotone` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Or (LRA.Analysis.Functions.FunctionIncreasing f A) (LRA.Analysis.Functions.FunctionDecreasing f A)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Or (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y)) (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x))

Logical form (Lean):

```lean
def FunctionMonotone (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  FunctionIncreasing f A ∨ FunctionDecreasing f A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def FunctionMonotone (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  FunctionIncreasing f A ∨ FunctionDecreasing f A

/--
`NegationReversesMonotonicity` TODO

Predicate logic:

  (ℝ → ℝ) → (FunctionIncreasing f A ↔ FunctionDecreasing (fun x => -f x) A) ∧ (FunctionDecreasing f A ↔ FunctionIncreasing (fun x => -f x) A)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y) ↔ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => Real.instNeg.1 (f x)) y) ((fun x => Real.instNeg.1 (f x)) x) ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x) ↔ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => Real.instNeg.1 (f x)) x) ((fun x => Real.instNeg.1 (f x)) y))

Logical form (Lean):

```lean
theorem NegationReversesMonotonicity (f : ℝ → ℝ) (A : Set ℝ) :
    (FunctionIncreasing f A ↔ FunctionDecreasing (fun x => -f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionIncreasing (fun x => -f x) A)
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
theorem NegationReversesMonotonicity (f : ℝ → ℝ) (A : Set ℝ) :
    (FunctionIncreasing f A ↔ FunctionDecreasing (fun x => -f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionIncreasing (fun x => -f x) A) := by
  sorry

/--
`PositiveScalarMultiplesPreserveMonotonicity` TODO

Predicate logic:

  (ℝ → ℝ ∧ 0 < lam) → (FunctionIncreasing f A ↔ FunctionIncreasing (fun x => lam * f x) A) ∧ (FunctionDecreasing f A ↔ FunctionDecreasing (fun x => lam * f x) A)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (lam : Real), Real.instLT.1 Zero.toOfNat0.1 lam → (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y) ↔ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => instHMul.1 lam (f x)) x) ((fun x => instHMul.1 lam (f x)) y) ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x) ↔ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => instHMul.1 lam (f x)) y) ((fun x => instHMul.1 lam (f x)) x))

Logical form (Lean):

```lean
theorem PositiveScalarMultiplesPreserveMonotonicity (f : ℝ → ℝ) (A : Set ℝ)
    (lam : ℝ) (hlam : 0 < lam) :
    (FunctionIncreasing f A ↔ FunctionIncreasing (fun x => lam * f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionDecreasing (fun x => lam * f x) A)
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
theorem PositiveScalarMultiplesPreserveMonotonicity (f : ℝ → ℝ) (A : Set ℝ)
    (lam : ℝ) (hlam : 0 < lam) :
    (FunctionIncreasing f A ↔ FunctionIncreasing (fun x => lam * f x) A) ∧
      (FunctionDecreasing f A ↔ FunctionDecreasing (fun x => lam * f x) A) := by
  sorry

/--
`MonotoneNeedNotBeStrict` TODO

Predicate logic:

  ∃ A ∈ Set ℝ f ∈ ℝ → ℝ, FunctionIncreasing f A ∧ ¬ FunctionStrictlyIncreasing f A

Predicate logic (unfolded):

  Exists fun A => Exists fun f => (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f x) (f y)) → False)

Logical form (Lean):

```lean
theorem MonotoneNeedNotBeStrict :
    ∃ (A : Set ℝ) (f : ℝ → ℝ), FunctionIncreasing f A ∧
      ¬ FunctionStrictlyIncreasing f A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem MonotoneNeedNotBeStrict :
    ∃ (A : Set ℝ) (f : ℝ → ℝ), FunctionIncreasing f A ∧
      ¬ FunctionStrictlyIncreasing f A := by
  sorry

/--
`FunctionConstant` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Exists fun c => ∀ (x : Real), Set.instMembership.mem A x → f x = c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun c => ∀ (x : Real), Set.instMembership.1 A x → f x = c

Logical form (Lean):

```lean
def FunctionConstant (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ c : ℝ, ∀ x ∈ A, f x = c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FunctionConstant (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ c : ℝ, ∀ x ∈ A, f x = c

/--
`ConstantFunctionCharacterization` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionConstant f A ↔ (FunctionIncreasing f A ∧ FunctionDecreasing f A)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun c => ∀ (x : Real), Set.instMembership.1 A x → f x = c ↔ (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y) ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x))

Logical form (Lean):

```lean
theorem ConstantFunctionCharacterization (f : ℝ → ℝ) (A : Set ℝ) :
    FunctionConstant f A ↔ (FunctionIncreasing f A ∧ FunctionDecreasing f A)
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
theorem ConstantFunctionCharacterization (f : ℝ → ℝ) (A : Set ℝ) :
    FunctionConstant f A ↔ (FunctionIncreasing f A ∧ FunctionDecreasing f A) := by
  sorry

/--
`ConstantFunctionsAreBounded` TODO

Predicate logic:

  (ℝ → ℝ) → ∃ B > 0, ∀ x ∈ A, |f x| ≤ B

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun c => ∀ (x : Real), Set.instMembership.1 A x → f x = c) → Exists fun B => (Real.instLT.1 Zero.toOfNat0.1 B ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) B)

Logical form (Lean):

```lean
theorem ConstantFunctionsAreBounded (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : ∃ B > 0, ∀ x ∈ A, |f x| ≤ B
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
theorem ConstantFunctionsAreBounded (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : ∃ B > 0, ∀ x ∈ A, |f x| ≤ B := by
  sorry

/--
`ConstantFunctionsAreMonotone` TODO

Predicate logic:

  (ℝ → ℝ) → FunctionMonotone f A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (Exists fun c => ∀ (x : Real), Set.instMembership.1 A x → f x = c) → Or (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y)) (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x))

Logical form (Lean):

```lean
theorem ConstantFunctionsAreMonotone (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : FunctionMonotone f A
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
theorem ConstantFunctionsAreMonotone (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionConstant f A) : FunctionMonotone f A := by
  sorry

/--
`MonotoneFunctionAlgebra` TODO

Predicate logic:

  (FunctionIncreasing f A → FunctionIncreasing g A → FunctionIncreasing (fun x => f x + g x) A) ∧ (FunctionDecreasing f A → FunctionDecreasing g A → FunctionDecreasing (fun x => f x + g x) A) ∧ (FunctionIncreasing f A → FunctionIncreasing g A → (∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) → FunctionIncreasing (fun x => f x * g x) A) ∧ (FunctionDecreasing f A → FunctionDecreasing g A → (∀ x ∈ A, 0 ≤ f x) → (∀ x ∈ A, 0 ≤ g x) → FunctionDecreasing (fun x => f x * g x) A)

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y)) → (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g x) (g y)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => instHAdd.1 (f x) (g x)) x) ((fun x => instHAdd.1 (f x) (g x)) y) ∧ ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x)) → (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g y) (g x)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => instHAdd.1 (f x) (g x)) y) ((fun x => instHAdd.1 (f x) (g x)) x) ∧ ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y)) → (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g x) (g y)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 Zero.toOfNat0.1 (f x)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 Zero.toOfNat0.1 (g x)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => instHMul.1 (f x) (g x)) x) ((fun x => instHMul.1 (f x) (g x)) y) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x)) → (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g y) (g x)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 Zero.toOfNat0.1 (f x)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 Zero.toOfNat0.1 (g x)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 ((fun x => instHMul.1 (f x) (g x)) y) ((fun x => instHMul.1 (f x) (g x)) x))))

Logical form (Lean):

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

/--
`StrictlyMonotoneImpliesInjective` TODO

Predicate logic:

  (ℝ → ℝ) → ∀ x ∈ A, ∀ y ∈ A, f x = f y → x = y

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Or (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f x) (f y)) (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f y) (f x)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), (Set.instMembership.1 A y ∧ f x = f y) → x = y

Logical form (Lean):

```lean
theorem StrictlyMonotoneImpliesInjective (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A ∨ FunctionStrictlyDecreasing f A) :
    ∀ x ∈ A, ∀ y ∈ A, f x = f y → x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem StrictlyMonotoneImpliesInjective (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionStrictlyIncreasing f A ∨ FunctionStrictlyDecreasing f A) :
    ∀ x ∈ A, ∀ y ∈ A, f x = f y → x = y := by
  sorry

/--
`MonotonicityRestriction` TODO

Predicate logic:

  (ℝ → ℝ) → (FunctionIncreasing f A → FunctionIncreasing f S) ∧ (FunctionDecreasing f A → FunctionDecreasing f S) ∧ (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f S) ∧ (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f S)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (S A : Real → Prop), Set.instLE.1 S A → ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y)) → ∀ (x : Real), Set.instMembership.1 S x → ∀ (y : Real), Set.instMembership.1 S y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y) ∧ ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x)) → ∀ (x : Real), Set.instMembership.1 S x → ∀ (y : Real), Set.instMembership.1 S y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x) ∧ ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f x) (f y)) → ∀ (x : Real), Set.instMembership.1 S x → ∀ (y : Real), Set.instMembership.1 S y → Real.instLT.1 x y → Real.instLT.1 (f x) (f y) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f y) (f x)) → ∀ (x : Real), Set.instMembership.1 S x → ∀ (y : Real), Set.instMembership.1 S y → Real.instLT.1 x y → Real.instLT.1 (f y) (f x))))

Logical form (Lean):

```lean
theorem MonotonicityRestriction (f : ℝ → ℝ) (S A : Set ℝ) (hS : S ⊆ A) :
    (FunctionIncreasing f A → FunctionIncreasing f S) ∧
    (FunctionDecreasing f A → FunctionDecreasing f S) ∧
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f S) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f S)
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
theorem MonotonicityRestriction (f : ℝ → ℝ) (S A : Set ℝ) (hS : S ⊆ A) :
    (FunctionIncreasing f A → FunctionIncreasing f S) ∧
    (FunctionDecreasing f A → FunctionDecreasing f S) ∧
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f S) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f S) := by
  sorry

/--
`CompositionOfMonotoneFunctions` TODO

Predicate logic:

  (∀ x ∈ A, f x ∈ B) → (FunctionIncreasing f A → FunctionIncreasing g B → FunctionIncreasing (g ∘ f) A) ∧ (FunctionDecreasing f A → FunctionDecreasing g B → FunctionIncreasing (g ∘ f) A) ∧ (FunctionIncreasing f A → FunctionDecreasing g B → FunctionDecreasing (g ∘ f) A) ∧ (FunctionDecreasing f A → FunctionIncreasing g B → FunctionDecreasing (g ∘ f) A)

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A B : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → Set.instMembership.1 B (f x)) → ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y)) → (∀ (x : Real), Set.instMembership.1 B x → ∀ (y : Real), Set.instMembership.1 B y → Real.instLE.1 x y → Real.instLE.1 (g x) (g y)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g (f x)) (g (f y)) ∧ ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x)) → (∀ (x : Real), Set.instMembership.1 B x → ∀ (y : Real), Set.instMembership.1 B y → Real.instLE.1 x y → Real.instLE.1 (g y) (g x)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g (f x)) (g (f y)) ∧ ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f x) (f y)) → (∀ (x : Real), Set.instMembership.1 B x → ∀ (y : Real), Set.instMembership.1 B y → Real.instLE.1 x y → Real.instLE.1 (g y) (g x)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g (f y)) (g (f x)) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (f y) (f x)) → (∀ (x : Real), Set.instMembership.1 B x → ∀ (y : Real), Set.instMembership.1 B y → Real.instLE.1 x y → Real.instLE.1 (g x) (g y)) → ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 x y → Real.instLE.1 (g (f y)) (g (f x)))))

Logical form (Lean):

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

/--
`InverseOfStrictlyMonotoneBijectionIsStrictlyMonotone` TODO

Predicate logic:

  (∀ x ∈ A, f x ∈ B ∧ ∀ y ∈ B, ∃ x ∈ A, f x = y ∧ ∀ x ∈ A, f' (f x) = x ∧ ∀ y ∈ B, f (f' y) = y) → (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f' B) ∧ (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f' B)

Predicate logic (unfolded):

  ∀ (f f' : Real → Real) (A B : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → Set.instMembership.1 B (f x) ∧ (∀ (y : Real), Set.instMembership.1 B y → Exists fun x => (Set.instMembership.1 A x ∧ f x = y) ∧ (∀ (x : Real), Set.instMembership.1 A x → f' (f x) = x ∧ ∀ (y : Real), Set.instMembership.1 B y → f (f' y) = y))) → ((∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f x) (f y)) → ∀ (x : Real), Set.instMembership.1 B x → ∀ (y : Real), Set.instMembership.1 B y → Real.instLT.1 x y → Real.instLT.1 (f' x) (f' y) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 x y → Real.instLT.1 (f y) (f x)) → ∀ (x : Real), Set.instMembership.1 B x → ∀ (y : Real), Set.instMembership.1 B y → Real.instLT.1 x y → Real.instLT.1 (f' y) (f' x))

Logical form (Lean):

```lean
theorem InverseOfStrictlyMonotoneBijectionIsStrictlyMonotone
    (f f' : ℝ → ℝ) (A B : Set ℝ)
    (hmaps : ∀ x ∈ A, f x ∈ B) (hsurj : ∀ y ∈ B, ∃ x ∈ A, f x = y)
    (hleft : ∀ x ∈ A, f' (f x) = x) (hright : ∀ y ∈ B, f (f' y) = y) :
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f' B) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f' B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem InverseOfStrictlyMonotoneBijectionIsStrictlyMonotone
    (f f' : ℝ → ℝ) (A B : Set ℝ)
    (hmaps : ∀ x ∈ A, f x ∈ B) (hsurj : ∀ y ∈ B, ∃ x ∈ A, f x = y)
    (hleft : ∀ x ∈ A, f' (f x) = x) (hright : ∀ y ∈ B, f (f' y) = y) :
    (FunctionStrictlyIncreasing f A → FunctionStrictlyIncreasing f' B) ∧
    (FunctionStrictlyDecreasing f A → FunctionStrictlyDecreasing f' B) := by
  sorry

end LRA.Analysis.Functions
