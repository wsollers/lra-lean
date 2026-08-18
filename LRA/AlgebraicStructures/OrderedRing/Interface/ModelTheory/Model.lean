import LRA.AlgebraicStructures.OrderedRing.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedRing.Definition
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

universe u

/-!
Model builders for the first-order ordered-ring language.

The signature here is a law-free operation/relation bundle. Order and ring laws
remain separate certificates under `Order` and `AlgebraicStructures`.
-/

open LRA.AlgebraicStructures.OrderedRing.Interface.Signature

/-- An ordered-ring model needs the ring signature plus its strict order
relation; the non-strict order is already carried by
`OrderedRingConceptSignature.le`, the same shape `OrderedGroup` and
`OrderedSemiring`'s own ModelBuilders took. -/
structure OrderedRingSignature extends
    LRA.AlgebraicStructures.OrderedRingConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier

namespace OrderedRingSignature

abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.add first (signature.neg second)

end OrderedRingSignature

def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) }

end LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
