import LRA.Order.OrderedSets.Preorder.Characterizations

namespace LRA.Order.OrderedSets.Preorder

/-- Projection accessor: every element is related to itself by a preorder. -/
theorem PreorderRelatesSelf
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier)
    (element : Carrier) :
    preorder.relation element element :=
  PreorderRelationIsReflexive preorder element

end LRA.Order.OrderedSets.Preorder
