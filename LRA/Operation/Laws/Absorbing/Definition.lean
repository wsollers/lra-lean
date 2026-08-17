import LRA.Operation.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/-- Left-absorbing law for a binary endo-operation. -/
def LeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation absorber element = absorber

/-- Right-absorbing law for a binary endo-operation. -/
def RightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation element absorber = absorber

/-- Two-sided absorbing law for a binary endo-operation. -/
def TwoSidedAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber

end LRA.Operation.Laws.Absorbing
