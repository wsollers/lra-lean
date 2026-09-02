import LRA.NumberSystems.Presburger.Interface.ModelTheory.Theory
import LRA.NumberSystems.Presburger.Definition

namespace LRA.NumberSystems.Presburger.Interface.ModelTheory

open LRA.AlgebraicStructures

universe u

structure PresburgerModel : Type (u + 1) where
  Carrier : Type u
  [zeroInst : OfNat Carrier 0]
  [successorInst : HasSuccessor Carrier]
  [addInst : Add Carrier]
  [carrierNonempty : Nonempty Carrier]
  lessThan : Carrier → Carrier → Prop
  construction :
    LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
      Carrier (Set Carrier)
  zero_eq : construction.zero = (0 : Carrier)
  successor_eq :
    construction.successor = LRA.AlgebraicStructures.Succ
  addition_eq :
    LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition
      construction = (· + ·)
  lessThan_eq : construction.lessThan = lessThan

attribute [instance] PresburgerModel.zeroInst
  PresburgerModel.successorInst
  PresburgerModel.addInst
  PresburgerModel.carrierNonempty

def PresburgerModel.ofCarrier (R : Type u)
    [OfNat R 0] [HasSuccessor R] [Add R] [Nonempty R]
    (lt : R → R → Prop)
    (construction :
      LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
        R (Set R))
    (zero_eq : construction.zero = (0 : R))
    (successor_eq :
      construction.successor = LRA.AlgebraicStructures.Succ)
    (addition_eq :
      LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition
        construction = (· + ·))
    (lessThan_eq : construction.lessThan = lt) :
    PresburgerModel :=
  { Carrier := R
    lessThan := lt
    construction := construction
    zero_eq := zero_eq
    successor_eq := successor_eq
    addition_eq := addition_eq
    lessThan_eq := lessThan_eq }

def PresburgerModel.signature
    (M : PresburgerModel) :
    PresburgerSignature where
  carrier := M.Carrier
  zero := 0
  successor := LRA.AlgebraicStructures.Succ
  addition := (· + ·)
  lessThan := M.lessThan

def PresburgerModel.firstOrderModel
    (M : PresburgerModel) :
    PresburgerLStructure :=
  BuildPresburgerModel M.signature

noncomputable def concretePresburgerModel : PresburgerModel :=
  PresburgerModel.ofCarrier
    LRA.NumberSystems.Presburger.Carrier
    LRA.NumberSystems.Presburger.lessThan
    LRA.NumberSystems.Presburger.concreteConstructionModel
    rfl
    rfl
    rfl
    rfl

end LRA.NumberSystems.Presburger.Interface.ModelTheory
