
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

/--
`RealOrderTrichotomy` TODO

Predicate logic:

  (a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨ (a > b ∧ a ≠ b ∧ ¬ a < b)

Predicate logic (unfolded):

  ∀ (a b : Real), Or ((Real.instLT.1 a b ∧ (a = b → False ∧ Real.instLT.1 b a → False))) (Or ((a = b ∧ (Real.instLT.1 a b → False ∧ Real.instLT.1 b a → False))) ((Real.instLT.1 b a ∧ (a = b → False ∧ Real.instLT.1 a b → False))))

Logical form (Lean):

```lean
theorem RealOrderTrichotomy (a b : ℝ) :
    (a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨
    (a > b ∧ a ≠ b ∧ ¬ a < b)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr

-/
theorem RealOrderTrichotomy (a b : ℝ) :
    (a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨
    (a > b ∧ a ≠ b ∧ ¬ a < b) := by
  sorry
/--
`IneqAddBothSides` TODO

Predicate logic:

  a < b → a + c < b + c

Predicate logic (unfolded):

  ∀ (a b c : Real), Real.instLT.1 a b → Real.instLT.1 (instHAdd.1 a c) (instHAdd.1 b c)

Logical form (Lean):

```lean
theorem IneqAddBothSides (a b c : ℝ) : a < b → a + c < b + c
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
theorem IneqAddBothSides (a b c : ℝ) : a < b → a + c < b + c := by
  sorry
/--
`IneqNonstrictAddBothSides` TODO

Predicate logic:

  a ≤ b → a + c ≤ b + c

Predicate logic (unfolded):

  ∀ (a b c : Real), Real.instLE.1 a b → Real.instLE.1 (instHAdd.1 a c) (instHAdd.1 b c)

Logical form (Lean):

```lean
theorem IneqNonstrictAddBothSides (a b c : ℝ) : a ≤ b → a + c ≤ b + c
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
theorem IneqNonstrictAddBothSides (a b c : ℝ) : a ≤ b → a + c ≤ b + c := by
  sorry
/--
`IneqAddInequalities` TODO

Predicate logic:

  a < b ∧ c < d → a + c < b + d

Predicate logic (unfolded):

  ∀ (a b c d : Real), (Real.instLT.1 a b ∧ Real.instLT.1 c d) → Real.instLT.1 (instHAdd.1 a c) (instHAdd.1 b d)

Logical form (Lean):

```lean
theorem IneqAddInequalities (a b c d : ℝ) :
    a < b ∧ c < d → a + c < b + d
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
theorem IneqAddInequalities (a b c d : ℝ) :
    a < b ∧ c < d → a + c < b + d := by
  sorry
/--
`IneqNonstrictAddInequalities` TODO

Predicate logic:

  a ≤ b ∧ c ≤ d → a + c ≤ b + d

Predicate logic (unfolded):

  ∀ (a b c d : Real), (Real.instLE.1 a b ∧ Real.instLE.1 c d) → Real.instLE.1 (instHAdd.1 a c) (instHAdd.1 b d)

Logical form (Lean):

```lean
theorem IneqNonstrictAddInequalities (a b c d : ℝ) :
    a ≤ b ∧ c ≤ d → a + c ≤ b + d
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
theorem IneqNonstrictAddInequalities (a b c d : ℝ) :
    a ≤ b ∧ c ≤ d → a + c ≤ b + d := by
  sorry
/--
`PositiveSum` TODO

Predicate logic:

  a > 0 → b > 0 → a + b > 0

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 Zero.toOfNat0.1 b) → Real.instLT.1 Zero.toOfNat0.1 (instHAdd.1 a b)

Logical form (Lean):

```lean
theorem PositiveSum (a b : ℝ) : a > 0 → b > 0 → a + b > 0
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
theorem PositiveSum (a b : ℝ) : a > 0 → b > 0 → a + b > 0 := by
  sorry
/--
`SubtractionOfInequalitiesNotValid` TODO

Predicate logic:

  ∃ a b c d ∈ ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b)

Predicate logic (unfolded):

  Exists fun a => Exists fun b => Exists fun c => Exists fun d => (Real.instLT.1 b a ∧ (Real.instLT.1 d c ∧ (Real.instLT.1 (instHSub.1 b d) (instHSub.1 a c) → False ∧ Real.instLT.1 (instHSub.1 d b) (instHSub.1 c a) → False)))

Logical form (Lean):

```lean
theorem SubtractionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b)
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
theorem SubtractionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b) := by
  sorry
/--
`IneqMixedAdd` TODO

Predicate logic:

  a ≤ b ∧ c < d → a + c < b + d

Predicate logic (unfolded):

  ∀ (a b c d : Real), (Real.instLE.1 a b ∧ Real.instLT.1 c d) → Real.instLT.1 (instHAdd.1 a c) (instHAdd.1 b d)

Logical form (Lean):

```lean
theorem IneqMixedAdd (a b c d : ℝ) : a ≤ b ∧ c < d → a + c < b + d
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
theorem IneqMixedAdd (a b c d : ℝ) : a ≤ b ∧ c < d → a + c < b + d := by
  sorry
/--
`IneqMultiplyPositive` TODO

Predicate logic:

  a < b ∧ 0 < c → a * c < b * c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLT.1 a b ∧ Real.instLT.1 Zero.toOfNat0.1 c) → Real.instLT.1 (instHMul.1 a c) (instHMul.1 b c)

Logical form (Lean):

```lean
theorem IneqMultiplyPositive (a b c : ℝ) : a < b ∧ 0 < c → a * c < b * c
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
theorem IneqMultiplyPositive (a b c : ℝ) : a < b ∧ 0 < c → a * c < b * c := by
  sorry
/--
`IneqMultiplyNegative` TODO

Predicate logic:

  a < b ∧ c < 0 → a * c > b * c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLT.1 a b ∧ Real.instLT.1 c Zero.toOfNat0.1) → Real.instLT.1 (instHMul.1 b c) (instHMul.1 a c)

Logical form (Lean):

```lean
theorem IneqMultiplyNegative (a b c : ℝ) : a < b ∧ c < 0 → a * c > b * c
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
theorem IneqMultiplyNegative (a b c : ℝ) : a < b ∧ c < 0 → a * c > b * c := by
  sorry
/--
`IneqNonstrictMultiplyPositive` TODO

Predicate logic:

  a ≤ b ∧ 0 < c → a * c ≤ b * c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLE.1 a b ∧ Real.instLT.1 Zero.toOfNat0.1 c) → Real.instLE.1 (instHMul.1 a c) (instHMul.1 b c)

Logical form (Lean):

```lean
theorem IneqNonstrictMultiplyPositive (a b c : ℝ) :
    a ≤ b ∧ 0 < c → a * c ≤ b * c
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
theorem IneqNonstrictMultiplyPositive (a b c : ℝ) :
    a ≤ b ∧ 0 < c → a * c ≤ b * c := by
  sorry
/--
`IneqNonstrictMultiplyNonneg` TODO

Predicate logic:

  a ≤ b ∧ 0 ≤ c → a * c ≤ b * c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLE.1 a b ∧ Real.instLE.1 Zero.toOfNat0.1 c) → Real.instLE.1 (instHMul.1 a c) (instHMul.1 b c)

Logical form (Lean):

```lean
theorem IneqNonstrictMultiplyNonneg (a b c : ℝ) :
    a ≤ b ∧ 0 ≤ c → a * c ≤ b * c
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
theorem IneqNonstrictMultiplyNonneg (a b c : ℝ) :
    a ≤ b ∧ 0 ≤ c → a * c ≤ b * c := by
  sorry
/--
`PositiveProduct` TODO

Predicate logic:

  a > 0 → b > 0 → a * b > 0

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 Zero.toOfNat0.1 b) → Real.instLT.1 Zero.toOfNat0.1 (instHMul.1 a b)

Logical form (Lean):

```lean
theorem PositiveProduct (a b : ℝ) : a > 0 → b > 0 → a * b > 0
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
theorem PositiveProduct (a b : ℝ) : a > 0 → b > 0 → a * b > 0 := by
  sorry
/--
`NegativeTimesNegativeIsPositive` TODO

Predicate logic:

  a < 0 → b < 0 → a * b > 0

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 a Zero.toOfNat0.1 ∧ Real.instLT.1 b Zero.toOfNat0.1) → Real.instLT.1 Zero.toOfNat0.1 (instHMul.1 a b)

Logical form (Lean):

```lean
theorem NegativeTimesNegativeIsPositive (a b : ℝ) :
    a < 0 → b < 0 → a * b > 0
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
theorem NegativeTimesNegativeIsPositive (a b : ℝ) :
    a < 0 → b < 0 → a * b > 0 := by
  sorry
/--
`PositiveTimesNegativeIsNegative` TODO

Predicate logic:

  a > 0 → b < 0 → a * b < 0

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 b Zero.toOfNat0.1) → Real.instLT.1 (instHMul.1 a b) Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem PositiveTimesNegativeIsNegative (a b : ℝ) :
    a > 0 → b < 0 → a * b < 0
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
theorem PositiveTimesNegativeIsNegative (a b : ℝ) :
    a > 0 → b < 0 → a * b < 0 := by
  sorry
/--
`NegativeTimesPositiveIsNegative` TODO

Predicate logic:

  a < 0 → b > 0 → a * b < 0

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 a Zero.toOfNat0.1 ∧ Real.instLT.1 Zero.toOfNat0.1 b) → Real.instLT.1 (instHMul.1 a b) Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem NegativeTimesPositiveIsNegative (a b : ℝ) :
    a < 0 → b > 0 → a * b < 0
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
theorem NegativeTimesPositiveIsNegative (a b : ℝ) :
    a < 0 → b > 0 → a * b < 0 := by
  sorry
/--
`OrderAndSubtraction` TODO

Predicate logic:

  a < b ↔ b - a > 0

Predicate logic (unfolded):

  ∀ (a b : Real), Real.instLT.1 a b ↔ Real.instLT.1 Zero.toOfNat0.1 (instHSub.1 b a)

Logical form (Lean):

```lean
theorem OrderAndSubtraction (a b : ℝ) : a < b ↔ b - a > 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem OrderAndSubtraction (a b : ℝ) : a < b ↔ b - a > 0 := by
  sorry
/--
`NonStrictOrderAndSubtraction` TODO

Predicate logic:

  a ≤ b ↔ b - a ≥ 0

Predicate logic (unfolded):

  ∀ (a b : Real), Real.instLE.1 a b ↔ Real.instLE.1 Zero.toOfNat0.1 (instHSub.1 b a)

Logical form (Lean):

```lean
theorem NonStrictOrderAndSubtraction (a b : ℝ) : a ≤ b ↔ b - a ≥ 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem NonStrictOrderAndSubtraction (a b : ℝ) : a ≤ b ↔ b - a ≥ 0 := by
  sorry
/--
`DivisionByPositivePreservesOrder` TODO

Predicate logic:

  a < b → c > 0 → a / c < b / c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLT.1 a b ∧ Real.instLT.1 Zero.toOfNat0.1 c) → Real.instLT.1 (instHDiv.1 a c) (instHDiv.1 b c)

Logical form (Lean):

```lean
theorem DivisionByPositivePreservesOrder (a b c : ℝ) :
    a < b → c > 0 → a / c < b / c
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
theorem DivisionByPositivePreservesOrder (a b c : ℝ) :
    a < b → c > 0 → a / c < b / c := by
  sorry
/--
`DivisionByNegativeReversesOrder` TODO

Predicate logic:

  a < b → c < 0 → b / c < a / c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLT.1 a b ∧ Real.instLT.1 c Zero.toOfNat0.1) → Real.instLT.1 (instHDiv.1 b c) (instHDiv.1 a c)

Logical form (Lean):

```lean
theorem DivisionByNegativeReversesOrder (a b c : ℝ) :
    a < b → c < 0 → b / c < a / c
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
theorem DivisionByNegativeReversesOrder (a b c : ℝ) :
    a < b → c < 0 → b / c < a / c := by
  sorry
/--
`PositiveMultiplicationCancellation` TODO

Predicate logic:

  c > 0 → a * c < b * c → a < b

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLT.1 Zero.toOfNat0.1 c ∧ Real.instLT.1 (instHMul.1 a c) (instHMul.1 b c)) → Real.instLT.1 a b

Logical form (Lean):

```lean
theorem PositiveMultiplicationCancellation (a b c : ℝ) :
    c > 0 → a * c < b * c → a < b
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
theorem PositiveMultiplicationCancellation (a b c : ℝ) :
    c > 0 → a * c < b * c → a < b := by
  sorry
/--
`DivisionOfInequalitiesNotValid` TODO

Predicate logic:

  ∃ a b c d ∈ ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧ ¬ (a / c > b / d) ∧ ¬ (c / a > d / b)

Predicate logic (unfolded):

  Exists fun a => Exists fun b => Exists fun c => Exists fun d => (a = Zero.toOfNat0.1 → False ∧ (b = Zero.toOfNat0.1 → False ∧ (c = Zero.toOfNat0.1 → False ∧ (d = Zero.toOfNat0.1 → False ∧ (Real.instLT.1 b a ∧ (Real.instLT.1 d c ∧ (Real.instLT.1 (instHDiv.1 b d) (instHDiv.1 a c) → False ∧ Real.instLT.1 (instHDiv.1 d b) (instHDiv.1 c a) → False)))))))

Logical form (Lean):

```lean
theorem DivisionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧
      ¬ (a / c > b / d) ∧ ¬ (c / a > d / b)
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
theorem DivisionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧
      ¬ (a / c > b / d) ∧ ¬ (c / a > d / b) := by
  sorry
/--
`IneqSqueeze` TODO

Predicate logic:

  a ≤ b ∧ b ≤ c ∧ a = c → b = a

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLE.1 a b ∧ (Real.instLE.1 b c ∧ a = c)) → b = a

Logical form (Lean):

```lean
theorem IneqSqueeze (a b c : ℝ) : a ≤ b ∧ b ≤ c ∧ a = c → b = a
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
theorem IneqSqueeze (a b c : ℝ) : a ≤ b ∧ b ≤ c ∧ a = c → b = a := by
  sorry
/--
`IneqTransitivityStrict` TODO

Predicate logic:

  a < b ∧ b < c → a < c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLT.1 a b ∧ Real.instLT.1 b c) → Real.instLT.1 a c

Logical form (Lean):

```lean
theorem IneqTransitivityStrict (a b c : ℝ) : a < b ∧ b < c → a < c
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
theorem IneqTransitivityStrict (a b c : ℝ) : a < b ∧ b < c → a < c := by
  sorry
/--
`IneqTransitivityMixed` TODO

Predicate logic:

  a ≤ b ∧ b < c → a < c

Predicate logic (unfolded):

  ∀ (a b c : Real), (Real.instLE.1 a b ∧ Real.instLT.1 b c) → Real.instLT.1 a c

Logical form (Lean):

```lean
theorem IneqTransitivityMixed (a b c : ℝ) : a ≤ b ∧ b < c → a < c
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
theorem IneqTransitivityMixed (a b c : ℝ) : a ≤ b ∧ b < c → a < c := by
  sorry
/--
`IneqReciprocalPositive` TODO

Predicate logic:

  0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 a b) → (Real.instLT.1 Zero.toOfNat0.1 (instHDiv.1 One.toOfNat1.1 b) ∧ Real.instLT.1 (instHDiv.1 One.toOfNat1.1 b) (instHDiv.1 One.toOfNat1.1 a))

Logical form (Lean):

```lean
theorem IneqReciprocalPositive (a b : ℝ) :
    0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a
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
theorem IneqReciprocalPositive (a b : ℝ) :
    0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a := by
  sorry
/--
`IneqReciprocalFlip` TODO

Predicate logic:

  a < b ↔ 1 / b < 1 / a

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 Zero.toOfNat0.1 b) → Real.instLT.1 a b ↔ Real.instLT.1 (instHDiv.1 One.toOfNat1.1 b) (instHDiv.1 One.toOfNat1.1 a)

Logical form (Lean):

```lean
theorem IneqReciprocalFlip (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    a < b ↔ 1 / b < 1 / a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem IneqReciprocalFlip (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    a < b ↔ 1 / b < 1 / a := by
  sorry
end LRA.Analysis.RealAnalysis
