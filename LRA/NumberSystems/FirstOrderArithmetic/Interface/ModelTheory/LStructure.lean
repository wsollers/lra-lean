import LRA.NumberSystems.FirstOrderArithmetic.Interface.Signature.Definition
import LRA.Operation

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

open LRA.NumberSystems.FirstOrderArithmetic.Interface.Signature

universe u

structure FirstOrderArithmeticSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  add : LRA.Operation.BinaryOperation carrier
  multiply : LRA.Operation.BinaryOperation carrier
  lt : carrier → carrier → Prop

abbrev FirstOrderArithmeticLStructure :=
  LRA.Logic.FirstOrder.Model FirstOrderArithmeticFirstOrderSignature

def BuildFirstOrderArithmeticModel
    (signature : FirstOrderArithmeticSignature) :
    FirstOrderArithmeticLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .add, args => signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args => signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args => signature.lt (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero

end LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

