import LRA.VolumeI.Operations.Laws
import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Algebra.Operation

universe u

/--
A unary operation respects a binary relation.

Logical form:

```lean
def UnaryOperationRespectsRelation {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall left right,
    relation left right -> relation (operation left) (operation right)
```
-/
def UnaryOperationRespectsRelation {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall left right,
    relation left right -> relation (operation left) (operation right)

/--
A binary operation respects a binary relation coordinatewise.

Logical form:

```lean
def BinaryOperationRespectsRelation {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : BinaryOperation Alpha) : Prop :=
  forall firstLeft firstRight secondLeft secondRight,
    relation firstLeft firstRight ->
      relation secondLeft secondRight ->
        relation (operation firstLeft secondLeft)
          (operation firstRight secondRight)
```
-/
def BinaryOperationRespectsRelation {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : BinaryOperation Alpha) : Prop :=
  forall firstLeft firstRight secondLeft secondRight,
    relation firstLeft firstRight ->
      relation secondLeft secondRight ->
        relation (operation firstLeft secondLeft)
          (operation firstRight secondRight)

/--
A binary operation respects an equivalence relation.

Logical form:

```lean
def RespectsEquivalence {Alpha : Type u}
    (equivalenceRelation : LRA.Relation.Endorelation Alpha)
    (operation : BinaryOperation Alpha) : Prop :=
  LRA.Relation.Equivalence equivalenceRelation /\
    BinaryOperationRespectsRelation equivalenceRelation operation
```
-/
def RespectsEquivalence {Alpha : Type u}
    (equivalenceRelation : LRA.Relation.Endorelation Alpha)
    (operation : BinaryOperation Alpha) : Prop :=
  LRA.Relation.Equivalence equivalenceRelation /\
    BinaryOperationRespectsRelation equivalenceRelation operation

/--
Monotonicity of a unary operation with respect to an order relation.

Logical form:

```lean
def Monotone {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  UnaryOperationRespectsRelation relation operation
```
-/
def Monotone {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  UnaryOperationRespectsRelation relation operation

/--
Extensiveness of a unary operation with respect to an order relation.

Logical form:

```lean
def Extensive {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall element, relation element (operation element)
```
-/
def Extensive {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall element, relation element (operation element)

/--
Idempotence of a unary operation under composition.

Logical form:

```lean
def UnaryIdempotent {Alpha : Type u}
    (operation : UnaryOperation Alpha) : Prop :=
  forall element, operation (operation element) = operation element
```
-/
def UnaryIdempotent {Alpha : Type u}
    (operation : UnaryOperation Alpha) : Prop :=
  forall element, operation (operation element) = operation element

/--
A closure operator is extensive, monotone, and idempotent.

Logical form:

```lean
def ClosureOperator {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  Extensive relation operation /\
    Monotone relation operation /\
      UnaryIdempotent operation
```
-/
def ClosureOperator {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  Extensive relation operation /\
    Monotone relation operation /\
      UnaryIdempotent operation

/--
Strict monotonicity of a unary operation with respect to a strict order.

Logical form:

```lean
def StrictMonotone {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall left right,
    strictRelation left right ->
      strictRelation (operation left) (operation right)
```
-/
def StrictMonotone {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha)
    (operation : UnaryOperation Alpha) : Prop :=
  forall left right,
    strictRelation left right ->
      strictRelation (operation left) (operation right)

end LRA.Algebra.Operation
