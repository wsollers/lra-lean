import LRA.VolumeI.Identity.Axioms

/-!
Contract home for equality congruence.
-/

namespace LRA.VolumeI.Identity

universe u

/-- Equality automatically respects predicates, relations, and binary operations. -/
theorem EqualityCongruence {Carrier : Type u}
    {Left LeftPrime Right RightPrime : Carrier}
    (LeftCoordinatesEqual : Left = LeftPrime)
    (RightCoordinatesEqual : Right = RightPrime) :
    (∀ Predicate : Carrier -> Prop, Predicate Left ↔ Predicate LeftPrime) ∧
      (∀ Relation : Carrier -> Carrier -> Prop,
        Relation Left Right ↔ Relation LeftPrime RightPrime) ∧
      (∀ Operation : Carrier -> Carrier -> Carrier,
        Operation Left Right = Operation LeftPrime RightPrime) :=
  CongruenceWithRespectToEqualityIsAutomatic
    LeftCoordinatesEqual
    RightCoordinatesEqual

end LRA.VolumeI.Identity
