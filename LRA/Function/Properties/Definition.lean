import LRA.Function.Definition

namespace LRA.Function

universe u v

                                                            
abbrev Injective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.LeftUnique (Graph function)

                                                            
abbrev Surjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.RightTotal (Graph function)

                                                                           
def Bijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧ Surjective function

end LRA.Function
