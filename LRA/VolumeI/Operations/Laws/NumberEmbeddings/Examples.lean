import LRA.VolumeI.Operations.Laws.NumberEmbeddings.Theorems

namespace LRA.Operation.Laws.NumberEmbeddings

open LRA.Operation

/-- Natural numbers embed into integers. -/
def NaturalToIntegerEmbedding (number : Nat) : Int :=
  Int.ofNat number

/-- Integer addition as a target-carrier operation. -/
def IntegerAdditionForEmbeddingExample : BinaryEndoOperation Int :=
  fun left right => left + right

/-- Mixed natural/integer addition by embedding the natural into integers. -/
def NaturalIntegerAdditionByEmbedding : HeterogeneousBinaryOperation Nat Int Int :=
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

end LRA.Operation.Laws.NumberEmbeddings
