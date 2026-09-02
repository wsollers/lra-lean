import LRA.NumberSystems.VonNeumann.Interface.Signature.Definition
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.Operation

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

open LRA.NumberSystems.VonNeumann.Interface.Signature
open LRA.AlgebraicStructures

universe u

structure VonNeumannSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  lessThan : carrier → carrier → Prop

abbrev VonNeumannLStructure :=
  LRA.Logic.FirstOrder.Model VonNeumannFirstOrderSignature

def BuildVonNeumannLStructure
    (signature : VonNeumannSignature) :
    VonNeumannLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .multiplication, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        signature.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

abbrev BuildVonNeumannModel := BuildVonNeumannLStructure

def vonNeumannFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [HasSuccessor R] [Add R] [Mul R] (lt : R → R → Prop) :
    VonNeumannLStructure :=
  BuildVonNeumannLStructure
    { carrier := R
      zero := 0
      one := 1
      successor := LRA.AlgebraicStructures.Succ
      addition := (· + ·)
      multiplication := (· * ·)
      lessThan := lt }

end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
