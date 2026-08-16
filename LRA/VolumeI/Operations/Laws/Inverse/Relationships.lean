import LRA.VolumeI.Operations.Laws.Inverse.Theorems
import LRA.VolumeI.Operations.Laws.Associative.Definition
import LRA.VolumeI.Operations.Laws.Identity.Definition
import LRA.VolumeI.Operations.Laws.Cancellation.Definition
import LRA.VolumeI.Operations.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

/--
**[Theorem — LeftInverseEqualsRightInverse]**

For an associative operation with a two-sided identity, a left inverse and a
right inverse of the same element coincide.
-/
theorem LeftInverseEqualsRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element leftCandidate rightCandidate : Carrier}
    (associative :
      LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw :
      LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (leftInverseLaw : operation leftCandidate element = identity)
    (rightInverseLaw : operation element rightCandidate = identity) :
    leftCandidate = rightCandidate := by
  sorry

/--
**[Theorem — TwoSidedInverseUnique]**

For an associative operation with a two-sided identity, a two-sided inverse
operation is unique.
-/
theorem TwoSidedInverseUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {firstInverse secondInverse : UnaryEndoOperation Carrier}
    (associative :
      LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw :
      LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (firstLaw : TwoSidedInverse operation identity firstInverse)
    (secondLaw : TwoSidedInverse operation identity secondInverse) :
    firstInverse = secondInverse := by
  sorry

/--
**[Theorem — LeftCancellativeOfLeftInverse]**

Associativity, a left identity, and a left inverse operation imply left
cancellation.
-/
theorem LeftCancellativeOfLeftInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative :
      LRA.Operation.Laws.Associative.Associative operation)
    (leftIdentity :
      LRA.Operation.Laws.Identity.LeftIdentity operation identity)
    (leftInverse : LeftInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.LeftCancellative operation := by
  sorry

/--
**[Theorem — RightCancellativeOfRightInverse]**

Associativity, a right identity, and a right inverse operation imply right
cancellation.
-/
theorem RightCancellativeOfRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative :
      LRA.Operation.Laws.Associative.Associative operation)
    (rightIdentity :
      LRA.Operation.Laws.Identity.RightIdentity operation identity)
    (rightInverse : RightInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.RightCancellative operation := by
  sorry

/-- A total left-inverse operation gives a left inverse for each element. -/
theorem LeftInverse.to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    LeftInverseOf operation identity element (inverse element) := by
  sorry

/-- A total right-inverse operation gives a right inverse for each element. -/
theorem RightInverse.to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    RightInverseOf operation identity element (inverse element) := by
  sorry

/-- A total two-sided inverse operation gives a two-sided inverse for each element. -/
theorem TwoSidedInverse.to_two_sided_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse)
    (element : Carrier) :
    TwoSidedInverseOf operation identity element (inverse element) := by
  sorry

/-- Under commutativity, a pointwise left inverse is also a pointwise right inverse. -/
theorem Commutative.left_inverse_of_to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverseOf operation identity element inverse) :
    RightInverseOf operation identity element inverse := by
  sorry

/-- Under commutativity, a pointwise right inverse is also a pointwise left inverse. -/
theorem Commutative.right_inverse_of_to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverseOf operation identity element inverse) :
    LeftInverseOf operation identity element inverse := by
  sorry

/-- Under commutativity, a total left inverse operation is also a right inverse operation. -/
theorem Commutative.left_inverse_to_right_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverse operation identity inverse) :
    RightInverse operation identity inverse := by
  sorry

/-- Under commutativity, a total right inverse operation is also a left inverse operation. -/
theorem Commutative.right_inverse_to_left_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverse operation identity inverse) :
    LeftInverse operation identity inverse := by
  sorry

end LRA.Operation.Laws.Inverse
