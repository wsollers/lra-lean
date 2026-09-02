
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Laws

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

variable {R : Type u}

section EmbeddingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`of_real_preserves_zero` TODO

Predicate logic:

  of_real 0 ∈ R = 0 ∈ ComplexNumber R

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → { real_part := inst_3.1, imaginary_part := inst_3.1 } = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1

Logical form (Lean):

```lean
theorem of_real_preserves_zero : of_real (0 : R) = (0 : ComplexNumber R)
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
theorem of_real_preserves_zero : of_real (0 : R) = (0 : ComplexNumber R) := by
  sorry
/--
`of_real_preserves_one` TODO

Predicate logic:

  of_real 1 ∈ R = 1 ∈ ComplexNumber R

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → { real_part := inst_4.1, imaginary_part := inst_3.1 } = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat_1.1

Logical form (Lean):

```lean
theorem of_real_preserves_one : of_real (1 : R) = (1 : ComplexNumber R)
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
theorem of_real_preserves_one : of_real (1 : R) = (1 : ComplexNumber R) := by
  sorry
/--
`of_real_preserves_addition` TODO

Predicate logic:

  (∀ first second ∈ R), of_real (first + second) = of_real first + of_real second

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), { real_part := instHAdd.1 first second, imaginary_part := inst_3.1 } = instHAdd.1 { real_part := first, imaginary_part := inst_3.1 } { real_part := second, imaginary_part := inst_3.1 }

Logical form (Lean):

```lean
theorem of_real_preserves_addition (first second : R) :
    of_real (first + second) = of_real first + of_real second
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
theorem of_real_preserves_addition (first second : R) :
    of_real (first + second) = of_real first + of_real second := by
  sorry
/--
`of_real_preserves_negation` TODO

Predicate logic:

  (∀ value ∈ R), of_real (-value) = -(of_real value)

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (value : R), { real_part := inst_2.1 value, imaginary_part := inst_3.1 } = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instNegComplexNumber.1 { real_part := value, imaginary_part := inst_3.1 }

Logical form (Lean):

```lean
theorem of_real_preserves_negation (value : R) :
    of_real (-value) = -(of_real value)
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
theorem of_real_preserves_negation (value : R) :
    of_real (-value) = -(of_real value) := by
  sorry
/--
`of_real_preserves_multiplication` TODO

Predicate logic:

  (∀ first second ∈ R), of_real (first * second) = of_real first * of_real second

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), { real_part := instHMul.1 first second, imaginary_part := inst_3.1 } = instHMul.1 { real_part := first, imaginary_part := inst_3.1 } { real_part := second, imaginary_part := inst_3.1 }

Logical form (Lean):

```lean
theorem of_real_preserves_multiplication (first second : R) :
    of_real (first * second) = of_real first * of_real second
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
theorem of_real_preserves_multiplication (first second : R) :
    of_real (first * second) = of_real first * of_real second := by
  sorry
/--
`of_real_is_injective` TODO

Predicate logic:

  (∀ first second ∈ R), (of_real first = of_real second) → first = second

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), { real_part := first, imaginary_part := inst_3.1 } = { real_part := second, imaginary_part := inst_3.1 } → first = second

Logical form (Lean):

```lean
theorem of_real_is_injective (first second : R)
    (images_equal : of_real first = of_real second) : first = second
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
theorem of_real_is_injective (first second : R)
    (images_equal : of_real first = of_real second) : first = second := by
  sorry
end EmbeddingTheorems

/--
`Polynomial` TODO

Predicate logic:

  structure Polynomial (R : Type u) [OfNat R 0] where
  degree : Nat
  coefficient : Fin (degree + 1) → ComplexNumber R
  leading_coefficient_nonzero :
    degree ≠ 0 → coefficient ⟨degree, Nat.lt_succ_self degree⟩ ≠ 0

Predicate logic (unfolded):

  structure Polynomial (R : Type u) [OfNat R 0] where
  degree : Nat
  coefficient : Fin (degree + 1) → ComplexNumber R
  leading_coefficient_nonzero :
    degree ≠ 0 → coefficient ⟨degree, Nat.lt_succ_self degree⟩ ≠ 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Polynomial (R : Type u) [OfNat R 0] where
  degree : Nat
  coefficient : Fin (degree + 1) → ComplexNumber R
  leading_coefficient_nonzero :
    degree ≠ 0 → coefficient ⟨degree, Nat.lt_succ_self degree⟩ ≠ 0
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
structure Polynomial (R : Type u) [OfNat R 0] where
  degree : Nat
  coefficient : Fin (degree + 1) → ComplexNumber R
  leading_coefficient_nonzero :
    degree ≠ 0 → coefficient ⟨degree, Nat.lt_succ_self degree⟩ ≠ 0

/--
`Polynomial.evaluate` TODO

Predicate logic:

  def Polynomial.evaluate [OfNat R 0] [Add R] [Mul R]
    (polynomial : Polynomial R)
    (input : ComplexNumber R) : ComplexNumber R :=
  sorry

Predicate logic (unfolded):

  def Polynomial.evaluate [OfNat R 0] [Add R] [Mul R]
    (polynomial : Polynomial R)
    (input : ComplexNumber R) : ComplexNumber R :=
  sorry (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Polynomial.evaluate [OfNat R 0] [Add R] [Mul R]
    (polynomial : Polynomial R)
    (input : ComplexNumber R) : ComplexNumber R :=
  sorry
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Polynomial.evaluate [OfNat R 0] [Add R] [Mul R]
    (polynomial : Polynomial R)
    (input : ComplexNumber R) : ComplexNumber R :=
  sorry

/--
`Polynomial.nonconstant` TODO

Predicate logic:

  ∀ {R : Type u} [inst : OfNat R 0] (polynomial : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Polynomial R), polynomial.degree = 0 → False

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : OfNat R (instOfNatNat 0).1] (polynomial : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Polynomial R), polynomial.1 = instOfNatNat 0.1 → False

Logical form (Lean):

```lean
def Polynomial.nonconstant [OfNat R 0] (polynomial : Polynomial R) : Prop :=
  polynomial.degree ≠ 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Polynomial.nonconstant [OfNat R 0] (polynomial : Polynomial R) : Prop :=
  polynomial.degree ≠ 0

/--
`algebraic_closure_obligation` TODO

Predicate logic:

  ∃ root ∈ ComplexNumber R, Polynomial.evaluate polynomial root = 0 ∈ ComplexNumber R

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R (instOfNatNat 0).1] [inst_5 : OfNat R (instOfNatNat 1).1] [inst_6 : LE R], (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ LRA.Order.OrderCompletenessLaws R (R → Prop)) → ∀ (polynomial : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Polynomial R), (polynomial.1 = instOfNatNat 0.1 → False) → Exists fun root => sorry ((((((((((((((((((`LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Behavior.num (instOfNatNat 471).1).num (instOfNatNat 2).1).num (instOfNatNat 471).1).num (instOfNatNat 7).1).num (instOfNatNat 2).1).num (instOfNatNat 7).1).str "_sorry").str "_@").str "LRA").str "NumberSystems").str "ComplexNumbers").str "Constructions").str "OrderedPairs").str "Behavior").num (instOfNatNat 2612511948).1).str "_hygCtx").str "_hyg").num (instOfNatNat 20).1) = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1

Logical form (Lean):

```lean
theorem algebraic_closure_obligation
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] [OrderCompletenessLaws R (Set R)]
    (polynomial : Polynomial R)
    (polynomial_nonconstant : Polynomial.nonconstant polynomial) :
    ∃ root : ComplexNumber R,
      Polynomial.evaluate polynomial root = (0 : ComplexNumber R)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem algebraic_closure_obligation
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] [OrderCompletenessLaws R (Set R)]
    (polynomial : Polynomial R)
    (polynomial_nonconstant : Polynomial.nonconstant polynomial) :
    ∃ root : ComplexNumber R,
      Polynomial.evaluate polynomial root = (0 : ComplexNumber R) := by
  sorry
end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
