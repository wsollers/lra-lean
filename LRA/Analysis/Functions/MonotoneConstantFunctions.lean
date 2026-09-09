
import Mathlib.Data.Real.Basic
import LRA.Analysis.Functions.AlgebraOfFunctions

namespace LRA.Analysis.Functions

/--
`FunctionIncreasing` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLE.le x y) → Real.instLE.le (f x) (f y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLE.le x y) → Real.instLE.le (f x) (f y)

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

  ∀ (f : Real → Real) (A : Set Real) (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLT.lt x y) → Real.instLT.lt (f x) (f y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLT.lt x y) → Real.instLT.lt (f x) (f y)

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionStrictlyIncreasing f A → LRA.Analysis.Functions.FunctionIncreasing f A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    h : FunctionStrictlyIncreasing f A
  Prove
    (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f x) (f y)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLE.le x y) → Real.instLE.le (f x) (f y)

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

  ∀ (f : Real → Real) (A : Set Real) (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLE.le x y) → Real.instLE.le (f y) (f x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLE.le x y) → Real.instLE.le (f y) (f x)

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

  ∀ (f : Real → Real) (A : Set Real) (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLT.lt x y) → Real.instLT.lt (f y) (f x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLT.lt x y) → Real.instLT.lt (f y) (f x)

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionStrictlyDecreasing f A → LRA.Analysis.Functions.FunctionDecreasing f A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    h : FunctionStrictlyDecreasing f A
  Prove
    (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f y) (f x)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ Real.instLE.le x y) → Real.instLE.le (f y) (f x)

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f y) (f x))

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

  ∀ (f : Real → Real) (A : Set Real), ((LRA.Analysis.Functions.FunctionIncreasing f A ↔ LRA.Analysis.Functions.FunctionDecreasing (fun x => Real.instNeg.neg (f x)) A) ∧ (LRA.Analysis.Functions.FunctionDecreasing f A ↔ LRA.Analysis.Functions.FunctionIncreasing (fun x => Real.instNeg.neg (f x)) A))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
  Prove
    ((LRA.Analysis.Functions.FunctionIncreasing f A ↔ LRA.Analysis.Functions.FunctionDecreasing (fun x => Real.instNeg.neg (f x)) A) ∧ (LRA.Analysis.Functions.FunctionDecreasing f A ↔ LRA.Analysis.Functions.FunctionIncreasing (fun x => Real.instNeg.neg (f x)) A))

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

  ∀ (f : Real → Real) (A : Set Real) (lam : Real), Real.instLT.lt 0 lam → ((LRA.Analysis.Functions.FunctionIncreasing f A ↔ LRA.Analysis.Functions.FunctionIncreasing (fun x => instHMul.hMul lam (f x)) A) ∧ (LRA.Analysis.Functions.FunctionDecreasing f A ↔ LRA.Analysis.Functions.FunctionDecreasing (fun x => instHMul.hMul lam (f x)) A))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    lam : ℝ
  Prove
    Real.instLT.lt 0 lam → ((LRA.Analysis.Functions.FunctionIncreasing f A ↔ LRA.Analysis.Functions.FunctionIncreasing (fun x => instHMul.hMul lam (f x)) A) ∧ (LRA.Analysis.Functions.FunctionDecreasing f A ↔ LRA.Analysis.Functions.FunctionDecreasing (fun x => instHMul.hMul lam (f x)) A))

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

  Exists fun A => Exists fun f => (LRA.Analysis.Functions.FunctionIncreasing f A ∧ ¬ LRA.Analysis.Functions.FunctionStrictlyIncreasing f A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => Exists fun f => ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f x) (f y)) → False))

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

  ∀ (f : Real → Real) (A : Set Real), Exists fun c => ∀ (x : Real), x ∈ A → f x = c

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun c => ∀ (x : Real), x ∈ A → f x = c

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionConstant f A ↔ (LRA.Analysis.Functions.FunctionIncreasing f A ∧ LRA.Analysis.Functions.FunctionDecreasing f A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
  Prove
    LRA.Analysis.Functions.FunctionConstant f A ↔ (LRA.Analysis.Functions.FunctionIncreasing f A ∧ LRA.Analysis.Functions.FunctionDecreasing f A)

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionConstant f A → Exists fun B => (GT.gt B 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    h : FunctionConstant f A
  Prove
    (Exists fun c => ∀ (x : Real), x ∈ A → f x = c) → Exists fun B => (Real.instLT.lt 0 B ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) B))

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

  ∀ (f : Real → Real) (A : Set Real), LRA.Analysis.Functions.FunctionConstant f A → LRA.Analysis.Functions.FunctionMonotone f A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    h : FunctionConstant f A
  Prove
    (Exists fun c => ∀ (x : Real), x ∈ A → f x = c) → Or (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f y) (f x))

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

  ∀ (f g : Real → Real) (A : Set Real), ((LRA.Analysis.Functions.FunctionIncreasing f A → LRA.Analysis.Functions.FunctionIncreasing g A → LRA.Analysis.Functions.FunctionIncreasing (fun x => instHAdd.hAdd (f x) (g x)) A) ∧ ((LRA.Analysis.Functions.FunctionDecreasing f A → LRA.Analysis.Functions.FunctionDecreasing g A → LRA.Analysis.Functions.FunctionDecreasing (fun x => instHAdd.hAdd (f x) (g x)) A) ∧ ((LRA.Analysis.Functions.FunctionIncreasing f A → LRA.Analysis.Functions.FunctionIncreasing g A → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (f x)) → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (g x)) → LRA.Analysis.Functions.FunctionIncreasing (fun x => instHMul.hMul (f x) (g x)) A) ∧ (LRA.Analysis.Functions.FunctionDecreasing f A → LRA.Analysis.Functions.FunctionDecreasing g A → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (f x)) → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (g x)) → LRA.Analysis.Functions.FunctionDecreasing (fun x => instHMul.hMul (f x) (g x)) A))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
  Prove
    ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) → (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g x) (g y)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x) ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) y) ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f y) (f x)) → (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g y) (g x)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) y) ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x) ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) → (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g x) (g y)) → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (f x)) → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (g x)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) y) ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f y) (f x)) → (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g y) (g x)) → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (f x)) → (∀ (x : Real), x ∈ A → Real.instLE.le 0 (g x)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) y) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x))))

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

  ∀ (f : Real → Real) (A : Set Real), Or (LRA.Analysis.Functions.FunctionStrictlyIncreasing f A) (LRA.Analysis.Functions.FunctionStrictlyDecreasing f A) → ∀ (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ f x = f y) → x = y

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    h : FunctionStrictlyIncreasing f A ∨ FunctionStrictlyDecreasing f A
  Prove
    Or (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f x) (f y)) (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f y) (f x)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), (y ∈ A ∧ f x = f y) → x = y

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

  ∀ (f : Real → Real) (S A : Set Real), Set.instLE.le S A → ((LRA.Analysis.Functions.FunctionIncreasing f A → LRA.Analysis.Functions.FunctionIncreasing f S) ∧ ((LRA.Analysis.Functions.FunctionDecreasing f A → LRA.Analysis.Functions.FunctionDecreasing f S) ∧ ((LRA.Analysis.Functions.FunctionStrictlyIncreasing f A → LRA.Analysis.Functions.FunctionStrictlyIncreasing f S) ∧ (LRA.Analysis.Functions.FunctionStrictlyDecreasing f A → LRA.Analysis.Functions.FunctionStrictlyDecreasing f S))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    S A : Set ℝ
    hS : S ⊆ A
  Prove
    { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le S A → ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) → ∀ (x : Real), x ∈ S → ∀ (y : Real), y ∈ S → Real.instLE.le x y → Real.instLE.le (f x) (f y) ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f y) (f x)) → ∀ (x : Real), x ∈ S → ∀ (y : Real), y ∈ S → Real.instLE.le x y → Real.instLE.le (f y) (f x) ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f x) (f y)) → ∀ (x : Real), x ∈ S → ∀ (y : Real), y ∈ S → Real.instLT.lt x y → Real.instLT.lt (f x) (f y) ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f y) (f x)) → ∀ (x : Real), x ∈ S → ∀ (y : Real), y ∈ S → Real.instLT.lt x y → Real.instLT.lt (f y) (f x))))

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

  ∀ (f g : Real → Real) (A B : Set Real), (∀ (x : Real), x ∈ A → f x ∈ B) → ((LRA.Analysis.Functions.FunctionIncreasing f A → LRA.Analysis.Functions.FunctionIncreasing g B → LRA.Analysis.Functions.FunctionIncreasing (Function.comp g f) A) ∧ ((LRA.Analysis.Functions.FunctionDecreasing f A → LRA.Analysis.Functions.FunctionDecreasing g B → LRA.Analysis.Functions.FunctionIncreasing (Function.comp g f) A) ∧ ((LRA.Analysis.Functions.FunctionIncreasing f A → LRA.Analysis.Functions.FunctionDecreasing g B → LRA.Analysis.Functions.FunctionDecreasing (Function.comp g f) A) ∧ (LRA.Analysis.Functions.FunctionDecreasing f A → LRA.Analysis.Functions.FunctionIncreasing g B → LRA.Analysis.Functions.FunctionDecreasing (Function.comp g f) A))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A B : Set ℝ
  Prove
    (∀ (x : Real), x ∈ A → f x ∈ B) → ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) → (∀ (x : Real), x ∈ B → ∀ (y : Real), y ∈ B → Real.instLE.le x y → Real.instLE.le (g x) (g y)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g (f x)) (g (f y)) ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f y) (f x)) → (∀ (x : Real), x ∈ B → ∀ (y : Real), y ∈ B → Real.instLE.le x y → Real.instLE.le (g y) (g x)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g (f x)) (g (f y)) ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f x) (f y)) → (∀ (x : Real), x ∈ B → ∀ (y : Real), y ∈ B → Real.instLE.le x y → Real.instLE.le (g y) (g x)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g (f y)) (g (f x)) ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (f y) (f x)) → (∀ (x : Real), x ∈ B → ∀ (y : Real), y ∈ B → Real.instLE.le x y → Real.instLE.le (g x) (g y)) → ∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le x y → Real.instLE.le (g (f y)) (g (f x)))))

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

  ∀ (f f' : Real → Real) (A B : Set Real), ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ ((∀ (y : Real), y ∈ B → Exists fun x => (x ∈ A ∧ f x = y)) ∧ ((∀ (x : Real), x ∈ A → f' (f x) = x) ∧ (∀ (y : Real), y ∈ B → f (f' y) = y)))) → ((LRA.Analysis.Functions.FunctionStrictlyIncreasing f A → LRA.Analysis.Functions.FunctionStrictlyIncreasing f' B) ∧ (LRA.Analysis.Functions.FunctionStrictlyDecreasing f A → LRA.Analysis.Functions.FunctionStrictlyDecreasing f' B))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f f' : ℝ → ℝ
    A B : Set ℝ
  Prove
    ((∀ (x : Real), x ∈ A → f x ∈ B) ∧ ((∀ (y : Real), y ∈ B → Exists fun x => (x ∈ A ∧ f x = y)) ∧ ((∀ (x : Real), x ∈ A → f' (f x) = x) ∧ (∀ (y : Real), y ∈ B → f (f' y) = y)))) → ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f x) (f y)) → ∀ (x : Real), x ∈ B → ∀ (y : Real), y ∈ B → Real.instLT.lt x y → Real.instLT.lt (f' x) (f' y) ∧ (∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLT.lt x y → Real.instLT.lt (f y) (f x)) → ∀ (x : Real), x ∈ B → ∀ (y : Real), y ∈ B → Real.instLT.lt x y → Real.instLT.lt (f' y) (f' x))

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
