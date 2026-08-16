import LRA.VolumeI.Map.Operation.Laws.Absorption.Definition
import LRA.VolumeI.Map.Operation.Laws.Idempotent.Definition

namespace LRA.Map.Operation.Laws.Absorption

open LRA.Map.Operation

universe u

/--
**[Theorem — MutualAbsorptionLaw.first_idempotent]**

In a mutually absorbing pair, the first operation is idempotent.
-/
theorem MutualAbsorptionLaw.first_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Map.Operation.Laws.Idempotent.Idempotent first := by
  sorry

/--
**[Theorem — MutualAbsorptionLaw.second_idempotent]**

In a mutually absorbing pair, the second operation is idempotent.
-/
theorem MutualAbsorptionLaw.second_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Map.Operation.Laws.Idempotent.Idempotent second := by
  sorry

end LRA.Map.Operation.Laws.Absorption
