
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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real 0 = 0

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → { real_part := 0, imaginary_part := 0 } = 0

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real 1 = 1

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → { real_part := 1, imaginary_part := 0 } = 1

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real (instHAdd.hAdd first second) = instHAdd.hAdd (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real first) (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real second)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    first second : R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), { real_part := { hAdd := fun a b => inst.add a b }.hAdd first second, imaginary_part := 0 } = { hAdd := fun a b => { add := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd first.1 second.1, imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd first.2 second.2 } }.add a b }.hAdd { real_part := first, imaginary_part := 0 } { real_part := second, imaginary_part := 0 }

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (value : R), LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real (inst_2.neg value) = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instNegComplexNumber.neg (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real value)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    value : R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (value : R), { real_part := inst_2.neg value, imaginary_part := 0 } = { neg := fun value => { real_part := inst_2.neg value.1, imaginary_part := inst_2.neg value.2 } }.neg { real_part := value, imaginary_part := 0 }

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real (instHMul.hMul first second) = instHMul.hMul (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real first) (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real second)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    first second : R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), { real_part := { hMul := fun a b => inst_1.mul a b }.hMul first second, imaginary_part := 0 } = { hMul := fun a b => { mul := fun first second => { real_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.1) (inst_2.neg ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.2)), imaginary_part := { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul first.1 second.2) ({ hMul := fun a b => inst_1.mul a b }.hMul first.2 second.1) } }.mul a b }.hMul { real_part := first, imaginary_part := 0 } { real_part := second, imaginary_part := 0 }

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : OfNat R 0] [inst_4 : OfNat R 1], LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real first = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.of_real second → first = second

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    first second : R
  Prove
    LRA.AlgebraicStructures.CommutativeRingLaws R → ∀ (first second : R), { real_part := first, imaginary_part := 0 } = { real_part := second, imaginary_part := 0 } → first = second

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    polynomial.1 = 0 → False

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R 0] [inst_5 : OfNat R 1] [inst_6 : LE R], (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ LRA.Order.OrderCompletenessLaws R (Set R)) → ∀ (polynomial : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Polynomial R), polynomial.nonconstant → Exists fun root => polynomial.evaluate root = 0

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    polynomial : Polynomial R
    polynomial_nonconstant : Polynomial.nonconstant polynomial
  Prove
    (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ (LRA.Order.OrderCompletenessLaws R (R → Prop))) → ∀ (polynomial : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Polynomial R), (polynomial.1 = 0 → False) → Exists fun root => sorry = 0

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
