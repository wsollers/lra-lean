import LRA.VolumeI.Operations.Laws.Absorption.Definition
import LRA.VolumeI.Operations.Laws.Idempotent.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

/--
**[Theorem — MutualAbsorptionLaw.first_idempotent]**

In a mutually absorbing pair, the first operation is idempotent.
-/
theorem MutualAbsorptionLaw.first_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent first := by
  sorry

/--
**[Theorem — MutualAbsorptionLaw.second_idempotent]**

In a mutually absorbing pair, the second operation is idempotent.
-/
theorem MutualAbsorptionLaw.second_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent second := by
  sorry

end LRA.Operation.Laws.Absorption
