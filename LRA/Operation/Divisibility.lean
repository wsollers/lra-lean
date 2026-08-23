import LRA.Operation.Definition
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Order.OrderedSets.Preorder.Definition

namespace LRA.Operation

universe u

                                                               
def Divides {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun divisor dividend =>
    exists witness, dividend = multiplication divisor witness

                                                                
def AssociatedByDivisibility {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun first second =>
    Divides multiplication first second /\ Divides multiplication second first

                                                               
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
