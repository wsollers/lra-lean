
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

/--
`RealOrderTrichotomy` TODO

Predicate logic:

  ∀ (a b : Real), Or ((Real.instLT.lt a b ∧ (Ne a b ∧ ¬ GT.gt a b))) (Or ((a = b ∧ (¬ Real.instLT.lt a b ∧ ¬ GT.gt a b))) ((GT.gt a b ∧ (Ne a b ∧ ¬ Real.instLT.lt a b))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Or ((Real.instLT.lt a b ∧ ((a = b → False) ∧ (Real.instLT.lt b a → False)))) (Or ((a = b ∧ ((Real.instLT.lt a b → False) ∧ (Real.instLT.lt b a → False)))) ((Real.instLT.lt b a ∧ ((a = b → False) ∧ (Real.instLT.lt a b → False)))))

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

  ∀ (a b c : Real), Real.instLT.lt a b → Real.instLT.lt (instHAdd.hAdd a c) (instHAdd.hAdd b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    Real.instLT.lt a b → Real.instLT.lt ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b c)

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

  ∀ (a b c : Real), Real.instLE.le a b → Real.instLE.le (instHAdd.hAdd a c) (instHAdd.hAdd b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    Real.instLE.le a b → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b c)

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

  ∀ (a b c d : Real), (Real.instLT.lt a b ∧ Real.instLT.lt c d) → Real.instLT.lt (instHAdd.hAdd a c) (instHAdd.hAdd b d)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c d : ℝ
  Prove
    (Real.instLT.lt a b ∧ Real.instLT.lt c d) → Real.instLT.lt ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b d)

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

  ∀ (a b c d : Real), (Real.instLE.le a b ∧ Real.instLE.le c d) → Real.instLE.le (instHAdd.hAdd a c) (instHAdd.hAdd b d)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c d : ℝ
  Prove
    (Real.instLE.le a b ∧ Real.instLE.le c d) → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b d)

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

  ∀ (a b : Real), (GT.gt a 0 ∧ GT.gt b 0) → GT.gt (instHAdd.hAdd a b) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLT.lt 0 a ∧ Real.instLT.lt 0 b) → Real.instLT.lt 0 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a b)

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

  Exists fun a => Exists fun b => Exists fun c => Exists fun d => (GT.gt a b ∧ (GT.gt c d ∧ (¬ GT.gt (instHSub.hSub a c) (instHSub.hSub b d) ∧ ¬ GT.gt (instHSub.hSub c a) (instHSub.hSub d b))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a => Exists fun b => Exists fun c => Exists fun d => (Real.instLT.lt b a ∧ (Real.instLT.lt d c ∧ ((Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub b d) ({ hSub := fun a b => Real.instSub.sub a b }.hSub a c) → False) ∧ (Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub d b) ({ hSub := fun a b => Real.instSub.sub a b }.hSub c a) → False))))

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

  ∀ (a b c d : Real), (Real.instLE.le a b ∧ Real.instLT.lt c d) → Real.instLT.lt (instHAdd.hAdd a c) (instHAdd.hAdd b d)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c d : ℝ
  Prove
    (Real.instLE.le a b ∧ Real.instLT.lt c d) → Real.instLT.lt ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b d)

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

  ∀ (a b c : Real), (Real.instLT.lt a b ∧ Real.instLT.lt 0 c) → Real.instLT.lt (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLT.lt a b ∧ Real.instLT.lt 0 c) → Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul a c) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b c)

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

  ∀ (a b c : Real), (Real.instLT.lt a b ∧ Real.instLT.lt c 0) → GT.gt (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLT.lt a b ∧ Real.instLT.lt c 0) → Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul b c) ({ hMul := fun a b => Real.instMul.mul a b }.hMul a c)

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

  ∀ (a b c : Real), (Real.instLE.le a b ∧ Real.instLT.lt 0 c) → Real.instLE.le (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLE.le a b ∧ Real.instLT.lt 0 c) → Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul a c) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b c)

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

  ∀ (a b c : Real), (Real.instLE.le a b ∧ Real.instLE.le 0 c) → Real.instLE.le (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLE.le a b ∧ Real.instLE.le 0 c) → Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul a c) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b c)

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

  ∀ (a b : Real), (GT.gt a 0 ∧ GT.gt b 0) → GT.gt (instHMul.hMul a b) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLT.lt 0 a ∧ Real.instLT.lt 0 b) → Real.instLT.lt 0 ({ hMul := fun a b => Real.instMul.mul a b }.hMul a b)

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

  ∀ (a b : Real), (Real.instLT.lt a 0 ∧ Real.instLT.lt b 0) → GT.gt (instHMul.hMul a b) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLT.lt a 0 ∧ Real.instLT.lt b 0) → Real.instLT.lt 0 ({ hMul := fun a b => Real.instMul.mul a b }.hMul a b)

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

  ∀ (a b : Real), (GT.gt a 0 ∧ Real.instLT.lt b 0) → Real.instLT.lt (instHMul.hMul a b) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLT.lt 0 a ∧ Real.instLT.lt b 0) → Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul a b) 0

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

  ∀ (a b : Real), (Real.instLT.lt a 0 ∧ GT.gt b 0) → Real.instLT.lt (instHMul.hMul a b) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLT.lt a 0 ∧ Real.instLT.lt 0 b) → Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul a b) 0

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

  ∀ (a b : Real), Real.instLT.lt a b ↔ GT.gt (instHSub.hSub b a) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLT.lt a b ↔ GT.gt (instHSub.hSub b a) 0

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

  ∀ (a b : Real), Real.instLE.le a b ↔ GE.ge (instHSub.hSub b a) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLE.le a b ↔ GE.ge (instHSub.hSub b a) 0

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

  ∀ (a b c : Real), (Real.instLT.lt a b ∧ GT.gt c 0) → Real.instLT.lt (instHDiv.hDiv a c) (instHDiv.hDiv b c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLT.lt a b ∧ Real.instLT.lt 0 c) → Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv a c) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv b c)

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

  ∀ (a b c : Real), (Real.instLT.lt a b ∧ Real.instLT.lt c 0) → Real.instLT.lt (instHDiv.hDiv b c) (instHDiv.hDiv a c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLT.lt a b ∧ Real.instLT.lt c 0) → Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv b c) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv a c)

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

  ∀ (a b c : Real), (GT.gt c 0 ∧ Real.instLT.lt (instHMul.hMul a c) (instHMul.hMul b c)) → Real.instLT.lt a b

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLT.lt 0 c ∧ Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul a c) ({ hMul := fun a b => Real.instMul.mul a b }.hMul b c)) → Real.instLT.lt a b

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

  Exists fun a => Exists fun b => Exists fun c => Exists fun d => (Ne a 0 ∧ (Ne b 0 ∧ (Ne c 0 ∧ (Ne d 0 ∧ (GT.gt a b ∧ (GT.gt c d ∧ (¬ GT.gt (instHDiv.hDiv a c) (instHDiv.hDiv b d) ∧ ¬ GT.gt (instHDiv.hDiv c a) (instHDiv.hDiv d b))))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a => Exists fun b => Exists fun c => Exists fun d => ((a = 0 → False) ∧ ((b = 0 → False) ∧ ((c = 0 → False) ∧ ((d = 0 → False) ∧ (Real.instLT.lt b a ∧ (Real.instLT.lt d c ∧ ((Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv b d) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv a c) → False) ∧ (Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv d b) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv c a) → False))))))))

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

  ∀ (a b c : Real), (Real.instLE.le a b ∧ (Real.instLE.le b c ∧ a = c)) → b = a

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLE.le a b ∧ (Real.instLE.le b c ∧ a = c)) → b = a

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

  ∀ (a b c : Real), (Real.instLT.lt a b ∧ Real.instLT.lt b c) → Real.instLT.lt a c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLT.lt a b ∧ Real.instLT.lt b c) → Real.instLT.lt a c

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

  ∀ (a b c : Real), (Real.instLE.le a b ∧ Real.instLT.lt b c) → Real.instLT.lt a c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    (Real.instLE.le a b ∧ Real.instLT.lt b c) → Real.instLT.lt a c

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

  ∀ (a b : Real), (Real.instLT.lt 0 a ∧ Real.instLT.lt a b) → (Real.instLT.lt 0 (instHDiv.hDiv 1 b) ∧ Real.instLT.lt (instHDiv.hDiv 1 b) (instHDiv.hDiv 1 a))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    (Real.instLT.lt 0 a ∧ Real.instLT.lt a b) → (Real.instLT.lt 0 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 b) ∧ Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 b) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 a))

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

  ∀ (a b : Real), (GT.gt a 0 ∧ GT.gt b 0) → Real.instLT.lt a b ↔ Real.instLT.lt (instHDiv.hDiv 1 b) (instHDiv.hDiv 1 a)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    ha : a > 0
    hb : b > 0
  Prove
    (GT.gt a 0 ∧ GT.gt b 0) → Real.instLT.lt a b ↔ Real.instLT.lt (instHDiv.hDiv 1 b) (instHDiv.hDiv 1 a)

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
