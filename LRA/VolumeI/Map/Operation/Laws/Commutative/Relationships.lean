import LRA.VolumeI.Map.Operation.Laws.Commutative.Theorems
import LRA.VolumeI.Map.Operation.Laws.Identity.Definition
import LRA.VolumeI.Map.Operation.Laws.Absorbing.Definition
import LRA.VolumeI.Map.Operation.Laws.EquationalLogic.Consequences

namespace LRA.Map.Operation.Laws.Commutative

open LRA.Map.Operation

universe u

/--
**[Theorem — Commutative.left_identity_to_right_identity]**

For a commutative operation, a left identity is also a right identity.
-/
theorem Commutative.left_identity_to_right_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (leftIdentity :
      LRA.Map.Operation.Laws.Identity.LeftIdentity operation identity) :
    LRA.Map.Operation.Laws.Identity.RightIdentity operation identity := by
  sorry

/--
**[Theorem — Commutative.right_identity_to_left_identity]**

For a commutative operation, a right identity is also a left identity.
-/
theorem Commutative.right_identity_to_left_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (rightIdentity :
      LRA.Map.Operation.Laws.Identity.RightIdentity operation identity) :
    LRA.Map.Operation.Laws.Identity.LeftIdentity operation identity := by
  sorry

/--
**[Theorem — Commutative.left_absorbing_to_right_absorbing]**

For a commutative operation, a left absorbing element is also right absorbing.
-/
theorem Commutative.left_absorbing_to_right_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (leftAbsorbing :
      LRA.Map.Operation.Laws.Absorbing.LeftAbsorbing operation absorber) :
    LRA.Map.Operation.Laws.Absorbing.RightAbsorbing operation absorber := by
  sorry

/--
**[Theorem — Commutative.right_absorbing_to_left_absorbing]**

For a commutative operation, a right absorbing element is also left absorbing.
-/
theorem Commutative.right_absorbing_to_left_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (rightAbsorbing :
      LRA.Map.Operation.Laws.Absorbing.RightAbsorbing operation absorber) :
    LRA.Map.Operation.Laws.Absorbing.LeftAbsorbing operation absorber := by
  sorry

/--
**[Theorem — Commutative.operation_equality_requirements]**

Every binary operation consumes the standard equality relation: the identity
relation is an equivalence relation and the operation respects it. This
namespaced theorem is a citation hook for the commutative law family, not a
consequence of commutativity.
-/
theorem Commutative.operation_equality_requirements {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    LRA.Map.Operation.Laws.EquationalLogic.BinaryOperationEqualityRequirements
      operation := by
  sorry

end LRA.Map.Operation.Laws.Commutative
