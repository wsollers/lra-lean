import LRA.AlgebraicStructures.Field.Interface.Signature.Definition
import LRA.AlgebraicStructures.Field.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Field.Interface.ModelTheory

universe u

/-!
Model builders for the first-order field language.

The operation bundle is law-free. Field laws are certified by
`AlgebraicStructures/Field/Laws`, while this module only interprets the
first-order symbols on a carrier.
-/

open LRA.AlgebraicStructures.Field.Interface.Signature

def BuildFieldModel
    (signature : LRA.AlgebraicStructures.FieldConceptSignature) :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature where
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

def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), inv := (·⁻¹) }

end LRA.AlgebraicStructures.Field.Interface.ModelTheory
