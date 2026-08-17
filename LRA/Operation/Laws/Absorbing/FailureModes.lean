import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/-- Failure of a right-absorbing claim. -/
def FailsRightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightAbsorbing operation candidate)

/-- Failure of a left-absorbing claim. -/
def FailsLeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftAbsorbing operation candidate)

/-- The first projection operation on booleans. -/
def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left

/-- The second projection operation on booleans. -/
def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right

/-- A concrete left absorber need not be a right absorber. -/
theorem BooleanFirstProjectionLeftAbsorbingButNotRightAbsorbing :
    LeftAbsorbing BooleanFirstProjection false ∧
      FailsRightAbsorbing BooleanFirstProjection false := by
  sorry

/-- A concrete right absorber need not be a left absorber. -/
theorem BooleanSecondProjectionRightAbsorbingButNotLeftAbsorbing :
    RightAbsorbing BooleanSecondProjection false ∧
      FailsLeftAbsorbing BooleanSecondProjection false := by
  sorry

end LRA.Operation.Laws.Absorbing
