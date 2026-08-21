-- LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/LStructure.lean
-- Law-free `L_nat`-structure builders for the first-order Peano language.

import LRA.NumberSystems.PeanoSystem.Interface.Signature.Definition
import LRA.Operation
import LRA.AlgebraicStructures.DiscreteInteger.Laws.Definition

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

universe u

/-!
`L_nat`-structures for Peano system.

At the logic layer, `LRA.Logic.FirstOrder.Model S` already means an
`L`-structure: a domain together with interpretations of the symbols of `S`.
For the Peano-system interface it is useful to expose that stage with
Peano-specific naming before speaking about any axioms or theories.
-/

open LRA.NumberSystems.PeanoSystem.Interface.Signature

/-- Source-facing data from which an `L_nat`-structure can be built. -/
structure PeanoSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier

/-- An `L_nat`-structure interpreting the Peano base element and successor. -/
abbrev PeanoLStructure :=
  LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature

/-- Build an `L_nat`-structure from source-facing Peano data. -/
def BuildPeanoLStructure
    (signature : PeanoSignature) :
    PeanoLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

/-- Backward-compatible name: in the underlying logic development, a
first-order `Model` is already an `L`-structure. -/
abbrev BuildPeanoModel := BuildPeanoLStructure

def peanoFirstOrderModel (R : Type u) [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R] :
    PeanoLStructure :=
  BuildPeanoLStructure { carrier := R, one := 1, successor := LRA.AlgebraicStructures.Succ }

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
