import LRA.VolumeI.Operations.Laws.Associative.Relationships

namespace LRA.Operation.Laws.Associative

open LRA.Operation

/-- Natural-number addition as the running associativity example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionAssociative]**

Natural-number addition is associative.
-/
theorem NaturalAdditionAssociative :
    Associative NaturalAddition := by
  sorry

end LRA.Operation.Laws.Associative
