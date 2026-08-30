import LRA.Metamathematics.StructuralIdentity
import LRA.Metamathematics.SubstitutionSafety
import LRA.Logic.Syntax.FirstOrder.SubstitutionFreeVariables
import LRA.Logic.Proof.System.Takeuti

/-!
# Logic / Metamathematics wiring

This file is the dependency boundary where concrete `LRA.Logic` syntax is
checked against the repository-level metamathematical schemas.  The schemas
remain independent of Logic; Logic imports and satisfies them here.
-/

namespace LRA.Logic

open LRA.Metamathematics

namespace FirstOrder

/-- Structural equality for first-order terms, conditional only on decidable
identity of the syntactic categories from which terms are built. -/
deriving instance DecidableEq for Term S Variable

instance firstOrderTermStructuralIdentity
    {S : Signature} {Variable : Type}
    [DecidableEq Variable]
    [DecidableEq S.FunctionSymbol]
    [DecidableEq S.ConstantSymbol] :
    StructuralIdentity (Term S Variable) where
  decidableStructuralEquality := inferInstance

/-- Structural equality for first-order formulas, conditional only on
structural equality of their variable and signature symbol categories. -/
deriving instance DecidableEq for Formula S Variable

instance firstOrderFormulaStructuralIdentity
    {S : Signature} {Variable : Type}
    [DecidableEq Variable]
    [DecidableEq S.FunctionSymbol]
    [DecidableEq S.ConstantSymbol]
    [DecidableEq S.RelationSymbol] :
    StructuralIdentity (Formula S Variable) where
  decidableStructuralEquality := inferInstance

/-- The first-order substitution operation is now explicitly paired with the
`SubstitutionSafety` schema.  The remaining field is deliberately a visible
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

namespace Proof.System.Takeuti

/-- Takeuti terms also have structural equality once the alphabet categories
used by the term grammar have decidable identity. -/
deriving instance DecidableEq for Term L

instance takeutiTermStructuralIdentity
    {L : Alphabet}
    [DecidableEq L.FreeVar]
    [(n : Nat) → DecidableEq (L.FunctionSymbol n)] :
    StructuralIdentity (Term L) where
  decidableStructuralEquality := inferInstance

/-- `FormulaArg` is itself an inductive syntax type used inside Takeuti
formulas, so it is audited alongside `Term` and `Formula`. -/
deriving instance DecidableEq for FormulaArg L

instance takeutiFormulaArgStructuralIdentity
    {L : Alphabet}
    [DecidableEq L.FreeVar]
    [DecidableEq L.BoundVar]
    [(n : Nat) → DecidableEq (L.FunctionSymbol n)] :
    StructuralIdentity (FormulaArg L) where
  decidableStructuralEquality := inferInstance

/-- Structural equality for Takeuti formulas. -/
deriving instance DecidableEq for Formula L

instance takeutiFormulaStructuralIdentity
    {L : Alphabet}
    [DecidableEq L.FreeVar]
    [DecidableEq L.BoundVar]
    [(n : Nat) → DecidableEq (L.FunctionSymbol n)]
    [(n : Nat) → DecidableEq (L.PredicateSymbol n)] :
    StructuralIdentity (Formula L) where
  decidableStructuralEquality := inferInstance

end Proof.System.Takeuti

end LRA.Logic
