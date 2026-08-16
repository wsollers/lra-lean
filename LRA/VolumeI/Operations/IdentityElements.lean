/-!
Identity-element laws for generic binary operations.
-/

namespace LRA.Operation.IdentityElements

universe u

/--
TeX label: `def:left-identity`.

Logical form:

```lean
def LeftIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  ∀ element : Carrier, operation identity element = element
```
-/
def LeftIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  ∀ element : Carrier, operation identity element = element

/--
TeX label: `def:right-identity`.

Logical form:

```lean
def RightIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  ∀ element : Carrier, operation element identity = element
```
-/
def RightIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  ∀ element : Carrier, operation element identity = element

/--
TeX label: `def:two-sided-identity`.

Logical form:

```lean
def TwoSidedIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity ∧ RightIdentity operation identity
```
-/
def TwoSidedIdentity {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity ∧ RightIdentity operation identity

/--
TeX label: `def:absorbing-element`.

Logical form:

```lean
def AbsorbingElement {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (absorber : Carrier) : Prop :=
  (∀ element : Carrier, operation absorber element = absorber) ∧
    (∀ element : Carrier, operation element absorber = absorber)
```
-/
def AbsorbingElement {Carrier : Type u}
    (operation : Carrier -> Carrier -> Carrier)
    (absorber : Carrier) : Prop :=
  (∀ element : Carrier, operation absorber element = absorber) ∧
    (∀ element : Carrier, operation element absorber = absorber)

/--
TeX label: `lem:left-right-identities-coincide`.

Logical form:

```lean
theorem LeftRightIdentitiesCoincide {Carrier : Type u}
    {operation : Carrier -> Carrier -> Carrier}
    {leftIdentity rightIdentity : Carrier}
    (LeftIdentityLaw : LeftIdentity operation leftIdentity)
    (RightIdentityLaw : RightIdentity operation rightIdentity) :
    leftIdentity = rightIdentity
```
-/
theorem LeftRightIdentitiesCoincide {Carrier : Type u}
    {operation : Carrier -> Carrier -> Carrier}
    {leftIdentity rightIdentity : Carrier}
    (LeftIdentityLaw : LeftIdentity operation leftIdentity)
    (RightIdentityLaw : RightIdentity operation rightIdentity) :
    leftIdentity = rightIdentity := by
  sorry

/--
TeX label: `thm:uniqueness-of-identity`.

Logical form:

```lean
theorem UniquenessOfIdentity {Carrier : Type u}
    {operation : Carrier -> Carrier -> Carrier}
    {firstIdentity secondIdentity : Carrier}
    (FirstIdentityLaw : TwoSidedIdentity operation firstIdentity)
    (SecondIdentityLaw : TwoSidedIdentity operation secondIdentity) :
    firstIdentity = secondIdentity
```
-/
theorem UniquenessOfIdentity {Carrier : Type u}
    {operation : Carrier -> Carrier -> Carrier}
    {firstIdentity secondIdentity : Carrier}
    (FirstIdentityLaw : TwoSidedIdentity operation firstIdentity)
    (SecondIdentityLaw : TwoSidedIdentity operation secondIdentity) :
    firstIdentity = secondIdentity :=
  by
    sorry

end LRA.Operation.IdentityElements
