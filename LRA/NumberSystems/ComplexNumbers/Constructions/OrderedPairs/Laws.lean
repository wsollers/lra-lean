
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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.hAdd (instHAdd.hAdd a b) c = instHAdd.hAdd a (instHAdd.hAdd b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a b) c = { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a ({ hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd b c)

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.hAdd a b = instHAdd.hAdd b a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a b = { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd b a

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.hAdd 0 a = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd 0 a = a

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.hAdd a 0 = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a 0 = a

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.hAdd (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instNegComplexNumber.neg a) a = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ neg := fun value => { real_part := inst_2.neg value.1, imaginary_part := inst_2.neg value.2 } }.neg a) a = 0

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHAdd.hAdd a (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instNegComplexNumber.neg a) = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a ({ neg := fun value => { real_part := inst_2.neg value.1, imaginary_part := inst_2.neg value.2 } }.neg a) = 0

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul (instHMul.hMul a b) c = instHMul.hMul a (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul ({ hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a b) c = { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a ({ hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul b c)

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul a b = instHMul.hMul b a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a b = { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul b a

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul 1 a = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul 1 a = a

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul a 1 = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a 1 = a

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul 0 a = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul 0 a = 0

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul a 0 = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a 0 = 0

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul a (instHAdd.hAdd b c) = instHAdd.hAdd (instHMul.hMul a b) (instHMul.hMul a c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a ({ hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd b c) = { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a b) ({ hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a c)

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), instHMul.hMul (instHAdd.hAdd a b) c = instHAdd.hAdd (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : ComplexNumber R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul ({ hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a b) c = { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a c) ({ hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul b c)

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → instHMul.hMul LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.imaginaryUnit LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.imaginaryUnit = -1

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul { real_part := 0, imaginary_part := 1 } { real_part := 0, imaginary_part := 1 } = -1

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R 0] [inst_5 : OfNat R 1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → Ne 1 0

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    (none)
  Prove
    (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ 1 = 0) → False

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R 0] [inst_5 : OfNat R 1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → ∀ (value : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), Ne value 0 → instHMul.hMul value (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instInvComplexNumberOfAddOfMulOfNeg.inv value) = 1

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    value : ComplexNumber R
    value_nonzero : value ≠ 0
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws R → ∀ (value : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), (value = 0 → False) → { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul value (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instInvComplexNumberOfAddOfMulOfNeg.1 value) = 1

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R 0] [inst_5 : OfNat R 1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instInvComplexNumberOfAddOfMulOfNeg.inv 0 = 0

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws R → LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instInvComplexNumberOfAddOfMulOfNeg.1 0 = 0

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
