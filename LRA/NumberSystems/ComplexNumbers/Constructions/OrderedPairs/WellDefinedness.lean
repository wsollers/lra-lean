
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

  normSquared value ≠ 0 ∈ R

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R (instOfNatNat 0).1] [inst_5 : OfNat R (instOfNatNat 1).1] [inst_6 : LE R], LRA.AlgebraicStructures.OrderedFieldLaws R → ∀ (value : LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R), (value = LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.instOfNatComplexNumberOfNatNat.1 → False ∧ instHAdd.1 (instHMul.1 value.1 value.1) (instHMul.1 value.2 value.2) = inst_4.1) → False

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
