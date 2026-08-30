import LRA.Metamathematics.StructuralIdentity
import LRA.Metamathematics.SubstitutionSafety
import LRA.Logic.Syntax.FirstOrder.SubstitutionFreeVariables
import LRA.Logic.Proof.System.Takeuti

/-!
# Logic / Metamathematics wiring

This file is the dependency boundary where concrete `LRA.Logic` syntax is
checked against the repository-level metamathematical schemas. The schemas
remain independent of Logic; Logic imports and satisfies them here.
-/

namespace LRA.Logic

open LRA.Metamathematics

namespace FirstOrder

/-- First-order terms satisfy structural identity via the `DecidableEq`
instance derived at the `Term` declaration itself. -/
instance firstOrderTermStructuralIdentity
    {S : Signature} {Variable : Type}
    [DecidableEq Variable]
    [DecidableEq S.FunctionSymbol]
    [DecidableEq S.ConstantSymbol] :
    StructuralIdentity (Term S Variable) where
  decidableStructuralEquality := inferInstance

/-- First-order formulas satisfy structural identity via the `DecidableEq`
instance derived at the `Formula` declaration itself. -/
instance firstOrderFormulaStructuralIdentity
    {S : Signature} {Variable : Type}
    [DecidableEq Variable]
    [DecidableEq S.FunctionSymbol]
    [DecidableEq S.ConstantSymbol]
    [DecidableEq S.RelationSymbol] :
    StructuralIdentity (Formula S Variable) where
  decidableStructuralEquality := inferInstance

/-- The first-order substitution operation is explicitly paired with the
`SubstitutionSafety` schema. The remaining field is deliberately a visible
proof obligation: `IsSubstitutable` and `substitute` were previously unrelated,
and proving the no-capture theorem is larger than a mechanical wiring change. -/
instance firstOrderSubstitutionSafety
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    SubstitutionSafety
      (Formula S Variable)
      Variable
      (Term S Variable)
      IsSubstitutable
      substitute
      (fun candidateVariable term => candidateVariable ∈ freeVariablesInTerm term)
      (fun formula => (freeVariables formula).toList) where
  noCaptureUnderSafety := by
    -- TODO: prove the capture-avoidance theorem from `IsSubstitutable`.
    -- This `sorry` is intentional: the schema is now connected to the actual
    -- operation, so the missing proof is tracked at the correct boundary.
    sorry

end FirstOrder

/-!
Takeuti's structural-identity instances remain deliberately unwired here until
its own `Term`, `FormulaArg`, and `Formula` declarations can derive decidable
equality without importing a classical fallback. The declaration-level deriving
attempt is handled separately so any genuine dependent-function obstruction is
reported rather than hidden behind `sorry`.
-/

end LRA.Logic
