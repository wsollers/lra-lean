import LRA.VolumeI.Operations.Laws.Absorption.Theorems

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

/--
**[Relationship — MutualAbsorptionLaw.idempotent_pair]**

Mutual absorption relates the two-operation absorption vocabulary to the
single-operation idempotence vocabulary.
-/
theorem MutualAbsorptionLaw.idempotent_pair {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent first /\
      LRA.Operation.Laws.Idempotent.Idempotent second := by
  sorry

end LRA.Operation.Laws.Absorption
