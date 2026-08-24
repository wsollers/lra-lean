
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.NNReal

namespace LRA.Analysis.RealAnalysis

/--
`SquareNonnegative` TODO

Predicate logic:

  a ^ 2 ≥ 0

Predicate logic (unfolded):

  ∀ (a : Real), Real.instLE.1 Zero.toOfNat0.1 (instHPow.1 a (instOfNatNat 2).1)

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

  ∃! b : ℝ, b ≥ 0 ∧ b ^ 2 = a

Predicate logic (unfolded):

  ∀ (a : Real), Real.instLE.1 Zero.toOfNat0.1 a → Exists fun x => ((fun b => (Real.instLE.1 Zero.toOfNat0.1 b ∧ instHPow.1 b (instOfNatNat 2).1 = a)) x ∧ ∀ (y : Real), (Real.instLE.1 Zero.toOfNat0.1 y ∧ instHPow.1 y (instOfNatNat 2).1 = a) → y = x)

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

  Real.sqrt a ≥ 0

Predicate logic (unfolded):

  ∀ (a : Real), Real.instLE.1 Zero.toOfNat0.1 a → Real.instLE.1 Zero.toOfNat0.1 a.sqrt

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

  Real.sqrt a ^ 2 = a

Predicate logic (unfolded):

  ∀ (a : Real), Real.instLE.1 Zero.toOfNat0.1 a → instHPow.1 a.sqrt (instOfNatNat 2).1 = a

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

  Real.sqrt 0 = 0 ∧ Real.sqrt 1 = 1

Predicate logic (unfolded):

  (Zero.toOfNat0.1.sqrt = Zero.toOfNat0.1 ∧ One.toOfNat1.1.sqrt = One.toOfNat1.1)

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

  Real.sqrt a > 0

Predicate logic (unfolded):

  ∀ (a : Real), Real.instLT.1 Zero.toOfNat0.1 a → Real.instLT.1 Zero.toOfNat0.1 a.sqrt

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

  Real.sqrt (a ^ 2) = |a|

Predicate logic (unfolded):

  ∀ (a : Real), instHPow.1 a (instOfNatNat 2).1 = .sqrt (SemilatticeSup.toMax.1 a (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 a))

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

  Real.sqrt (a * b) = Real.sqrt a * Real.sqrt b

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLE.1 Zero.toOfNat0.1 a ∧ Real.instLE.1 Zero.toOfNat0.1 b) → instHMul.1 a b = .sqrt(instHMul.1 a.sqrt b.sqrt)

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

  Real.sqrt (a / b) = Real.sqrt a / Real.sqrt b

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLE.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 Zero.toOfNat0.1 b) → instHDiv.1 a b = .sqrt(instHDiv.1 a.sqrt b.sqrt)

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

  0 ≤ a ∧ a < b → Real.sqrt a < Real.sqrt b

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLE.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 a b) → Real.instLT.1 a.sqrt b.sqrt

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

  x ^ n > 0

Predicate logic (unfolded):

  ∀ (x : Real) (n : Nat), Real.instLT.1 Zero.toOfNat0.1 x → Real.instLT.1 Zero.toOfNat0.1 (instHPow.1 x n)

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

  0 < x ∧ x < y → x ^ n < y ^ n

Predicate logic (unfolded):

  ∀ (x y : Real) (n : Nat), (Real.instLT.1 Zero.toOfNat0.1 x ∧ Real.instLT.1 x y) → Real.instLT.1 (instHPow.1 x n) (instHPow.1 y n)

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

  0 ≤ a ∧ a < b → a ^ 2 < b ^ 2

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLE.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 a b) → Real.instLT.1 (instHPow.1 a (instOfNatNat 2).1) (instHPow.1 b (instOfNatNat 2).1)

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

  0 ≤ a ∧ a ≤ b → Real.sqrt a ≤ Real.sqrt b

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLE.1 Zero.toOfNat0.1 a ∧ Real.instLE.1 a b) → Real.instLE.1 a.sqrt b.sqrt

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

  (a ^ 2 < b ^ 2) → a < b

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 Zero.toOfNat0.1 a ∧ (Real.instLT.1 Zero.toOfNat0.1 b ∧ Real.instLT.1 (instHPow.1 a (instOfNatNat 2).1) (instHPow.1 b (instOfNatNat 2).1))) → Real.instLT.1 a b

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

  (0 < a ∧ a < 1 → a ^ 2 < a) ∧ (a > 1 → a ^ 2 > a)

Predicate logic (unfolded):

  ∀ (a : Real), ((Real.instLT.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 a One.toOfNat1.1) → Real.instLT.1 (instHPow.1 a (instOfNatNat 2).1) a ∧ Real.instLT.1 One.toOfNat1.1 a → Real.instLT.1 a (instHPow.1 a (instOfNatNat 2).1))

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
