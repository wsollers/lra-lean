import LRA.Operation.Laws.Identity.Definition

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

/-- Apply a left-identity law to an element. -/
theorem LeftIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : LeftIdentity operation identity)
    (element : Carrier) :
    operation identity element = element := by
  sorry

/-- Apply a right-identity law to an element. -/
theorem RightIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : RightIdentity operation identity)
    (element : Carrier) :
    operation element identity = element := by
  sorry

/-- A two-sided identity supplies a left identity. -/
theorem TwoSidedIdentity.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    LeftIdentity operation identity := by
  sorry

/-- A two-sided identity supplies a right identity. -/
theorem TwoSidedIdentity.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    RightIdentity operation identity := by
  sorry

/-- Left and right identity laws assemble into a two-sided identity law. -/
theorem TwoSidedIdentity.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (leftLaw : LeftIdentity operation identity)
    (rightLaw : RightIdentity operation identity) :
    TwoSidedIdentity operation identity := by
  sorry

end LRA.Operation.Laws.Identity
