import LRA.Metamathematics.StructuralIdentity
import LRA.Metamathematics.SubstitutionSafety
import LRA.Logic.Syntax.FirstOrder.SubstitutionFreeVariables
import LRA.Logic.Proof.System.Takeuti

/-!
# Logic / Metamathematics wiring

This file is the dependency boundary where concrete `LRA.Logic` syntax is
checked against the repository-level metamathematical schemas. The schemas
remain independent of Logic; Logic imports and satisfies them here.

## Structural identity status

A declaration-level `deriving DecidableEq` attempt was made for
`FirstOrder.Term`. Lean 4.32.1 rejects the derivation because the `apply`
constructor stores its arguments as a dependent function
`Fin (S.functionArity f) → Term S Variable`; the generated equality procedure
cannot synthesize the required decidable equalities. Consequently no
`StructuralIdentity` instance is asserted here for first-order `Term` or
`Formula`, and no classical fallback is used merely to make the schema appear
satisfied. Takeuti has the same function-valued constructor shape and remains
blocked for the same audit reason until a constructive equality implementation
or a syntax representation better suited to structural comparison is supplied.
-/

namespace LRA.Logic

open LRA.Metamathematics

namespace FirstOrder

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

end LRA.Logic
