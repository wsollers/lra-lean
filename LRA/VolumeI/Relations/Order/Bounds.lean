import LRA.VolumeI.Relations.Order.OrderStructures.TotalOrder
import LRA.VolumeI.Set.Public.Interface

namespace LRA.VolumeI.Relations.Order

universe u

/-- An upper bound of a subset with respect to a non-strict order. -/
def UpperBound (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (bound : interface.Element) : Prop :=
  forall element,
    interface.member element subset ->
      relation element bound

/-- A lower bound of a subset with respect to a non-strict order. -/
def LowerBound (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (bound : interface.Element) : Prop :=
  forall element,
    interface.member element subset ->
      relation bound element

/-- A least element of a subset with respect to a non-strict order. -/
def LeastElement (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (least : interface.Element) : Prop :=
  interface.member least subset /\ LowerBound interface relation subset least

/-- A greatest element of a subset with respect to a non-strict order. -/
def GreatestElement (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (greatest : interface.Element) : Prop :=
  interface.member greatest subset /\ UpperBound interface relation subset greatest

/-- A minimal element of a subset with respect to a strict order. -/
def MinimalElement (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (strictRelation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (minimal : interface.Element) : Prop :=
  interface.member minimal subset /\
    forall element,
      interface.member element subset ->
        Not (strictRelation element minimal)

/-- A maximal element of a subset with respect to a strict order. -/
def MaximalElement (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (strictRelation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (maximal : interface.Element) : Prop :=
  interface.member maximal subset /\
    forall element,
      interface.member element subset ->
        Not (strictRelation maximal element)

/-- A supremum, or least upper bound, of a subset. -/
def Supremum (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (supremum : interface.Element) : Prop :=
  UpperBound interface relation subset supremum /\
    forall bound, UpperBound interface relation subset bound -> relation supremum bound

/-- An infimum, or greatest lower bound, of a subset. -/
def Infimum (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject)
    (infimum : interface.Element) : Prop :=
  LowerBound interface relation subset infimum /\
    forall bound, LowerBound interface relation subset bound -> relation bound infimum

end LRA.VolumeI.Relations.Order
