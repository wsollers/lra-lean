-- LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Model.lean
-- Law-free model builders for the first-order integer-structure language.

import LRA.NumberSystems.IntegerStructure.Interface.Signature.Definition
import LRA.Operation
import LRA.AlgebraicStructures.DiscreteInteger.Laws.Definition

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

universe u

open LRA.NumberSystems.IntegerStructure.Interface.Signature

structure IntegerStructureSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  negativeOne : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  predecessor : LRA.Operation.UnaryOperation carrier

def BuildIntegerStructureModel
    (signature : IntegerStructureSignature) :
    LRA.Logic.FirstOrder.Model IntegerFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .predecessor, args => signature.predecessor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one
    | .negativeOne => signature.negativeOne

def integerStructureFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R]
    [LRA.AlgebraicStructures.HasPredecessor R] (negativeOneValue : R) :
    LRA.Logic.FirstOrder.Model IntegerFirstOrderSignature :=
  BuildIntegerStructureModel
    { carrier := R
      zero := 0
      one := 1
      negativeOne := negativeOneValue
      successor := LRA.AlgebraicStructures.Succ
      predecessor := LRA.AlgebraicStructures.Pred }

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
