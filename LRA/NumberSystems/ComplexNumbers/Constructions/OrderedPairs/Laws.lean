
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.WellDefinedness

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`addition_is_associative` TODO

Predicate logic:

  (a + b) + c = a + (b + c)

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.1 (instHAdd.1 a b) c = instHAdd.1 a (instHAdd.1 b c)

Logical form (Lean):

```lean
theorem addition_is_associative (a b c : ComplexNumber R) :
    (a + b) + c = a + (b + c)
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
theorem addition_is_associative (a b c : ComplexNumber R) :
    (a + b) + c = a + (b + c) := by
  sorry

/--
`addition_is_commutative` TODO

Predicate logic:

  a + b = b + a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.1 a b = instHAdd.1 b a

Logical form (Lean):

```lean
theorem addition_is_commutative (a b : ComplexNumber R) :
    a + b = b + a
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
theorem addition_is_commutative (a b : ComplexNumber R) :
    a + b = b + a := by
  sorry

/--
`zero_add_complex` TODO

Predicate logic:

  0 + a = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.1 LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1 a = a

Logical form (Lean):

```lean
theorem zero_add_complex (a : ComplexNumber R) : 0 + a = a
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
theorem zero_add_complex (a : ComplexNumber R) : 0 + a = a := by
  sorry

/--
`add_zero_complex` TODO

Predicate logic:

  a + 0 = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.1 a LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1 = a

Logical form (Lean):

```lean
theorem add_zero_complex (a : ComplexNumber R) : a + 0 = a
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
theorem add_zero_complex (a : ComplexNumber R) : a + 0 = a := by
  sorry

/--
`neg_add_cancel_complex` TODO

Predicate logic:

  -a + a = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.1 (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instNegComplexNumber.1 a) a = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1

Logical form (Lean):

```lean
theorem neg_add_cancel_complex (a : ComplexNumber R) : -a + a = 0
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
theorem neg_add_cancel_complex (a : ComplexNumber R) : -a + a = 0 := by
  sorry

/--
`add_neg_cancel_complex` TODO

Predicate logic:

  a + -a = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.1 a (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instNegComplexNumber.1 a) = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1

Logical form (Lean):

```lean
theorem add_neg_cancel_complex (a : ComplexNumber R) : a + -a = 0
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
theorem add_neg_cancel_complex (a : ComplexNumber R) : a + -a = 0 := by
  sorry

/--
`multiplication_is_associative` TODO

Predicate logic:

  (a * b) * c = a * (b * c)

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 (instHMul.1 a b) c = instHMul.1 a (instHMul.1 b c)

Logical form (Lean):

```lean
theorem multiplication_is_associative (a b c : ComplexNumber R) :
    (a * b) * c = a * (b * c)
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
theorem multiplication_is_associative (a b c : ComplexNumber R) :
    (a * b) * c = a * (b * c) := by
  sorry

/--
`multiplication_is_commutative` TODO

Predicate logic:

  a * b = b * a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 a b = instHMul.1 b a

Logical form (Lean):

```lean
theorem multiplication_is_commutative (a b : ComplexNumber R) :
    a * b = b * a
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
theorem multiplication_is_commutative (a b : ComplexNumber R) :
    a * b = b * a := by
  sorry

/--
`one_mul_complex` TODO

Predicate logic:

  1 * a = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat_1.1 a = a

Logical form (Lean):

```lean
theorem one_mul_complex (a : ComplexNumber R) : 1 * a = a
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
theorem one_mul_complex (a : ComplexNumber R) : 1 * a = a := by
  sorry

/--
`mul_one_complex` TODO

Predicate logic:

  a * 1 = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 a LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat_1.1 = a

Logical form (Lean):

```lean
theorem mul_one_complex (a : ComplexNumber R) : a * 1 = a
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
theorem mul_one_complex (a : ComplexNumber R) : a * 1 = a := by
  sorry

/--
`zero_mul_complex` TODO

Predicate logic:

  0 * a = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1 a = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1

Logical form (Lean):

```lean
theorem zero_mul_complex (a : ComplexNumber R) : 0 * a = 0
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
theorem zero_mul_complex (a : ComplexNumber R) : 0 * a = 0 := by
  sorry

/--
`mul_zero_complex` TODO

Predicate logic:

  a * 0 = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 a LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1 = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1

Logical form (Lean):

```lean
theorem mul_zero_complex (a : ComplexNumber R) : a * 0 = 0
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
theorem mul_zero_complex (a : ComplexNumber R) : a * 0 = 0 := by
  sorry

/--
`left_distributive_complex` TODO

Predicate logic:

  a * (b + c) = a * b + a * c

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 a (instHAdd.1 b c) = instHAdd.1 (instHMul.1 a b) (instHMul.1 a c)

Logical form (Lean):

```lean
theorem left_distributive_complex (a b c : ComplexNumber R) :
    a * (b + c) = a * b + a * c
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
theorem left_distributive_complex (a b c : ComplexNumber R) :
    a * (b + c) = a * b + a * c := by
  sorry

/--
`right_distributive_complex` TODO

Predicate logic:

  (a + b) * c = a * c + b * c

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.1 (instHAdd.1 a b) c = instHAdd.1 (instHMul.1 a c) (instHMul.1 b c)

Logical form (Lean):

```lean
theorem right_distributive_complex (a b c : ComplexNumber R) :
    (a + b) * c = a * c + b * c
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
theorem right_distributive_complex (a b c : ComplexNumber R) :
    (a + b) * c = a * c + b * c := by
  sorry

/--
`imaginary_unit_squared` TODO

Predicate logic:

  imaginaryUnit * imaginaryUnit = -1 ∈ ComplexNumber R

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R (instOfNatNat 0).1] [inst_4 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.CommutativeRingLaws R → instHMul.1 { real_part := inst_3.1, imaginary_part := inst_4.1 } { real_part := inst_3.1, imaginary_part := inst_4.1 } = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instNegComplexNumber.1 LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat_1.1

Logical form (Lean):

```lean
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber R)
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
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber R) := by
  sorry

end RingTheorems

section FieldTheorems

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

/--
`one_ne_zero_complex` TODO

Predicate logic:

  1 ∈ ComplexNumber R ≠ 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R (instOfNatNat 0).1] [inst_5 : OfNat R (instOfNatNat 1).1] [inst_6 : LE R], (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat_1.1 = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1) → False

Logical form (Lean):

```lean
theorem one_ne_zero_complex : (1 : ComplexNumber R) ≠ 0
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
theorem one_ne_zero_complex : (1 : ComplexNumber R) ≠ 0 := by
  sorry

/--
`mul_inv_cancel_complex` TODO

Predicate logic:

  value * value⁻¹ = 1

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R (instOfNatNat 0).1] [inst_5 : OfNat R (instOfNatNat 1).1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → ∀ (value : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), (value = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1 → False) → instHMul.1 value (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instInvComplexNumberOfAddOfMulOfNeg.1 value) = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat_1.1

Logical form (Lean):

```lean
theorem mul_inv_cancel_complex
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    value * value⁻¹ = 1
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
theorem mul_inv_cancel_complex
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    value * value⁻¹ = 1 := by
  sorry

/--
`inv_zero_complex` TODO

Predicate logic:

  0 ∈ ComplexNumber R⁻¹ = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R (instOfNatNat 0).1] [inst_5 : OfNat R (instOfNatNat 1).1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instInvComplexNumberOfAddOfMulOfNeg.1 LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1 = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1

Logical form (Lean):

```lean
theorem inv_zero_complex : (0 : ComplexNumber R)⁻¹ = 0
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
theorem inv_zero_complex : (0 : ComplexNumber R)⁻¹ = 0 := by
  sorry

end FieldTheorems

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
