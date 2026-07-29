import LRA.VolumeI.Operations.Laws
import LRA.VolumeI.Relations.Order.OrderStructures.Preorder

namespace LRA.VolumeI.Operations

universe u

/-- Divisibility induced by a multiplication-like operation. -/
def Divides {Alpha : LRA.VolumeI.Set.LRACarrier}
    (multiplication : BinaryOperation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  fun divisor dividend =>
    exists witness, dividend = multiplication divisor witness

/-- Divisibility equivalence: each element divides the other. -/
def AssociatedByDivisibility {Alpha : LRA.VolumeI.Set.LRACarrier}
    (multiplication : BinaryOperation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  fun first second =>
    Divides multiplication first second /\ Divides multiplication second first

/-- A monoid-like operation induces a divisibility preorder. -/
theorem DivisibilityPreorder
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {multiplication : BinaryOperation Alpha}
    {identity : Alpha}
    (multiplicationIsAssociative : Associative multiplication)
    (identityIsTwoSided : Identity multiplication identity) :
    LRA.VolumeI.Relations.Order.Preorder (Divides multiplication) := by
  sorry

end LRA.VolumeI.Operations
