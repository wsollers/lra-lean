import LRA.VolumeII.PeanoSystems.Presburger.Presburger
import LRA.VolumeII.PeanoSystems.PeanoSystem

/-!
First-order model data for the Presburger signature.
-/

namespace LRA.VolumeII.PeanoSystems

open LRA.VolumeI.Set

structure PresburgerModel where
  setInterface : SetInterface
  zero : setInterface.Element
  successor : setInterface.Element -> setInterface.Element
  zero_not_successor :
    forall element : setInterface.Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : setInterface.Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : setInterface.SetObject,
      setInterface.Member zero subset ->
      (forall element : setInterface.Element,
        setInterface.Member element subset ->
        setInterface.Member (successor element) subset) ->
      forall element : setInterface.Element,
        setInterface.Member element subset
  lessThan : setInterface.Element -> setInterface.Element -> Prop

namespace PresburgerModel

/-- The element carrier of a Presburger model, read from its generic set interface. -/
abbrev carrier (model : PresburgerModel) :=
  model.setInterface.Element

end PresburgerModel

def PresburgerModel.toPeanoSystem
    (model : PresburgerModel) : PeanoSystem where
  setInterface := model.setInterface
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
