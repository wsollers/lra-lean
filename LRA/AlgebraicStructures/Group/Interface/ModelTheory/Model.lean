import LRA.AlgebraicStructures.Group.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Group.Interface.ModelTheory.LStructure

namespace LRA.AlgebraicStructures.Group.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures (GroupConceptSignature)

/-- The `GroupConceptSignature` induced by any raw `Mul`/`Inv`/`OfNat _ 1`
carrier, matching the anonymous signature literal `groupFirstOrderModel`
already builds from `R`. -/
def GroupConceptSignature.ofCarrier (R : Type u) [Mul R] [Inv R] [OfNat R 1] :
    GroupConceptSignature where
  carrier := R
  one := 1
  multiply := (· * ·)
  inverse := (·⁻¹)

end LRA.AlgebraicStructures.Group.Interface.ModelTheory
