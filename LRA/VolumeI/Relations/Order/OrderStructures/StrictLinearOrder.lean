import LRA.VolumeI.Relations.Order.OrderStructures.StrictPartialOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Strict linear order laws: irreflexivity, transitivity, and trichotomy. -/
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation /\
      LRA.VolumeI.Relations.ExactlyTrichotomous relation

end LRA.VolumeI.Relations.Order
