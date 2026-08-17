import LRA.Operation.Laws.Commutative.Theorems
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/-- For a commutative operation, a left identity is also a right identity. -/
theorem Commutative.left_identity_to_right_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity) :
    LRA.Operation.Laws.Identity.RightIdentity operation identity := by
  sorry

/-- For a commutative operation, a right identity is also a left identity. -/
theorem Commutative.right_identity_to_left_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity) :
    LRA.Operation.Laws.Identity.LeftIdentity operation identity := by
  sorry

/-- For a commutative operation, a left absorbing element is also right absorbing. -/
theorem Commutative.left_absorbing_to_right_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (leftAbsorbing : LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber := by
  sorry

/-- For a commutative operation, a right absorbing element is also left absorbing. -/
theorem Commutative.right_absorbing_to_left_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (rightAbsorbing : LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber := by
  sorry

end LRA.Operation.Laws.Commutative
