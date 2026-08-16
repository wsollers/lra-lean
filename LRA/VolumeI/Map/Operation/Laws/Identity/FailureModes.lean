import LRA.VolumeI.Map.Operation.Laws.Identity.Definition

namespace LRA.Map.Operation.Laws.Identity

open LRA.Map.Operation

universe u

/-- Failure of a right-identity claim. -/
def FailsRightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightIdentity operation candidate)

/-- Failure of a left-identity claim. -/
def FailsLeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftIdentity operation candidate)

/-- The second projection operation on booleans. -/
def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right

/-- The first projection operation on booleans. -/
def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left

/--
**[Failure Mode — BooleanSecondProjectionLeftIdentityButNotRightIdentity]**

A concrete left identity need not be a right identity.
-/
theorem BooleanSecondProjectionLeftIdentityButNotRightIdentity :
    LeftIdentity BooleanSecondProjection false /\
      FailsRightIdentity BooleanSecondProjection false := by
  sorry

/--
**[Failure Mode — BooleanFirstProjectionRightIdentityButNotLeftIdentity]**

A concrete right identity need not be a left identity.
-/
theorem BooleanFirstProjectionRightIdentityButNotLeftIdentity :
    RightIdentity BooleanFirstProjection false /\
      FailsLeftIdentity BooleanFirstProjection false := by
  sorry

end LRA.Map.Operation.Laws.Identity
