import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Order

universe u v

/-- Antisymmetry makes an infimum unique. -/
theorem InfimumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsInfimum : Infimum relation subset first)
    (secondIsInfimum : Infimum relation subset second) :
    first = second := by
  sorry

/-- An infimum is a lower bound of the represented subset. -/
theorem InfimumIsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset infimum :=
  infimumIsInfimum.1

/-- Every lower bound of a represented subset lies below its infimum. -/
theorem EveryLowerBoundRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (boundIsLowerBound : LowerBound relation subset bound) :
    relation bound infimum :=
  infimumIsInfimum.2 bound boundIsLowerBound

/-- Once an infimum exists, lower bounds are exactly the elements below it. -/
theorem LowerBoundIffRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset bound ↔ relation bound infimum := by
  sorry

/-- Infima are antitone under inclusion of represented subsets. -/
theorem InfimumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerInfimum largerInfimum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerInfimumIsInfimum : Infimum relation smaller smallerInfimum)
    (largerInfimumIsInfimum : Infimum relation larger largerInfimum) :
    relation largerInfimum smallerInfimum := by
  sorry

/-- Pointwise domination of one represented subset by another compares their infima. -/
theorem InfimaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum : Element}
    (everyLeftHasSmallerRight :
      forall left, left ∈ leftSubset ->
        exists right, right ∈ rightSubset /\ relation right left)
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum) :
    relation rightInfimum leftInfimum := by
  sorry

/-- An infimum that belongs to its subset is the least element. -/
theorem InfimumInSubsetIsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (infimumBelongs : infimum ∈ subset) :
    LeastElement relation subset infimum := by
  sorry

/-- The meet of two existing infima is the infimum of their union. -/
theorem InfimumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum unionInfimum : Element}
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum)
    (unionInfimumIsMeet :
      Meet relation leftInfimum rightInfimum unionInfimum) :
    Infimum relation (leftSubset ∪ rightSubset) unionInfimum := by
  sorry

end LRA.Order
