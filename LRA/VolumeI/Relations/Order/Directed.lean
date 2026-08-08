import LRA.VolumeI.Relations.Order.Bounds

namespace LRA.VolumeI.Relations.Order

universe u

/-- A directed subset: every pair has an upper bound inside the subset. -/
def Directed (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject) : Prop :=
  (exists element, interface.member element subset) /\
    forall first second,
      interface.member first subset ->
        interface.member second subset ->
          exists upper,
            interface.member upper subset /\
              relation first upper /\ relation second upper

/-- A chain is a subset whose elements are pairwise comparable. -/
def Chain (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element)
    (subset : interface.SetObject) : Prop :=
  forall first second,
    interface.member first subset ->
      interface.member second subset ->
        Comparable relation first second

end LRA.VolumeI.Relations.Order
