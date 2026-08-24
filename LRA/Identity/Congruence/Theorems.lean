import LRA.Identity.Substitution

namespace LRA.Identity

universe u

/--
`CongruenceWithRespectToEqualityIsAutomatic` TODO

Predicate logic:

  (left = left' ∧ right = right') → ∀ predicate ∈ Carrier -> Prop, predicate left ↔ predicate left' ∧ ∀ relation ∈ Carrier -> Carrier -> Prop, relation left right ↔ relation left' right' ∧ ∀ operation ∈ Carrier -> Carrier -> Carrier, operation left right = operation left' right'

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left left' right right' : Carrier}, (left = left' ∧ right = right') → (∀ (predicate : Carrier → Prop), predicate left ↔ predicate left' ∧ (∀ (relation : Carrier → Carrier → Prop), relation left right ↔ relation left' right' ∧ ∀ (operation : Carrier → Carrier → Carrier), operation left right = operation left' right'))

Logical form (Lean):

```lean
theorem CongruenceWithRespectToEqualityIsAutomatic {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right') :
    (∀ predicate : Carrier -> Prop, predicate left ↔ predicate left') ∧
      (∀ relation : Carrier -> Carrier -> Prop,
        relation left right ↔ relation left' right') ∧
      (∀ operation : Carrier -> Carrier -> Carrier,
        operation left right = operation left' right')
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem CongruenceWithRespectToEqualityIsAutomatic {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right') :
    (∀ predicate : Carrier -> Prop, predicate left ↔ predicate left') ∧
      (∀ relation : Carrier -> Carrier -> Prop,
        relation left right ↔ relation left' right') ∧
      (∀ operation : Carrier -> Carrier -> Carrier,
        operation left right = operation left' right') := by
  sorry

/--
`EqualityCongruence` TODO

Predicate logic:

  (Left = LeftPrime ∧ Right = RightPrime) → ∀ Predicate ∈ Carrier -> Prop, Predicate Left ↔ Predicate LeftPrime ∧ ∀ Relation ∈ Carrier -> Carrier -> Prop, Relation Left Right ↔ Relation LeftPrime RightPrime ∧ ∀ Operation ∈ Carrier -> Carrier -> Carrier, Operation Left Right = Operation LeftPrime RightPrime

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {Left LeftPrime Right RightPrime : Carrier}, (Left = LeftPrime ∧ Right = RightPrime) → (∀ (Predicate : Carrier → Prop), Predicate Left ↔ Predicate LeftPrime ∧ (∀ (Relation : Carrier → Carrier → Prop), Relation Left Right ↔ Relation LeftPrime RightPrime ∧ ∀ (Operation : Carrier → Carrier → Carrier), Operation Left Right = Operation LeftPrime RightPrime))

Logical form (Lean):

```lean
theorem EqualityCongruence {Carrier : Type u}
    {Left LeftPrime Right RightPrime : Carrier}
    (LeftCoordinatesEqual : Left = LeftPrime)
    (RightCoordinatesEqual : Right = RightPrime) :
    (∀ Predicate : Carrier -> Prop, Predicate Left ↔ Predicate LeftPrime) ∧
      (∀ Relation : Carrier -> Carrier -> Prop,
        Relation Left Right ↔ Relation LeftPrime RightPrime) ∧
      (∀ Operation : Carrier -> Carrier -> Carrier,
        Operation Left Right = Operation LeftPrime RightPrime)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem EqualityCongruence {Carrier : Type u}
    {Left LeftPrime Right RightPrime : Carrier}
    (LeftCoordinatesEqual : Left = LeftPrime)
    (RightCoordinatesEqual : Right = RightPrime) :
    (∀ Predicate : Carrier -> Prop, Predicate Left ↔ Predicate LeftPrime) ∧
      (∀ Relation : Carrier -> Carrier -> Prop,
        Relation Left Right ↔ Relation LeftPrime RightPrime) ∧
      (∀ Operation : Carrier -> Carrier -> Carrier,
        Operation Left Right = Operation LeftPrime RightPrime) := by
  sorry

end LRA.Identity
