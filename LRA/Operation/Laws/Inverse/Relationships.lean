import LRA.Operation.Laws.Inverse.Theorems
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Cancellation.Definition
import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

theorem LeftInverseEqualsRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element leftCandidate rightCandidate : Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (leftInverseLaw : operation leftCandidate element = identity)
    (rightInverseLaw : operation element rightCandidate = identity) :
    leftCandidate = rightCandidate := by
  sorry


theorem TwoSidedInverseUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {firstInverse secondInverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (firstLaw : TwoSidedInverse operation identity firstInverse)
    (secondLaw : TwoSidedInverse operation identity secondInverse) :
    firstInverse = secondInverse := by
  sorry


theorem LeftCancellativeOfLeftInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity)
    (leftInverse : LeftInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.LeftCancellative operation := by
  sorry


theorem RightCancellativeOfRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity)
    (rightInverse : RightInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.RightCancellative operation := by
  sorry


theorem LeftInverse.to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    LeftInverseOf operation identity element (inverse element) := by
  sorry


theorem RightInverse.to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    RightInverseOf operation identity element (inverse element) := by
  sorry


theorem TwoSidedInverse.to_two_sided_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse)
    (element : Carrier) :
    TwoSidedInverseOf operation identity element (inverse element) := by
  sorry


theorem Commutative.left_inverse_of_to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverseOf operation identity element inverse) :
    RightInverseOf operation identity element inverse := by
  sorry


theorem Commutative.right_inverse_of_to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverseOf operation identity element inverse) :
    LeftInverseOf operation identity element inverse := by
  sorry


theorem Commutative.left_inverse_to_right_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverse operation identity inverse) :
    RightInverse operation identity inverse := by
  sorry


theorem Commutative.right_inverse_to_left_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverse operation identity inverse) :
    LeftInverse operation identity inverse := by
  sorry

end LRA.Operation.Laws.Inverse
