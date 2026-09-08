import LRA.Identity.Constructions.Axiomatic.Satisfies.FOL
import LRA.Identity.Interface.FirstOrder

namespace LRA.Identity.Constructions.Axiomatic

/-- The axiomatic construction satisfies its strictly first-order interface. -/
theorem SatisfiesFirstOrderIdentity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    (Variable : Type) [DecidableEq Variable]
    (I : LRA.Logic.FirstOrder.Interpretation L.signature) :
    let M : LRA.Identity.Interface.FirstOrder.Model L :=
      { interpretation := I
        Identity := Ax_IdentityRelation }
    LRA.Identity.Interface.FirstOrder.Theory L Variable M := by
  sorry

end LRA.Identity.Constructions.Axiomatic
