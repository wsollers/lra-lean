import LRA.AlgebraicStructures.OrderedField.Laws.Definition
import LRA.Order.Bounds.LeastUpperBoundProperty.CompletenessLaws
namespace LRA.AlgebraicStructures

open LRA.Order

universe u v

   
                                        

                                                                 
                                                                   
                                      
  

                                                                            
abbrev CompleteOrderedFieldLaws
    (R : Type u) (SetObject : Type v)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [Membership R SetObject] : Prop :=
  OrderedFieldLaws R ∧ OrderCompletenessLaws R SetObject

end LRA.AlgebraicStructures
