import LRA.NumberSystems.PresburgerArithmetic.Interface.Signature.Definition
import LRA.Operation

namespace LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

open LRA.NumberSystems.PresburgerArithmetic.Interface.Signature

universe u

structure PresburgerArithmeticSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  add : LRA.Operation.BinaryOperation carrier
  lt : carrier → carrier → Prop

abbrev PresburgerArithmeticLStructure :=
  LRA.Logic.FirstOrder.Model PresburgerArithmeticFirstOrderSignature

def BuildPresburgerArithmeticModel
    (signature : PresburgerArithmeticSignature) :
    PresburgerArithmeticLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .add, args => signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args => signature.lt (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero

end LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

