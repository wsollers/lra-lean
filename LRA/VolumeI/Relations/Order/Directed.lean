import LRA.VolumeI.Relations.Order.Bounds

namespace LRA.VolumeI.Relations.Order

universe u

/-- A directed subset: every pair has an upper bound inside the subset. -/
def Directed {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha) : Prop :=
  LRA.VolumeI.Set.LRASet.Nonempty subset /\
    forall first second,
      LRA.VolumeI.Set.LRASet.Member first subset ->
        LRA.VolumeI.Set.LRASet.Member second subset ->
          exists upper,
            LRA.VolumeI.Set.LRASet.Member upper subset /\
              relation first upper /\ relation second upper

/-- A chain is a subset whose elements are pairwise comparable. -/
def Chain {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha) : Prop :=
  forall first second,
    LRA.VolumeI.Set.LRASet.Member first subset ->
      LRA.VolumeI.Set.LRASet.Member second subset ->
        Comparable relation first second

end LRA.VolumeI.Relations.Order
