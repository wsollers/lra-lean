import LRA.VolumeI.Set.ZFC.Syntax.FreeVariables
import LRA.VolumeI.Set.ZFC.Theory.Axioms

namespace LRA.VolumeI.Set.ZFC

/-!
Closedness of the named ZFC axioms.

Each theorem states that the corresponding named axiom is a sentence: it
has no free variables. The proofs are finite computations over the encoded
first-order syntax and the fresh variables chosen by the ZFC vocabulary
helpers.
-/

theorem extensionalityAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula extensionalityAxiom = ∅ := by
  native_decide

theorem emptySetAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula emptySetAxiom = ∅ := by
  native_decide

theorem pairingAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula pairingAxiom = ∅ := by
  native_decide

theorem unionAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula unionAxiom = ∅ := by
  native_decide

theorem powerSetAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula powerSetAxiom = ∅ := by
  native_decide

theorem foundationAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula foundationAxiom = ∅ := by
  native_decide

theorem infinityAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula infinityAxiom = ∅ := by
  native_decide

theorem choiceAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula choiceAxiom = ∅ := by
  native_decide

end LRA.VolumeI.Set.ZFC
