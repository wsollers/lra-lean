import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u v

                                                                    
theorem LeastElementIsMinimal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    MinimalElement (StrictPart relation) subset least := by
  sorry

                                                                               
theorem LeastElementIsUniqueMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least minimal : Element}
    (leastIsLeast : LeastElement relation subset least)
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    minimal = least := by
  sorry

                                                         
theorem MinimalElementIsLeastInLinearOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    {subset : SetObject} {minimal : Element}
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    LeastElement relation subset minimal := by
  sorry

                                     
theorem LeastElementIsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    Infimum relation subset least := by
  sorry

                                                                                
theorem LeastElementIffInfimumAndMembership
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    {subset : SetObject} {candidate : Element} :
    LeastElement relation subset candidate ↔
      Infimum relation subset candidate /\ candidate ∈ subset := by
  sorry

end LRA.Order
