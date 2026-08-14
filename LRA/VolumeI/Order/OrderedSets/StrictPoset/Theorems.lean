import LRA.VolumeI.Order.OrderedSets.StrictPoset.Characterizations

namespace LRA.VolumeI.Order.OrderedSets.StrictPoset

/-- A strict poset never relates an element to itself. -/
theorem StrictPosetDoesNotRelateSelf
    (poset : LRA.VolumeI.Order.StrictPoset)
    (element : poset.Carrier) :
    Not (poset.StrictRelation element element) :=
  StrictPosetRelationIsIrreflexive poset element

end LRA.VolumeI.Order.OrderedSets.StrictPoset
