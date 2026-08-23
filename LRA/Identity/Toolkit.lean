import LRA.Identity.Axioms
import LRA.Identity.Equality
import LRA.Identity.Substitution

namespace LRA.Identity

universe u v

                                                    

                                              
theorem EqualityReasoningByReflexivity {Carrier : Type u} (x : Carrier) :
    x = x := by
  sorry

                                 
theorem EqualityReasoningBySymmetry {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y) :
    y = x := by
  sorry

                                   
theorem EqualityReasoningByTransitivity {Carrier : Type u} {x y z : Carrier}
    (FirstEquality : x = y)
    (SecondEquality : y = z) :
    x = z := by
  sorry

                                                  
theorem RewritePropertyByEquality {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y)
    (Property : Carrier -> Prop) :
    Property x ↔ Property y := by
  sorry

                                                        
theorem RewriteFunctionByEquality {Domain : Type u} {Codomain : Type v}
    {x y : Domain}
    (EqualityProof : x = y)
    (function : Domain -> Codomain) :
    function x = function y := by
  sorry

                                                                          
theorem RewriteRelationLeftByEquality {Carrier : Type u}
    {x y z : Carrier}
    (EqualityProof : x = y)
    (relation : Carrier -> Carrier -> Prop) :
    relation x z ↔ relation y z := by
  sorry

end LRA.Identity
