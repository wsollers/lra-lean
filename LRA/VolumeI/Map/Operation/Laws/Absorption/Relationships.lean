import LRA.VolumeI.Map.Operation.Laws.Absorption.Theorems

namespace LRA.Map.Operation.Laws.Absorption

open LRA.Map.Operation

universe u

/--
**[Relationship — MutualAbsorptionLaw.idempotent_pair]**

Mutual absorption relates the two-operation absorption vocabulary to the
single-operation idempotence vocabulary.
-/
theorem MutualAbsorptionLaw.idempotent_pair {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Map.Operation.Laws.Idempotent.Idempotent first /\
      LRA.Map.Operation.Laws.Idempotent.Idempotent second := by
  sorry

end LRA.Map.Operation.Laws.Absorption
