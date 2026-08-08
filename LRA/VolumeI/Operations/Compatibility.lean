import LRA.VolumeI.Operations.Laws
import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.VolumeI.Operations

universe u

/-- A unary operation respects a binary relation. -/
def UnaryOperationRespectsRelation {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall left right,
    relation left right -> relation (operation left) (operation right)

/-- A binary operation respects a binary relation coordinatewise. -/
def BinaryOperationRespectsRelation {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (operation : BinaryOperation Alpha) : Prop :=
  forall firstLeft firstRight secondLeft secondRight,
    relation firstLeft firstRight ->
      relation secondLeft secondRight ->
        relation (operation firstLeft secondLeft)
          (operation firstRight secondRight)

/-- A binary operation respects an equivalence relation. -/
def RespectsEquivalence {Alpha : Type u}
    (equivalenceRelation : LRA.VolumeI.Relations.Endorelation Alpha)
    (operation : BinaryOperation Alpha) : Prop :=
  LRA.VolumeI.Relations.Equivalence equivalenceRelation /\
    BinaryOperationRespectsRelation equivalenceRelation operation

/-- Monotonicity of a unary operation with respect to an order relation. -/
def Monotone {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  UnaryOperationRespectsRelation relation operation

/-- Extensiveness of a unary operation with respect to an order relation. -/
def Extensive {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall element, relation element (operation element)

/-- Idempotence of a unary operation under composition. -/
def UnaryIdempotent {Alpha : Type u}
    (operation : UnaryOperation Alpha) : Prop :=
  forall element, operation (operation element) = operation element

/-- A closure operator is extensive, monotone, and idempotent. -/
def ClosureOperator {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  Extensive relation operation /\
    Monotone relation operation /\
      UnaryIdempotent operation

/-- Strict monotonicity of a unary operation with respect to a strict order. -/
def StrictMonotone {Alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall left right,
    strictRelation left right ->
      strictRelation (operation left) (operation right)

end LRA.VolumeI.Operations
