import LRA.VolumeI.Map.Operation.Laws.NumberEmbeddings.Theorems

namespace LRA.Map.Operation.Laws.NumberEmbeddings

open LRA.Map.Operation

/-- Natural numbers embed into integers. -/
def NaturalToIntegerEmbedding (number : Nat) : Int :=
  Int.ofNat number

/-- Integer addition as a target-carrier operation. -/
def IntegerAdditionForEmbeddingExample : BinaryEndoOperation Int :=
  fun left right => left + right

/-- Mixed natural/integer addition by embedding the natural into integers. -/
def NaturalIntegerAdditionByEmbedding : BinaryOperation Nat Int Int :=
  MixedBinaryOperationByEmbedding
    NaturalToIntegerEmbedding
    (fun integer : Int => integer)
    IntegerAdditionForEmbeddingExample

/--
**[Example — NaturalIntegerAdditionHasIntegerResultCarrier]**

Adding a natural number to an integer by embedding has integer result carrier.
-/
theorem NaturalIntegerAdditionHasIntegerResultCarrier :
    MixedOperationResultCarrier NaturalIntegerAdditionByEmbedding := by
  sorry

end LRA.Map.Operation.Laws.NumberEmbeddings
