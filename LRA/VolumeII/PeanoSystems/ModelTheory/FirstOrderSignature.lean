import LRA.VolumeI.Logic.Model.Model
import LRA.VolumeI.Operations
import LRA.VolumeI.AlgebraicStructures.DiscreteInteger.Laws.Definition

namespace LRA.NumberSystems.PeanoSystems.ModelTheory

universe u

/-!
First-order Peano vocabulary used by Volume II number-system constructions.
-/

inductive PeanoFunctionSymbol where
  | successor

def PeanoRelationSymbol : Type := Empty

inductive PeanoConstantSymbol where
  | one

def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1

def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol

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

end LRA.NumberSystems.PeanoSystems.ModelTheory
