import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.VolumeI.Order

universe u v

/-- A directed subset is nonempty and every pair of its elements has an upper
bound within the subset. The nonemptiness convention follows
Davey--Priestley. -/
def Directed
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  (exists element : Element, element ∈ subset) /\
    forall first second,
      first ∈ subset ->
        second ∈ subset ->
          exists upper,
            upper ∈ subset /\
              relation first upper /\ relation second upper

end LRA.VolumeI.Order
