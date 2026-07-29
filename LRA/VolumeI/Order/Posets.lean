import LRA.VolumeI.Order.Relations

/-!
Order structures built from generic binary-relation predicates.
-/

namespace LRA.VolumeI.Order

universe u

/-- Preorder laws for an endorelation. -/
def Preorder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

/-- Partial-order laws for an endorelation. -/
def PartialOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation

/-- A poset is a carrier equipped with a partial order. -/
structure Poset where
  carrier : LRA.VolumeI.Set.LRACarrier
  order : LRA.VolumeI.Relations.Endorelation carrier
  orderIsPartial : PartialOrder order

/-- Strict partial-order laws for an endorelation. -/
def StrictOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order
