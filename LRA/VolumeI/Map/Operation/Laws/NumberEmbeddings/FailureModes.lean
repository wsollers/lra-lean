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

end LRA.Map.Operation.Laws.NumberEmbeddings
