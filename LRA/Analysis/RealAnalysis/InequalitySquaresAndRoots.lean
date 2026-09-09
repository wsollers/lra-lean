
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.NNReal

namespace LRA.Analysis.RealAnalysis

/--
`SquareNonnegative` TODO

Predicate logic:

  ∀ (a : Real), GE.ge (instHPow.hPow a 2) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    Real.instLE.le 0 (instHPow.1 a 2)

Logical form (Lean):

```lean
theorem SquareNonnegative (a : ℝ) : a ^ 2 ≥ 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SquareNonnegative (a : ℝ) : a ^ 2 ≥ 0 := by
  sorry
/--
`RealSquareRootFunction` TODO

Predicate logic:

  ∀ (a : Real), GE.ge a 0 → ExistsUnique fun b => (GE.ge b 0 ∧ instHPow.hPow b 2 = a)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
    ha : a ≥ 0
  Prove
    Real.instLE.le 0 a → Exists fun x => (((fun b => (Real.instLE.le 0 b ∧ instHPow.1 b 2 = a)) x) ∧ (∀ (y : Real), (Real.instLE.le 0 y ∧ instHPow.1 y 2 = a) → y = x))

Logical form (Lean):

```lean
theorem RealSquareRootFunction (a : ℝ) (ha : a ≥ 0) :
    ∃! b : ℝ, b ≥ 0 ∧ b ^ 2 = a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem RealSquareRootFunction (a : ℝ) (ha : a ≥ 0) :
    ∃! b : ℝ, b ≥ 0 ∧ b ^ 2 = a := by
  sorry
/--
`SqrtNonnegative` TODO

Predicate logic:

  ∀ (a : Real), GE.ge a 0 → GE.ge a.sqrt 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
    ha : a ≥ 0
  Prove
    Real.instLE.le 0 a → Real.instLE.le 0 a.sqrt

Logical form (Lean):

```lean
theorem SqrtNonnegative (a : ℝ) (ha : a ≥ 0) : Real.sqrt a ≥ 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SqrtNonnegative (a : ℝ) (ha : a ≥ 0) : Real.sqrt a ≥ 0 := by
  sorry
/--
`SqrtSquare` TODO

Predicate logic:

  ∀ (a : Real), GE.ge a 0 → instHPow.hPow a.sqrt 2 = a

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
    ha : a ≥ 0
  Prove
    Real.instLE.le 0 a → instHPow.1 a.sqrt 2 = a

Logical form (Lean):

```lean
theorem SqrtSquare (a : ℝ) (ha : a ≥ 0) : Real.sqrt a ^ 2 = a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SqrtSquare (a : ℝ) (ha : a ≥ 0) : Real.sqrt a ^ 2 = a := by
  sorry
/--
`SqrtZeroOne` TODO

Predicate logic:

  (Real.sqrt 0 = 0 ∧ Real.sqrt 1 = 1)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.sqrt 0 = 0 ∧ Real.sqrt 1 = 1)

Logical form (Lean):

```lean
theorem SqrtZeroOne : Real.sqrt 0 = 0 ∧ Real.sqrt 1 = 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem SqrtZeroOne : Real.sqrt 0 = 0 ∧ Real.sqrt 1 = 1 := by
  sorry
/--
`SqrtPositive` TODO

Predicate logic:

  ∀ (a : Real), GT.gt a 0 → GT.gt a.sqrt 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
    ha : a > 0
  Prove
    Real.instLT.lt 0 a → Real.instLT.lt 0 a.sqrt

Logical form (Lean):

```lean
theorem SqrtPositive (a : ℝ) (ha : a > 0) : Real.sqrt a > 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SqrtPositive (a : ℝ) (ha : a > 0) : Real.sqrt a > 0 := by
  sorry
/--
`SqrtOfSquareAbsoluteValue` TODO

Predicate logic:

  ∀ (a : Real), instHPow.hPow a 2 = .sqrt(abs a)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    instHPow.1 a 2 = .sqrt(abs a)

Logical form (Lean):

```lean
theorem SqrtOfSquareAbsoluteValue (a : ℝ) : Real.sqrt (a ^ 2) = |a|
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SqrtOfSquareAbsoluteValue (a : ℝ) : Real.sqrt (a ^ 2) = |a| := by
  sorry
/--
`SqrtProduct` TODO

Predicate logic:

  ∀ (a b : Real), (GE.ge a 0 ∧ GE.ge b 0) → instHMul.hMul a b = .sqrt(instHMul.hMul a.sqrt b.sqrt)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    ha : a ≥ 0
    hb : b ≥ 0
  Prove
    (Real.instLE.le 0 a ∧ Real.instLE.le 0 b) → { hMul := fun a b => Real.instMul.mul a b }.hMul a b = .sqrt ({ hMul := fun a b => Real.instMul.mul a b }.hMul a.sqrt b.sqrt)

Logical form (Lean):

```lean
theorem SqrtProduct (a b : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) :
    Real.sqrt (a * b) = Real.sqrt a * Real.sqrt b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SqrtProduct (a b : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) :
    Real.sqrt (a * b) = Real.sqrt a * Real.sqrt b := by
  sorry
/--
`SqrtQuotient` TODO

Predicate logic:

  ∀ (a b : Real), (GE.ge a 0 ∧ GT.gt b 0) → instHDiv.hDiv a b = .sqrt(instHDiv.hDiv a.sqrt b.sqrt)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    ha : a ≥ 0
    hb : b > 0
  Prove
    (Real.instLE.le 0 a ∧ Real.instLT.lt 0 b) → { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv a b = .sqrt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv a.sqrt b.sqrt)

Logical form (Lean):

```lean
theorem SqrtQuotient (a b : ℝ) (ha : a ≥ 0) (hb : b > 0) :
    Real.sqrt (a / b) = Real.sqrt a / Real.sqrt b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SqrtQuotient (a b : ℝ) (ha : a ≥ 0) (hb : b > 0) :
    Real.sqrt (a / b) = Real.sqrt a / Real.sqrt b := by
  sorry
/--
`IneqSquareRootStrictMonotone` TODO

Predicate logic:

  ∀ (a b : Real), (Real.instLE.le 0 a ∧ Real.instLT.lt a b) → Real.instLT.lt a.sqrt b.sqrt

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLE.le 0 a ∧ Real.instLT.lt a b) → Real.instLT.lt a.sqrt b.sqrt

Logical form (Lean):

```lean
theorem IneqSquareRootStrictMonotone (a b : ℝ) :
    0 ≤ a ∧ a < b → Real.sqrt a < Real.sqrt b
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
theorem IneqSquareRootStrictMonotone (a b : ℝ) :
    0 ≤ a ∧ a < b → Real.sqrt a < Real.sqrt b := by
  sorry
/--
`PositivePowersArePositive` TODO

Predicate logic:

  ∀ (x : Real) (n : Nat), GT.gt x 0 → GT.gt (instHPow.hPow x n) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : ℝ
    n : ℕ
    hx : x > 0
  Prove
    Real.instLT.lt 0 x → Real.instLT.lt 0 (instHPow.1 x n)

Logical form (Lean):

```lean
theorem PositivePowersArePositive (x : ℝ) (n : ℕ) (hx : x > 0) : x ^ n > 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem PositivePowersArePositive (x : ℝ) (n : ℕ) (hx : x > 0) : x ^ n > 0 := by
  sorry
/--
`PowersPreserveOrderForPositiveNumbers` TODO

Predicate logic:

  ∀ (x y : Real) (n : Nat), (Real.instLT.lt 0 x ∧ Real.instLT.lt x y) → Real.instLT.lt (instHPow.hPow x n) (instHPow.hPow y n)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : ℝ
    n : ℕ
  Prove
    (Real.instLT.lt 0 x ∧ Real.instLT.lt x y) → Real.instLT.lt (instHPow.1 x n) (instHPow.1 y n)

Logical form (Lean):

```lean
theorem PowersPreserveOrderForPositiveNumbers (x y : ℝ) (n : ℕ) :
    0 < x ∧ x < y → x ^ n < y ^ n
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
theorem PowersPreserveOrderForPositiveNumbers (x y : ℝ) (n : ℕ) :
    0 < x ∧ x < y → x ^ n < y ^ n := by
  sorry
/--
`IneqSquareMonotone` TODO

Predicate logic:

  ∀ (a b : Real), (Real.instLE.le 0 a ∧ Real.instLT.lt a b) → Real.instLT.lt (instHPow.hPow a 2) (instHPow.hPow b 2)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLE.le 0 a ∧ Real.instLT.lt a b) → Real.instLT.lt (instHPow.1 a 2) (instHPow.1 b 2)

Logical form (Lean):

```lean
theorem IneqSquareMonotone (a b : ℝ) : 0 ≤ a ∧ a < b → a ^ 2 < b ^ 2
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
theorem IneqSquareMonotone (a b : ℝ) : 0 ≤ a ∧ a < b → a ^ 2 < b ^ 2 := by
  sorry
/--
`IneqSquareRootMonotone` TODO

Predicate logic:

  ∀ (a b : Real), (Real.instLE.le 0 a ∧ Real.instLE.le a b) → Real.instLE.le a.sqrt b.sqrt

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLE.le 0 a ∧ Real.instLE.le a b) → Real.instLE.le a.sqrt b.sqrt

Logical form (Lean):

```lean
theorem IneqSquareRootMonotone (a b : ℝ) :
    0 ≤ a ∧ a ≤ b → Real.sqrt a ≤ Real.sqrt b
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
theorem IneqSquareRootMonotone (a b : ℝ) :
    0 ≤ a ∧ a ≤ b → Real.sqrt a ≤ Real.sqrt b := by
  sorry
/--
`PositiveSquareComparison` TODO

Predicate logic:

  ∀ (a b : Real), (GT.gt a 0 ∧ (GT.gt b 0 ∧ Real.instLT.lt (instHPow.hPow a 2) (instHPow.hPow b 2))) → Real.instLT.lt a b

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    ha : a > 0
    hb : b > 0
  Prove
    (Real.instLT.lt 0 a ∧ (Real.instLT.lt 0 b ∧ Real.instLT.lt (instHPow.1 a 2) (instHPow.1 b 2))) → Real.instLT.lt a b

Logical form (Lean):

```lean
theorem PositiveSquareComparison (a b : ℝ) (ha : a > 0) (hb : b > 0)
    (h : a ^ 2 < b ^ 2) : a < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem PositiveSquareComparison (a b : ℝ) (ha : a > 0) (hb : b > 0)
    (h : a ^ 2 < b ^ 2) : a < b := by
  sorry
/--
`UnitIntervalSquareBounds` TODO

Predicate logic:

  ∀ (a : Real), (((Real.instLT.lt 0 a ∧ Real.instLT.lt a 1) → Real.instLT.lt (instHPow.hPow a 2) a) ∧ (GT.gt a 1 → GT.gt (instHPow.hPow a 2) a))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    (((Real.instLT.lt 0 a ∧ Real.instLT.lt a 1) → Real.instLT.lt (instHPow.1 a 2) a) ∧ (Real.instLT.lt 1 a → Real.instLT.lt a (instHPow.1 a 2)))

Logical form (Lean):

```lean
theorem UnitIntervalSquareBounds (a : ℝ) :
    (0 < a ∧ a < 1 → a ^ 2 < a) ∧ (a > 1 → a ^ 2 > a)
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
theorem UnitIntervalSquareBounds (a : ℝ) :
    (0 < a ∧ a < 1 → a ^ 2 < a) ∧ (a > 1 → a ^ 2 > a) := by
  sorry
end LRA.Analysis.RealAnalysis
