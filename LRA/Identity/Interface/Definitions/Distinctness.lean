namespace LRA.Identity

universe u

def Distinct {Carrier : Type u} (left right : Carrier) : Prop :=
  ¬ left = right

end LRA.Identity
