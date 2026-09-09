
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Operations

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section FieldTheorems

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

/--
`norm_squared_ne_zero_of_nonzero` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R 0] [inst_5 : OfNat R 1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → ∀ (value : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), Ne value 0 → Ne (LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.normSquared value) 0

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    value : ComplexNumber R
    value_nonzero : value ≠ 0
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws R → ∀ (value : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), ((value = 0 → False) ∧ { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul value.1 value.1) ({ hMul := fun a b => inst_1.mul a b }.hMul value.2 value.2) = 0) → False

Logical form (Lean):

```lean
theorem norm_squared_ne_zero_of_nonzero
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    normSquared value ≠ (0 : R)
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
theorem norm_squared_ne_zero_of_nonzero
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    normSquared value ≠ (0 : R) := by
  sorry
end FieldTheorems

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
