import LRA.Function.Calculus.Classes.Definition

   
                                                                         
                                                                           
                                                                     
  

namespace LRA.Function

universe u v

                                                  
theorem GraphRelatesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    Graph function input (function input) := by
  sorry

                                                                     
theorem GraphOutputEqualsValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain)
    (related : Graph function input output) :
    output = function input := by
  sorry

                                                                  
theorem PointImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain) :
    PointImageClass function input output ↔ output = function input := by
  sorry

                                                                          
theorem FiberClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) (input : Domain) :
    FiberClass function output input ↔ output = function input := by
  sorry

                                                                      
theorem RangeClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) :
    RangeClass function output ↔
      ∃ input, output = function input := by
  sorry

                                                                            
theorem ImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : LRA.Set.SetClass Domain)
    (output : Codomain) :
    ImageClass function source output ↔
      ∃ input, source input ∧ output = function input := by
  sorry

                                                                                
theorem PreimageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : LRA.Set.SetClass Codomain)
    (input : Domain) :
    PreimageClass function target input ↔
      target (function input) := by
  sorry

end LRA.Function
