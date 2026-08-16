import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.NumberEmbeddings

open LRA.Map.Operation

universe u v w

/-- A map is injective when equal outputs force equal inputs. -/
def InjectiveMap {Source : Type u} {Target : Type v}
    (embedding : Source -> Target) : Prop :=
  forall {left right : Source},
    embedding left = embedding right -> left = right

/-- A map preserves a nullary operation, i.e. a distinguished element. -/
def PreservesNullaryOperation {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceElement : NullaryOperation Source)
    (targetElement : NullaryOperation Target) : Prop :=
  embedding sourceElement = targetElement

/-- A map preserves a unary operation. -/
def PreservesUnaryOperation {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceOperation : UnaryEndoOperation Source)
    (targetOperation : UnaryEndoOperation Target) : Prop :=
  forall element,
    embedding (sourceOperation element) = targetOperation (embedding element)

/-- A map preserves a binary operation. -/
def PreservesBinaryOperation {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceOperation : BinaryEndoOperation Source)
    (targetOperation : BinaryEndoOperation Target) : Prop :=
  forall left right,
    embedding (sourceOperation left right) =
      targetOperation (embedding left) (embedding right)

/-- A map preserves a relation. -/
def PreservesRelation {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceRelation : Source -> Source -> Prop)
    (targetRelation : Target -> Target -> Prop) : Prop :=
  forall left right,
    sourceRelation left right -> targetRelation (embedding left) (embedding right)

/-- A map reflects a relation when target-related embedded values came from source-related values. -/
def ReflectsRelation {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceRelation : Source -> Source -> Prop)
    (targetRelation : Target -> Target -> Prop) : Prop :=
  forall left right,
    targetRelation (embedding left) (embedding right) -> sourceRelation left right

/-- A map is a relation embedding when it both preserves and reflects a relation. -/
def RelationEmbedding {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceRelation : Source -> Source -> Prop)
    (targetRelation : Target -> Target -> Prop) : Prop :=
  PreservesRelation embedding sourceRelation targetRelation /\
    ReflectsRelation embedding sourceRelation targetRelation

/-- A map is a binary-operation embedding when it is injective and operation-preserving. -/
def BinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (embedding : Source -> Target)
    (sourceOperation : BinaryEndoOperation Source)
    (targetOperation : BinaryEndoOperation Target) : Prop :=
  InjectiveMap embedding /\
    PreservesBinaryOperation embedding sourceOperation targetOperation

/-- The left input carrier embeds into a chosen result carrier. -/
def LeftEmbeddableIntoResult {Left : Type u} {Result : Type w}
    (leftEmbedding : Left -> Result) : Prop :=
  InjectiveMap leftEmbedding

/-- The right input carrier embeds into a chosen result carrier. -/
def RightEmbeddableIntoResult {Right : Type v} {Result : Type w}
    (rightEmbedding : Right -> Result) : Prop :=
  InjectiveMap rightEmbedding

/--
A mixed binary operation obtained by embedding both inputs into a chosen result
carrier and then using a result-carrier endo-operation.
-/
def MixedBinaryOperationByEmbedding {Left : Type u} {Right : Type v}
    {Result : Type w}
    (leftEmbedding : Left -> Result)
    (rightEmbedding : Right -> Result)
    (resultOperation : BinaryEndoOperation Result) :
    BinaryOperation Left Right Result :=
  fun left right => resultOperation (leftEmbedding left) (rightEmbedding right)

/-- A mixed operation has the chosen result carrier as codomain. -/
def MixedOperationResultCarrier {Left : Type u} {Right : Type v} {Result : Type w}
    (operation : BinaryOperation Left Right Result) : Prop :=
  forall left right, exists result : Result, operation left right = result

end LRA.Map.Operation.Laws.NumberEmbeddings
