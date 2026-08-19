namespace LRA.Identity

universe u

/-- Distinctness is negated equality. -/
def Distinct {Carrier : Type u} (left right : Carrier) : Prop :=
  ¬ left = right

end LRA.Identity
