import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

theorem LeftInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    operation (inverse element) element = identity := by
  sorry

theorem RightInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    operation element (inverse element) = identity := by
  sorry

theorem LeftInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : LeftInverseOf operation identity element inverse) :
    operation inverse element = identity := by
  sorry

theorem RightInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : RightInverseOf operation identity element inverse) :
    operation element inverse = identity := by
  sorry

theorem TwoSidedInverseOf.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
    LeftInverseOf operation identity element inverse := by
  sorry

theorem TwoSidedInverseOf.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
    RightInverseOf operation identity element inverse := by
  sorry

theorem TwoSidedInverseOf.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (leftLaw : LeftInverseOf operation identity element inverse)
    (rightLaw : RightInverseOf operation identity element inverse) :
    TwoSidedInverseOf operation identity element inverse := by
  sorry

theorem LeftInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : LeftInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, LeftInverseOf operation identity element inverse := by
  sorry

theorem RightInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : RightInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, RightInverseOf operation identity element inverse := by
  sorry

theorem TwoSidedInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : TwoSidedInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, TwoSidedInverseOf operation identity element inverse := by
  sorry

theorem TwoSidedInverse.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    LeftInverse operation identity inverse := by
  sorry

theorem TwoSidedInverse.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    RightInverse operation identity inverse := by
  sorry

theorem TwoSidedInverse.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (leftLaw : LeftInverse operation identity inverse)
    (rightLaw : RightInverse operation identity inverse) :
    TwoSidedInverse operation identity inverse := by
  sorry

end LRA.Operation.Laws.Inverse
