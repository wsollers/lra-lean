/-!
Identity-element laws for generic binary operations.
-/

namespace LRA.VolumeI.Operations.IdentityElements

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
  sorry

/-- TeX label: `thm:uniqueness-of-identity`. -/
theorem UniquenessOfIdentity {Carrier : Type u}
    {operation : Carrier -> Carrier -> Carrier}
    {firstIdentity secondIdentity : Carrier}
    (first_identity_law : TwoSidedIdentity operation firstIdentity)
    (second_identity_law : TwoSidedIdentity operation secondIdentity) :
    firstIdentity = secondIdentity :=
  by
    sorry

end LRA.VolumeI.Operations.IdentityElements
