import LRA.VolumeI.Order.Laws.PartialOrder.Definition

namespace LRA.Order

universe u

/-!
Native total and linear-order law certificates over Lean's `LE` machine.
-/

class TotalOrderLaw (R : Type u) [LE R] : Prop where
  LeTotal : forall a b : R, a <= b \/ b <= a

class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
  PartialOrderLaws R, TotalOrderLaw R

section Wrappers

variable {R : Type u}

theorem LeTotal [LE R] [TotalOrderLaw R] :
    forall a b : R, a <= b \/ b <= a :=
  TotalOrderLaw.LeTotal

end Wrappers

end LRA.Order
