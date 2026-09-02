import LRA.AlgebraicStructures
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Instances

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

universe u

/-- The ordered-pairs complex-number construction canonically realizes
commutative ring structure over a commutative-ring base. -/
theorem satisfiesCommutativeRing
    (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] :
    CommutativeRingLaws (ComplexNumber R) := by
  sorry
/-- The ordered-pairs complex-number construction canonically realizes field
structure over an ordered-field base. -/
theorem satisfiesField
    (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] :
    FieldLaws (ComplexNumber R) := by
  sorry
end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
