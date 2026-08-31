import LRA.Operation.Addition.Interface.Signature.Definition
import LRA.Logic.Model.Model

namespace LRA.Operation.Addition.Interface.ModelTheory

/-- First-order function symbols for the promoted addition interface. -/
inductive AdditionFunctionSymbol where
  | add

/-- The promoted addition interface has no primitive relations. -/
def AdditionRelationSymbol : Type := Empty

/-- The promoted addition interface has no primitive constants. -/
def AdditionConstantSymbol : Type := Empty

/-- First-order function arities for promoted addition. -/
def AdditionFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditionFunctionSymbol
  arity
    | .add => 2

/-- First-order relation arities for promoted addition. -/
def AdditionFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditionRelationSymbol
  arity := Empty.elim

/-- First-order signature for promoted addition. -/
def AdditionFirstOrderSignature : LRA.Logic.Signature where
  Functions := AdditionFirstOrderFunctions
  Relations := AdditionFirstOrderRelations
  Constants := AdditionConstantSymbol

/-- Interpret a promoted addition signature as a first-order model. -/
def BuildAdditionModel
    (signature : LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature) :
    LRA.Logic.FirstOrder.Model AdditionFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := signature.carrierNonempty
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant := fun constant => nomatch constant

end LRA.Operation.Addition.Interface.ModelTheory
