import LRA.Identity.Constructions.Leibniz.Consequences.Substitution

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
  constructor
  . -- left
    intro arbitraryPredicate
    rw [LeftsAreEqual]

  . -- right
    constructor
    . -- right.left
      intro arbitraryRelation
      rw [LeftsAreEqual]
      rw [RightsAreEqual]

    . -- right

      intro arbitraryOperation
      rw [LeftsAreEqual]
      rw [RightsAreEqual]


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
    (∀ Predicate : Carrier → Prop, Predicate Left ↔ Predicate LeftPrime) ∧
      (∀ Relation : Carrier → Carrier → Prop,
        Relation Left Right ↔ Relation LeftPrime RightPrime) ∧
      (∀ Operation : Carrier → Carrier → Carrier,
        Operation Left Right = Operation LeftPrime RightPrime) := by
  constructor
  · -- Part 1: Predicates (∀ Predicate, Predicate Left ↔ Predicate LeftPrime)
    intro arbitraryPredicate
    constructor
    · -- (→) Forward direction
      intro hypothesis
      rw [LeftCoordinatesEqual] at hypothesis
      exact hypothesis
    · -- (←) Backward direction
      intro hypothesis
      rw [LeftCoordinatesEqual.symm] at hypothesis
      exact hypothesis
  · -- Remaining conjunction: Relations ∧ Operations
    constructor
    · -- Part 2: Relations (∀ Relation, Relation Left Right ↔ Relation LeftPrime RightPrime)
      intro arbitraryRelation
      constructor
      · -- (→) Forward direction
        intro hypothesis
        rw [LeftCoordinatesEqual] at hypothesis
        rw [RightCoordinatesEqual] at hypothesis
        exact hypothesis
      · -- (←) Backward direction
        intro hypothesis
        rw [LeftCoordinatesEqual.symm] at hypothesis
        rw [RightCoordinatesEqual.symm] at hypothesis
        exact hypothesis
    · -- Part 3: Operations (∀ Operation, Operation Left Right = Operation LeftPrime RightPrime)
      intro arbitraryOperation
      rw [LeftCoordinatesEqual, RightCoordinatesEqual]









end LRA.Identity
