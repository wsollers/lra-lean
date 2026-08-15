import LRA.VolumeI.Order.Bounds.GreatestElement.Definition
import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Constructions.ProductOrder.Definition
import LRA.VolumeI.Order.Directedness.Directed.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.Order

universe u v w x y

/-- A maximal element of a directed subset of a partial order is greatest. -/
theorem MaximalElementOfDirectedSubsetIsGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    {subset : SetObject} {maximal : Element}
    (subsetIsDirected : Directed relation subset)
    (maximalIsMaximal :
      MaximalElement (StrictPart relation) subset maximal) :
    GreatestElement relation subset maximal := by
  sorry

/-- The coordinatewise product of two directed represented subsets is directed. -/
theorem ProductOfDirectedSubsetsIsDirected
    {Alpha : Type u} {Beta : Type v}
    {LeftSet : Type w} {RightSet : Type x} {ProductSet : Type y}
    [Membership Alpha LeftSet] [Membership Beta RightSet]
    [Membership (Alpha × Beta) ProductSet]
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    {leftSubset : LeftSet} {rightSubset : RightSet}
    {productSubset : ProductSet}
    (productMembership :
      forall pair : Alpha × Beta,
        pair ∈ productSubset ↔
          pair.1 ∈ leftSubset /\ pair.2 ∈ rightSubset)
    (leftIsDirected : Directed leftRelation leftSubset)
    (rightIsDirected : Directed rightRelation rightSubset) :
    Directed (ProductRelation leftRelation rightRelation) productSubset := by
  sorry

end LRA.Order
