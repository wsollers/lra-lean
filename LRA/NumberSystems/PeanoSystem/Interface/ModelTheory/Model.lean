import LRA.NumberSystems.PeanoSystem.Interface.Signature.Definition
import LRA.Operation
import LRA.AlgebraicStructures.DiscreteInteger.Laws.Definition

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

universe u

/-! Law-free model builders for the first-order Peano language. -/

open LRA.NumberSystems.PeanoSystem.Interface.Signature

structure PeanoSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier

def BuildPeanoModel
    (signature : PeanoSignature) :
    LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

def peanoFirstOrderModel (R : Type u) [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R] :
    LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature :=
  BuildPeanoModel { carrier := R, one := 1, successor := LRA.AlgebraicStructures.Succ }

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
