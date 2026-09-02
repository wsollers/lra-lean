import LRA.Operation.Laws.Absorbing.Theorems

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/--
`LeftRightAbsorbersCoincide` TODO

Predicate logic:

  leftAbsorber = rightAbsorber

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {leftAbsorber rightAbsorber : Carrier}, (∀ (element : Carrier), operation leftAbsorber element = leftAbsorber ∧ ∀ (element : Carrier), operation element rightAbsorber = rightAbsorber) → leftAbsorber = rightAbsorber

Logical form (Lean):

```lean
theorem LeftRightAbsorbersCoincide {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {leftAbsorber rightAbsorber : Carrier}
    (leftLaw : LeftAbsorbing operation leftAbsorber)
    (rightLaw : RightAbsorbing operation rightAbsorber) :
    leftAbsorber = rightAbsorber
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
theorem LeftRightAbsorbersCoincide {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {leftAbsorber rightAbsorber : Carrier}
    (leftLaw : LeftAbsorbing operation leftAbsorber)
    (rightLaw : RightAbsorbing operation rightAbsorber) :
    leftAbsorber = rightAbsorber := by
  sorry
/--
`TwoSidedAbsorbingUnique` TODO

Predicate logic:

  firstAbsorber = secondAbsorber

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {firstAbsorber secondAbsorber : Carrier}, ((∀ (element : Carrier), operation firstAbsorber element = firstAbsorber ∧ ∀ (element : Carrier), operation element firstAbsorber = firstAbsorber) ∧ (∀ (element : Carrier), operation secondAbsorber element = secondAbsorber ∧ ∀ (element : Carrier), operation element secondAbsorber = secondAbsorber)) → firstAbsorber = secondAbsorber

Logical form (Lean):

```lean
theorem TwoSidedAbsorbingUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {firstAbsorber secondAbsorber : Carrier}
    (firstLaw : TwoSidedAbsorbing operation firstAbsorber)
    (secondLaw : TwoSidedAbsorbing operation secondAbsorber) :
    firstAbsorber = secondAbsorber
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
theorem TwoSidedAbsorbingUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {firstAbsorber secondAbsorber : Carrier}
    (firstLaw : TwoSidedAbsorbing operation firstAbsorber)
    (secondLaw : TwoSidedAbsorbing operation secondAbsorber) :
    firstAbsorber = secondAbsorber := by
  sorry
end LRA.Operation.Laws.Absorbing
