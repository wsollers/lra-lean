import LRA.Identity.Constructions.Mathlib.Satisfies.FOL
import LRA.Identity.Interface.FirstOrder

namespace LRA.Identity.Constructions.Mathlib

/-- Native equality satisfies its strictly first-order interface. -/
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := NativeIdentity }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M := by
  sorry

end LRA.Identity.Constructions.Mathlib
