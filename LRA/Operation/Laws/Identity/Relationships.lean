import LRA.Operation.Laws.Identity.Theorems

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

/--
`LeftRightIdentitiesCoincide` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {leftIdentity rightIdentity : Carrier}, (LRA.Operation.Laws.Identity.LeftIdentity operation leftIdentity ∧ LRA.Operation.Laws.Identity.RightIdentity operation rightIdentity) → leftIdentity = rightIdentity

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    leftIdentity rightIdentity : Carrier
    leftLaw : LeftIdentity operation leftIdentity
    rightLaw : RightIdentity operation rightIdentity
  Prove
    ((∀ (element : Carrier), operation leftIdentity element = element) ∧ (∀ (element : Carrier), operation element rightIdentity = element)) → leftIdentity = rightIdentity

Logical form (Lean):

```lean
theorem LeftRightIdentitiesCoincide {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {leftIdentity rightIdentity : Carrier}
    (leftLaw : LeftIdentity operation leftIdentity)
    (rightLaw : RightIdentity operation rightIdentity) :
    leftIdentity = rightIdentity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem LeftRightIdentitiesCoincide {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {leftIdentity rightIdentity : Carrier}
    (leftLaw : LeftIdentity operation leftIdentity)
    (rightLaw : RightIdentity operation rightIdentity) :
    leftIdentity = rightIdentity := by
  sorry
/--
`TwoSidedIdentityUnique` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {firstIdentity secondIdentity : Carrier}, (LRA.Operation.Laws.Identity.TwoSidedIdentity operation firstIdentity ∧ LRA.Operation.Laws.Identity.TwoSidedIdentity operation secondIdentity) → firstIdentity = secondIdentity

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    firstIdentity secondIdentity : Carrier
    firstLaw : TwoSidedIdentity operation firstIdentity
    secondLaw : TwoSidedIdentity operation secondIdentity
  Prove
    (((∀ (element : Carrier), operation firstIdentity element = element) ∧ (∀ (element : Carrier), operation element firstIdentity = element)) ∧ ((∀ (element : Carrier), operation secondIdentity element = element) ∧ (∀ (element : Carrier), operation element secondIdentity = element))) → firstIdentity = secondIdentity

Logical form (Lean):

```lean
theorem TwoSidedIdentityUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {firstIdentity secondIdentity : Carrier}
    (firstLaw : TwoSidedIdentity operation firstIdentity)
    (secondLaw : TwoSidedIdentity operation secondIdentity) :
    firstIdentity = secondIdentity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TwoSidedIdentityUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {firstIdentity secondIdentity : Carrier}
    (firstLaw : TwoSidedIdentity operation firstIdentity)
    (secondLaw : TwoSidedIdentity operation secondIdentity) :
    firstIdentity = secondIdentity := by
  sorry
end LRA.Operation.Laws.Identity
