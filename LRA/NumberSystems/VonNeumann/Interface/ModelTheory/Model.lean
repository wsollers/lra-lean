import LRA.NumberSystems.VonNeumann.Interface.ModelTheory.Theory
import LRA.NumberSystems.VonNeumann.Definition

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

open LRA.AlgebraicStructures

universe u v

structure VonNeumannModel : Type (max u v + 1) where
  Carrier : Type u
  SetObject : Type v
  [membershipInst : Membership Carrier SetObject]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [successorInst : HasSuccessor Carrier]
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [carrierNonempty : Nonempty Carrier]
  lessThan : Carrier → Carrier → Prop
  construction :
    LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
      Carrier SetObject
  zero_eq : construction.zero = (0 : Carrier)
  one_eq : construction.one = (1 : Carrier)
  successor_eq :
    construction.successor = LRA.AlgebraicStructures.Succ
  addition_eq : construction.addition = (· + ·)
  multiplication_eq : construction.multiplication = (· * ·)
  lessThan_eq : construction.lessThan = lessThan

attribute [instance] VonNeumannModel.membershipInst
  VonNeumannModel.zeroInst
  VonNeumannModel.oneInst
  VonNeumannModel.successorInst
  VonNeumannModel.addInst
  VonNeumannModel.mulInst
  VonNeumannModel.carrierNonempty

def VonNeumannModel.ofCarrier (R : Type u) (SetObject : Type v)
    [Membership R SetObject] [OfNat R 0] [OfNat R 1]
    [HasSuccessor R] [Add R] [Mul R] [Nonempty R]
    (lt : R → R → Prop)
    (construction :
      LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
        R SetObject)
    (zero_eq : construction.zero = (0 : R))
    (one_eq : construction.one = (1 : R))
    (successor_eq :
      construction.successor = LRA.AlgebraicStructures.Succ)
    (addition_eq : construction.addition = (· + ·))
    (multiplication_eq : construction.multiplication = (· * ·))
    (lessThan_eq : construction.lessThan = lt) :
    VonNeumannModel :=
  { Carrier := R
    SetObject := SetObject
    lessThan := lt
    construction := construction
    zero_eq := zero_eq
    one_eq := one_eq
    successor_eq := successor_eq
    addition_eq := addition_eq
    multiplication_eq := multiplication_eq
    lessThan_eq := lessThan_eq }

def VonNeumannModel.signature
    (M : VonNeumannModel) :
    VonNeumannSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  successor := LRA.AlgebraicStructures.Succ
  addition := (· + ·)
  multiplication := (· * ·)
  lessThan := M.lessThan

def VonNeumannModel.firstOrderModel
    (M : VonNeumannModel) :
    VonNeumannLStructure :=
  BuildVonNeumannModel M.signature

noncomputable def concreteVonNeumannModel : VonNeumannModel :=
  VonNeumannModel.ofCarrier
    LRA.NumberSystems.VonNeumann.Carrier
    LRA.Set.Constructions.ZFCSet
    LRA.NumberSystems.VonNeumann.lessThan
    LRA.NumberSystems.VonNeumann.concreteConstructionModel
    rfl
    rfl
    rfl
    rfl
    rfl
    rfl

end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
