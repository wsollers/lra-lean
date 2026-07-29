/-!
TeX-facing identity-element laws for Volume II.

This file models the formal environments in
`arithmetic-operations-relations/notes/identity-elements`.
-/

namespace LRA
namespace VolumeII
namespace Foundations
namespace IdentityElements

universe u

/-- TeX label: `def:left-identity`. -/
def LeftIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  ∀ element : Carrier, operation identity element = element

/-- TeX label: `def:right-identity`. -/
def RightIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  ∀ element : Carrier, operation element identity = element

/-- TeX label: `def:two-sided-identity`. -/
def TwoSidedIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity ∧ RightIdentity operation identity

/-- TeX label: `def:absorbing-element`. -/
def AbsorbingElement {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (absorber : Carrier) : Prop :=
  (∀ element : Carrier, operation absorber element = absorber) ∧
    (∀ element : Carrier, operation element absorber = absorber)

/-- TeX label: `lem:left-right-identities-coincide`. -/
theorem LeftRightIdentitiesCoincide {Carrier : Type u}
    {operation : Carrier -> Carrier -> Carrier}
    {leftIdentity rightIdentity : Carrier}
    (left_identity_law : LeftIdentity operation leftIdentity)
    (right_identity_law : RightIdentity operation rightIdentity) :
    leftIdentity = rightIdentity := by
  calc
    leftIdentity = operation leftIdentity rightIdentity := by
      exact (right_identity_law leftIdentity).symm
    _ = rightIdentity := by
      exact left_identity_law rightIdentity

/-- TeX label: `thm:uniqueness-of-identity`. -/
theorem UniquenessOfIdentity {Carrier : Type u}
    {operation : Carrier -> Carrier -> Carrier}
    {firstIdentity secondIdentity : Carrier}
    (first_identity_law : TwoSidedIdentity operation firstIdentity)
    (second_identity_law : TwoSidedIdentity operation secondIdentity) :
    firstIdentity = secondIdentity :=
  LeftRightIdentitiesCoincide first_identity_law.left second_identity_law.right

end IdentityElements
end Foundations
end VolumeII
end LRA
