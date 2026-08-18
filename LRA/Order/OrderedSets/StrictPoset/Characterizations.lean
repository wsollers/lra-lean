import LRA.Order.OrderedSets.StrictOrder.Characterizations
import LRA.Order.OrderedSets.StrictPoset.Definition

namespace LRA.Order.OrderedSets.StrictPoset

/-- The relation carried by a strict poset satisfies the strict-order laws. -/
theorem StrictPosetRelationIsStrictOrder
    (poset : LRA.Order.StrictPoset) :
    LRA.Order.StrictOrder poset.StrictRelation :=
  poset.StrictRelationIsStrictOrder

/-- The relation carried by a strict poset is irreflexive. -/
theorem StrictPosetRelationIsIrreflexive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Irreflexive poset.StrictRelation :=
  LRA.Order.OrderedSets.StrictOrder.StrictOrderIsIrreflexive
    poset.StrictRelation poset.StrictRelationIsStrictOrder

/-- The relation carried by a strict poset is transitive. -/
theorem StrictPosetRelationIsTransitive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Transitive poset.StrictRelation :=
  LRA.Order.OrderedSets.StrictOrder.StrictOrderIsTransitive
    poset.StrictRelation poset.StrictRelationIsStrictOrder

end LRA.Order.OrderedSets.StrictPoset
