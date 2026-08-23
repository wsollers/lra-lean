import LRA.Operation.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

                                                                         

                                                                                 
def AbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  ∀ left right, outer left (inner left right) = left

                                                                               
def MutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  AbsorptionLaw first second ∧ AbsorptionLaw second first

end LRA.Operation.Laws.Absorption
