import LRA.VolumeI.Order.OrderedSets.StrictOrder.Characterizations
import LRA.VolumeI.Order.OrderedSets.StrictPoset.Definition

namespace LRA.VolumeI.Order.OrderedSets.StrictPoset

/-- The relation carried by a strict poset satisfies the strict-order laws. -/
theorem StrictPosetRelationIsStrictOrder
    (poset : LRA.VolumeI.Order.StrictPoset) :
    LRA.VolumeI.Order.StrictOrder poset.StrictRelation :=
  poset.StrictRelationIsStrictOrder

/-- The relation carried by a strict poset is irreflexive. -/
theorem StrictPosetRelationIsIrreflexive
    (poset : LRA.VolumeI.Order.StrictPoset) :
    LRA.VolumeI.Relations.Irreflexive poset.StrictRelation :=
  LRA.VolumeI.Order.OrderedSets.StrictOrder.StrictOrderIsIrreflexive
    poset.StrictRelation poset.StrictRelationIsStrictOrder

/-- The relation carried by a strict poset is transitive. -/
theorem StrictPosetRelationIsTransitive
    (poset : LRA.VolumeI.Order.StrictPoset) :
    LRA.VolumeI.Relations.Transitive poset.StrictRelation :=
  LRA.VolumeI.Order.OrderedSets.StrictOrder.StrictOrderIsTransitive
    poset.StrictRelation poset.StrictRelationIsStrictOrder

end LRA.VolumeI.Order.OrderedSets.StrictPoset
