import LRA.VolumeI.Map.Operation.Laws.NumberEmbeddings.Definition

namespace LRA.Map.Operation.Laws.NumberEmbeddings

open LRA.Map.Operation

universe u v

/-- Failure of distinguished-element preservation by an embedding. -/
def FailsPreservesNullaryOperation {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceElement : NullaryOperation Source)
    (targetElement : NullaryOperation Target) : Prop :=
  Not (PreservesNullaryOperation embedding sourceElement targetElement)

/-- Failure of binary-operation preservation by an embedding. -/
def FailsPreservesBinaryOperation {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceOperation : BinaryEndoOperation Source)
    (targetOperation : BinaryEndoOperation Target) : Prop :=
  Not (PreservesBinaryOperation embedding sourceOperation targetOperation)

/-- Failure of injectivity for a map. -/
def FailsInjectiveMap {Source : Type u} {Target : Type v}
    (embedding : Source -> Target) : Prop :=
  Not (InjectiveMap embedding)

/-- Constant embedding from natural numbers to integers. -/
def ConstantZeroNaturalToIntegerEmbedding (_ : Nat) : Int :=
  0

/--
**[Failure Mode — ConstantZeroEmbeddingFailsPreservesOne]**

The constant-zero map from natural numbers to integers does not preserve the
distinguished element one.
-/
theorem ConstantZeroEmbeddingFailsPreservesOne :
    FailsPreservesNullaryOperation
      ConstantZeroNaturalToIntegerEmbedding
      1
      1 := by
  sorry

/--
**[Failure Mode — ConstantZeroEmbeddingFailsInjective]**

The constant-zero map from natural numbers to integers is not injective, so it
is not an embedding in the strong sense.
-/
theorem ConstantZeroEmbeddingFailsInjective :
    FailsInjectiveMap ConstantZeroNaturalToIntegerEmbedding := by
  sorry

/-- A three-point source used to witness insufficient result-carrier size. -/
inductive ThreePoint where
  | first
  | second
  | third
  deriving DecidableEq

/--
The equality-test operation on three points with boolean result carrier.

It distinguishes all diagonal inputs from all off-diagonal inputs.
-/
def ThreePointEqualityTest : BinaryOperation ThreePoint ThreePoint Bool :=
  fun left right => if left = right then true else false

private theorem ThreePointBoolEmbeddingCollision
    (embedding : ThreePoint -> Bool) :
    embedding ThreePoint.first = embedding ThreePoint.second \/
      embedding ThreePoint.first = embedding ThreePoint.third \/
        embedding ThreePoint.second = embedding ThreePoint.third := by
  sorry

/--
**[Failure Mode — ThreePointEqualityTestDoesNotFactorThroughBool]**

The equality test on a three-point source cannot factor both inputs through
embeddings into the two-point boolean result carrier.
-/
theorem ThreePointEqualityTestDoesNotFactorThroughBool :
    Not (MixedOperationResultCarrier ThreePointEqualityTest) := by
  sorry

end LRA.Map.Operation.Laws.NumberEmbeddings
