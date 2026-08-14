import LRA.VolumeI.Order.Directedness.Chain.Definition
import LRA.VolumeI.Order.Directedness.Directed.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Every nonempty chain for a reflexive relation is directed. -/
theorem NonemptyChainIsDirected
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    {subset : SetObject}
    (relationIsReflexive : LRA.VolumeI.Relations.Reflexive relation)
    (subsetIsChain : Chain relation subset)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    Directed relation subset := by
  sorry

end LRA.VolumeI.Order
