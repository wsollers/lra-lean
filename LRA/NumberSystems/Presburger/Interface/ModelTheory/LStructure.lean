import LRA.NumberSystems.Presburger.Interface.Signature.Definition
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.Operation

namespace LRA.NumberSystems.Presburger.Interface.ModelTheory

open LRA.NumberSystems.Presburger.Interface.Signature
open LRA.AlgebraicStructures

universe u

structure PresburgerSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  lessThan : carrier → carrier → Prop

abbrev PresburgerLStructure :=
  LRA.ModelTheory.FirstOrder.Model PresburgerFirstOrderSignature

def BuildPresburgerLStructure
    (signature : PresburgerSignature) :
    PresburgerLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        signature.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero

def BuildPresburgerModel := BuildPresburgerLStructure

def presburgerFirstOrderModel (R : Type u) [OfNat R 0]
    [HasSuccessor R] [Add R] (lt : R → R → Prop) :
    PresburgerLStructure :=
  BuildPresburgerLStructure
    { carrier := R
      zero := 0
      successor := LRA.AlgebraicStructures.Succ
      addition := (· + ·)
      lessThan := lt }

end LRA.NumberSystems.Presburger.Interface.ModelTheory
