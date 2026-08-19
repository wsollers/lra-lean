import LRA.AlgebraicStructures.DivisionRing.Definition
import LRA.AlgebraicStructures.DivisionRing.Interface.Signature.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory

universe u

/-! Law-free model builders for the first-order division-ring language. -/

open LRA.AlgebraicStructures.DivisionRing.Interface.Signature

def BuildDivisionRingModel
    (signature : LRA.AlgebraicStructures.DivisionRingConceptSignature) :
    LRA.Logic.FirstOrder.Model DivisionRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
    | .inv, args => signature.inv (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def divisionRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model DivisionRingFirstOrderSignature :=
  BuildDivisionRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) }

end LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory
