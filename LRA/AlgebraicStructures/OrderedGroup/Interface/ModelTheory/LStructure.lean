import LRA.AlgebraicStructures.OrderedGroup.Interface.Signature.Definition
import LRA.AlgebraicStructures.Group.Definition
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory

universe u

                                                                                  

open LRA.AlgebraicStructures.OrderedGroup.Interface.Signature

                                                                       
                                                                          
                                                                    
                                                              
structure OrderedGroupSignature extends LRA.AlgebraicStructures.GroupConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

def BuildOrderedGroupModel
    (signature : OrderedGroupSignature) :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .one => signature.one

def orderedGroupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

end LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory
