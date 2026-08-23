import LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedSemiring.Definition
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory

universe u

   
                                                                      

                                                                              
                                       
  

open LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature

                                                                          
                                                          
                                                                        
                                                                    
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
