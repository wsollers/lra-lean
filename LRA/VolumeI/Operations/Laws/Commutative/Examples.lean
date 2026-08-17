import LRA.VolumeI.Operations.Laws.Commutative.Relationships

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

/-- Natural-number addition as the running commutativity example. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Example — NaturalAdditionCommutative]**

Natural-number addition is commutative.
-/
theorem NaturalAdditionCommutative :
    Commutative NaturalAddition := by
  sorry

end LRA.Operation.Laws.Commutative
