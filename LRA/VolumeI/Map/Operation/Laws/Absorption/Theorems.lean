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
  intro element
  rcases law with ⟨firstAbsorbs, secondAbsorbs⟩
  have outer := firstAbsorbs element (first element element)
  have inner := secondAbsorbs element element
  rw [inner] at outer
  exact outer

/--
**[Theorem — MutualAbsorptionLaw.second_idempotent]**

In a mutually absorbing pair, the second operation is idempotent.
-/
theorem MutualAbsorptionLaw.second_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Map.Operation.Laws.Idempotent.Idempotent second :=
  MutualAbsorptionLaw.first_idempotent
    (Carrier := Carrier)
    (first := second)
    (second := first)
    ⟨law.2, law.1⟩

end LRA.Map.Operation.Laws.Absorption
