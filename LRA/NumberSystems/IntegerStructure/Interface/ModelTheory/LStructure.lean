-- LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/LStructure.lean
-- Law-free `L_int`-structure builders for the first-order integer language.

import LRA.NumberSystems.IntegerStructure.Interface.Signature.Definition
import LRA.Operation
import LRA.AlgebraicStructures.DiscreteInteger.Laws.Definition

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

universe u

/-!
`L_int`-structures for integer structure.

At the logic layer, `LRA.Logic.FirstOrder.Model S` already means an
`L`-structure: a domain together with interpretations of the symbols of `S`.
For the integer-structure interface it is useful to expose that stage with
integer-specific naming before speaking about any axioms or theories.
-/

open LRA.NumberSystems.IntegerStructure.Interface.Signature

/-- Source-facing data from which an `L_int`-structure can be built. -/
structure IntegerStructureSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  negativeOne : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  predecessor : LRA.Operation.UnaryOperation carrier

/-- An `L_int`-structure interpreting zero, one, negative one, successor,
and predecessor. -/
abbrev IntegerStructureLStructure :=
  LRA.Logic.FirstOrder.Model IntegerFirstOrderSignature

/-- Build an `L_int`-structure from source-facing integer-structure data. -/
def BuildIntegerStructureLStructure
    (signature : IntegerStructureSignature) :
    IntegerStructureLStructure where
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

/-- Backward-compatible name: in the underlying logic development, a
first-order `Model` is already an `L`-structure. -/
abbrev BuildIntegerStructureModel := BuildIntegerStructureLStructure

def integerStructureFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R]
    [LRA.AlgebraicStructures.HasPredecessor R] (negativeOneValue : R) :
    IntegerStructureLStructure :=
  BuildIntegerStructureLStructure
    { carrier := R
      zero := 0
      one := 1
      negativeOne := negativeOneValue
      successor := LRA.AlgebraicStructures.Succ
      predecessor := LRA.AlgebraicStructures.Pred }

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
