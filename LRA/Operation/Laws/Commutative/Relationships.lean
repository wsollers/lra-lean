import LRA.Operation.Laws.Commutative.Theorems
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

                                                                             
theorem Commutative.left_identity_to_right_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity) :
    LRA.Operation.Laws.Identity.RightIdentity operation identity := by
  sorry

                                                                             
theorem Commutative.right_identity_to_left_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity) :
    LRA.Operation.Laws.Identity.LeftIdentity operation identity := by
  sorry

                                                                                     
theorem Commutative.left_absorbing_to_right_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (leftAbsorbing : LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber := by
  sorry

                                                                                     
theorem Commutative.right_absorbing_to_left_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (rightAbsorbing : LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber := by
  sorry

end LRA.Operation.Laws.Commutative
