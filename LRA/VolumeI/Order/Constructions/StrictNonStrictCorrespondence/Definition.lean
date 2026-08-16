import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.OrderedSets.Poset.Definition
import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition
import LRA.VolumeI.Order.OrderedSets.StrictPoset.Definition
import LRA.VolumeI.Order.Relations

namespace LRA.Order

universe u

/-- Adjoin equality to a strict relation. -/
def NonStrictFromStrict {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  LessThanOrEqual strictRelation

/-- Remove equality from a non-strict relation. -/
def StrictFromNonStrict {Alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  StrictPart nonStrictRelation

/-- The strict part of a poset order satisfies the strict-order laws. -/
theorem StrictRelationOfPosetIsStrictOrder (poset : Poset) :
    LRA.Order.StrictOrder (StrictFromNonStrict poset.NonStrictOrder) := by
  sorry

/-- Derive the strict poset carried by the strict part of a poset order. -/
def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder := StrictRelationOfPosetIsStrictOrder poset

/-- The reflexive closure of a strict poset order satisfies the partial-order
laws. -/
theorem NonStrictRelationOfStrictPosetIsPartialOrder
    (strictPoset : StrictPoset) :
    LRA.Order.PartialOrder
      (NonStrictFromStrict strictPoset.StrictRelation) := by
  sorry

/-- Derive the poset obtained by adjoining equality to a strict-poset order. -/
def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    NonStrictRelationOfStrictPosetIsPartialOrder strictPoset

end LRA.Order
