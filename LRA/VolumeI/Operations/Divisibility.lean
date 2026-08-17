import LRA.VolumeI.Operations.Laws.Associative.Definition
import LRA.VolumeI.Operations.Laws.Identity.Definition
import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.Operation

universe u

/--
Divisibility induced by a multiplication-like operation.

Logical form:

```lean
def Divides {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun divisor dividend =>
    exists witness, dividend = multiplication divisor witness
```
-/
def Divides {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun divisor dividend =>
    exists witness, dividend = multiplication divisor witness

/--
Divisibility equivalence: each element divides the other.

Logical form:

```lean
def AssociatedByDivisibility {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun first second =>
    Divides multiplication first second /\ Divides multiplication second first
```
-/
def AssociatedByDivisibility {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun first second =>
    Divides multiplication first second /\ Divides multiplication second first

/--
A monoid-like operation induces a divisibility preorder.

Logical form:

```lean
theorem DivisibilityPreorder
    {Alpha : Type u}
    {multiplication : BinaryOperation Alpha}
    {identity : Alpha}
    (multiplicationIsAssociative :
      LRA.Operation.Laws.Associative.Associative multiplication)
    (identityIsTwoSided :
      LRA.Operation.Laws.Identity.TwoSidedIdentity multiplication identity) :
    LRA.Order.Preorder (Divides multiplication)
```
-/
theorem DivisibilityPreorder
    {Alpha : Type u}
    {multiplication : BinaryOperation Alpha}
    {identity : Alpha}
    (multiplicationIsAssociative :
      LRA.Operation.Laws.Associative.Associative multiplication)
    (identityIsTwoSided :
      LRA.Operation.Laws.Identity.TwoSidedIdentity multiplication identity) :
    LRA.Order.Preorder (Divides multiplication) := by
  sorry

end LRA.Operation
