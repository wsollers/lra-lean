import LRA.Operation.Laws.Absorption.Definition
import LRA.Operation.Laws.Idempotent.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

                                                                       
theorem MutualAbsorptionLaw.first_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent first := by
  sorry

                                                                        
theorem MutualAbsorptionLaw.second_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent second := by
  sorry

end LRA.Operation.Laws.Absorption
