import LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedSemiring.Definition
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory

universe u

/-!
Model builders for the ordered-semiring first-order signature.

Law certificates are intentionally separate: these builders only interpret the
non-logical vocabulary of the language.
-/

open LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature

/-- An ordered-semiring model needs the semiring signature plus its strict
order relation; the non-strict order is already carried by
`OrderedSemiringConceptSignature.le`, so only the strict relation is new
data here, the same shape `OrderedGroup`'s own ModelBuilder took. -/
structure OrderedSemiringSignature extends
    LRA.AlgebraicStructures.OrderedSemiringConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier

def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) }

end LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
