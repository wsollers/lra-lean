import LRA.Function.Properties.Definition
import LRA.Function.Calculus.Classes.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Function

universe u v

                                                                             
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      ∀ output left right,
        FiberClass function output left →
        FiberClass function output right →
        left = right := by
  sorry

                                                                
theorem SurjectiveIffFibersNonempty
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      ∀ output, ∃ input, FiberClass function output input := by
  sorry

                                                                                
theorem InjectiveIffConverseSingleValued
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      SingleValued (LRA.Relation.Converse (Graph function)) := by
  sorry

                                                                         
theorem SurjectiveIffConverseTotal
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      Total (LRA.Relation.Converse (Graph function)) := by
  sorry

                                                                                             
theorem BijectiveIffConverseIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Bijective function ↔
      IsFunctionRelation (LRA.Relation.Converse (Graph function)) := by
  sorry

                                                                          

                                                                               
                                                                        
                                                                                 
theorem GraphIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    IsFunctionRelation (Graph function) := by
  sorry

                                                            
theorem InjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔ ∀ left right, function left = function right → left = right := by
  sorry

                                                             
theorem SurjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output, ∃ input, function input = output := by
  sorry

                                                                                 
theorem SurjectiveIffRangeCoversCodomain {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output : Codomain, RangeClass function output := by
  sorry

end LRA.Function
