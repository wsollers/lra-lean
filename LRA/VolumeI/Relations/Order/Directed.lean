import LRA.VolumeI.Relations.Order.Bounds

namespace LRA.VolumeI.Relations.Order

universe u v

section Directedness

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A directed subset: every pair has an upper bound inside the subset. -/
def Directed
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  (exists element : Element, element ∈ subset) /\
    forall first second,
      first ∈ subset ->
        second ∈ subset ->
          exists upper,
            upper ∈ subset /\
              relation first upper /\ relation second upper

/-- A chain is a subset whose elements are pairwise comparable. -/
def Chain
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second

end Directedness

end LRA.VolumeI.Relations.Order
