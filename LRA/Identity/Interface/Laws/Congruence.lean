import LRA.Identity.Interface.Laws.Substitution

namespace LRA.Identity

universe u

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
