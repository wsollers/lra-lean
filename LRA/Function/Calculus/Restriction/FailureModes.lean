import LRA.Function.Calculus.Restriction.Definition

   
                                                                        
                                                   
  

namespace LRA.Function

universe u v w

                                                                 
def MultipleExtensions {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : LRA.Function SmallDomain Codomain)
    (inclusion : LRA.Function SmallDomain LargeDomain) : Prop :=
  ∃ first second : LRA.Function LargeDomain Codomain,
    first ≠ second ∧ Extends first original inclusion ∧ Extends second original inclusion

end LRA.Function
