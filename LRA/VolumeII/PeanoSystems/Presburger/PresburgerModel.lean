import LRA.VolumeII.PeanoSystems.Presburger.Presburger
import LRA.VolumeII.PeanoSystems.PeanoSystem

/-!
First-order model data for the Presburger signature.
-/

namespace LRA.VolumeII.PeanoSystems

structure PresburgerModel where
  carrier : Type
  zero : carrier
  successor : carrier -> carrier
  zero_not_successor :
    forall element : carrier,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : carrier,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall predicate : LRA.VolumeI.Set.LRASet carrier,
      predicate zero ->
      (forall element : carrier,
        predicate element ->
        predicate (successor element)) ->
      forall element : carrier,
        predicate element
  lessThan : carrier -> carrier -> Prop

def PresburgerModel.toPeanoSystem
    (model : PresburgerModel) : PeanoSystem where
  carrier := model.carrier
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction

/- Volume II label: def:presburger-arithmetic
   Lean declaration: LRA.VolumeII.PeanoSystems.PresburgerArithmetic
   Status: pending -/
def PresburgerArithmetic (_model : PresburgerModel) : Prop := True

end LRA.VolumeII.PeanoSystems
