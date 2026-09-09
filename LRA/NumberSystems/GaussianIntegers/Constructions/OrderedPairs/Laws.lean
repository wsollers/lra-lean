
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellDefinedness

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`addition_is_associative` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHAdd.hAdd (instHAdd.hAdd a b) c = instHAdd.hAdd a (instHAdd.hAdd b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a b) c = { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a ({ hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd b c)

Logical form (Lean):

```lean
theorem addition_is_associative (a b c : GaussianInteger R) :
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
theorem addition_is_associative (a b c : GaussianInteger R) :
    (a + b) + c = a + (b + c) := by
  sorry
/--
`addition_is_commutative` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHAdd.hAdd a b = instHAdd.hAdd b a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a b = { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd b a

Logical form (Lean):

```lean
theorem addition_is_commutative (a b : GaussianInteger R) :
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
theorem addition_is_commutative (a b : GaussianInteger R) :
    a + b = b + a := by
  sorry
/--
`zero_add_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHAdd.hAdd 0 a = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd 0 a = a

Logical form (Lean):

```lean
theorem zero_add_gaussian (a : GaussianInteger R) : 0 + a = a
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
theorem zero_add_gaussian (a : GaussianInteger R) : 0 + a = a := by
  sorry
/--
`add_zero_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHAdd.hAdd a 0 = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a 0 = a

Logical form (Lean):

```lean
theorem add_zero_gaussian (a : GaussianInteger R) : a + 0 = a
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
theorem add_zero_gaussian (a : GaussianInteger R) : a + 0 = a := by
  sorry
/--
`neg_add_cancel_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHAdd.hAdd (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.instNegGaussianInteger.neg a) a = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ neg := fun value => { realPart := inst_2.neg value.1, imaginaryPart := inst_2.neg value.2 } }.neg a) a = 0

Logical form (Lean):

```lean
theorem neg_add_cancel_gaussian (a : GaussianInteger R) : -a + a = 0
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
theorem neg_add_cancel_gaussian (a : GaussianInteger R) : -a + a = 0 := by
  sorry
/--
`add_neg_cancel_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHAdd.hAdd a (LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.instNegGaussianInteger.neg a) = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a ({ neg := fun value => { realPart := inst_2.neg value.1, imaginaryPart := inst_2.neg value.2 } }.neg a) = 0

Logical form (Lean):

```lean
theorem add_neg_cancel_gaussian (a : GaussianInteger R) : a + -a = 0
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
theorem add_neg_cancel_gaussian (a : GaussianInteger R) : a + -a = 0 := by
  sorry
/--
`multiplication_is_associative` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul (instHMul.hMul a b) c = instHMul.hMul a (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul ({ hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a b) c = { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a ({ hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul b c)

Logical form (Lean):

```lean
theorem multiplication_is_associative (a b c : GaussianInteger R) :
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
theorem multiplication_is_associative (a b c : GaussianInteger R) :
    (a * b) * c = a * (b * c) := by
  sorry
/--
`multiplication_is_commutative` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul a b = instHMul.hMul b a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a b = { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul b a

Logical form (Lean):

```lean
theorem multiplication_is_commutative (a b : GaussianInteger R) :
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
theorem multiplication_is_commutative (a b : GaussianInteger R) :
    a * b = b * a := by
  sorry
/--
`one_mul_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul 1 a = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul 1 a = a

Logical form (Lean):

```lean
theorem one_mul_gaussian (a : GaussianInteger R) : 1 * a = a
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
theorem one_mul_gaussian (a : GaussianInteger R) : 1 * a = a := by
  sorry
/--
`mul_one_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul a 1 = a

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a 1 = a

Logical form (Lean):

```lean
theorem mul_one_gaussian (a : GaussianInteger R) : a * 1 = a
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
theorem mul_one_gaussian (a : GaussianInteger R) : a * 1 = a := by
  sorry
/--
`zero_mul_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul 0 a = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul 0 a = 0

Logical form (Lean):

```lean
theorem zero_mul_gaussian (a : GaussianInteger R) : 0 * a = 0
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
theorem zero_mul_gaussian (a : GaussianInteger R) : 0 * a = 0 := by
  sorry
/--
`mul_zero_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul a 0 = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a 0 = 0

Logical form (Lean):

```lean
theorem mul_zero_gaussian (a : GaussianInteger R) : a * 0 = 0
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
theorem mul_zero_gaussian (a : GaussianInteger R) : a * 0 = 0 := by
  sorry
/--
`left_distributive_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul a (instHAdd.hAdd b c) = instHAdd.hAdd (instHMul.hMul a b) (instHMul.hMul a c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a ({ hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd b c) = { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a b) ({ hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a c)

Logical form (Lean):

```lean
theorem left_distributive_gaussian (a b c : GaussianInteger R) :
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
theorem left_distributive_gaussian (a b c : GaussianInteger R) :
    a * (b + c) = a * b + a * c := by
  sorry
/--
`right_distributive_gaussian` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), instHMul.hMul (instHAdd.hAdd a b) c = instHAdd.hAdd (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    a b c : GaussianInteger R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (a b c : LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.GaussianInteger R), { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul ({ hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd a b) c = { hAdd := fun a b => { add := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd ({ hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul a c) ({ hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul b c)

Logical form (Lean):

```lean
theorem right_distributive_gaussian (a b c : GaussianInteger R) :
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
theorem right_distributive_gaussian (a b c : GaussianInteger R) :
    (a + b) * c = a * c + b * c := by
  sorry
/--
`imaginary_unit_squared` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → instHMul.hMul LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.imaginaryUnit LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.imaginaryUnit = -1

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → { hMul := fun a b => { mul := fun first second => { realPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginaryPart := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul { realPart := 0, imaginaryPart := 1 } { realPart := 0, imaginaryPart := 1 } = -1

Logical form (Lean):

```lean
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger R)
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
    imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger R) := by
  sorry
end RingTheorems

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
