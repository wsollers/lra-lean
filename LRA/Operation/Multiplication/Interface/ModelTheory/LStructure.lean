import LRA.Operation.Multiplication.Interface.Signature.Definition
import LRA.ModelTheory.Model

namespace LRA.Operation.Multiplication.Interface.ModelTheory

/-- First-order function symbols for the promoted multiplication interface. -/
inductive MultiplicationFunctionSymbol where
  | mul

/-- The promoted multiplication interface has no primitive relations. -/
def MultiplicationRelationSymbol : Type := Empty

/-- The promoted multiplication interface has no primitive constants. -/
def MultiplicationConstantSymbol : Type := Empty

/-- First-order function arities for promoted multiplication. -/
def MultiplicationFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := MultiplicationFunctionSymbol
  arity
    | .mul => 2

/-- First-order relation arities for promoted multiplication. -/
def MultiplicationFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MultiplicationRelationSymbol
  arity := Empty.elim

/-- First-order signature for promoted multiplication. -/
def MultiplicationFirstOrderSignature : LRA.Logic.Signature where
  Functions := MultiplicationFirstOrderFunctions
  Relations := MultiplicationFirstOrderRelations
  Constants := MultiplicationConstantSymbol

/-- Interpret a promoted multiplication signature as a first-order model. -/
def BuildMultiplicationModel
    (signature : LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := signature.carrierNonempty
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant := fun constant => nomatch constant

end LRA.Operation.Multiplication.Interface.ModelTheory
