import LRA.VolumeI.Set.ZFC.Syntax.Sentence
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

theorem extensionalityAxiom_isClosedFormula :
    IsClosedZFCFormula extensionalityAxiom :=
  extensionalityAxiom_hasNoFreeVariables

def extensionalitySentence : ZFCSentence :=
  ⟨extensionalityAxiom, extensionalityAxiom_isClosedFormula⟩

theorem emptySetAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula emptySetAxiom = ∅ := by
  native_decide

theorem emptySetAxiom_isClosedFormula :
    IsClosedZFCFormula emptySetAxiom :=
  emptySetAxiom_hasNoFreeVariables

def emptySetSentence : ZFCSentence :=
  ⟨emptySetAxiom, emptySetAxiom_isClosedFormula⟩

theorem pairingAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula pairingAxiom = ∅ := by
  native_decide

theorem pairingAxiom_isClosedFormula :
    IsClosedZFCFormula pairingAxiom :=
  pairingAxiom_hasNoFreeVariables

def pairingSentence : ZFCSentence :=
  ⟨pairingAxiom, pairingAxiom_isClosedFormula⟩

theorem unionAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula unionAxiom = ∅ := by
  native_decide

theorem unionAxiom_isClosedFormula :
    IsClosedZFCFormula unionAxiom :=
  unionAxiom_hasNoFreeVariables

def unionSentence : ZFCSentence :=
  ⟨unionAxiom, unionAxiom_isClosedFormula⟩

theorem powerSetAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula powerSetAxiom = ∅ := by
  native_decide

theorem powerSetAxiom_isClosedFormula :
    IsClosedZFCFormula powerSetAxiom :=
  powerSetAxiom_hasNoFreeVariables

def powerSetSentence : ZFCSentence :=
  ⟨powerSetAxiom, powerSetAxiom_isClosedFormula⟩

theorem foundationAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula foundationAxiom = ∅ := by
  native_decide

theorem foundationAxiom_isClosedFormula :
    IsClosedZFCFormula foundationAxiom :=
  foundationAxiom_hasNoFreeVariables

def foundationSentence : ZFCSentence :=
  ⟨foundationAxiom, foundationAxiom_isClosedFormula⟩

theorem infinityAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula infinityAxiom = ∅ := by
  native_decide

theorem infinityAxiom_isClosedFormula :
    IsClosedZFCFormula infinityAxiom :=
  infinityAxiom_hasNoFreeVariables

def infinitySentence : ZFCSentence :=
  ⟨infinityAxiom, infinityAxiom_isClosedFormula⟩

theorem choiceAxiom_hasNoFreeVariables :
    freeVariablesInZFCFormula choiceAxiom = ∅ := by
  native_decide

theorem choiceAxiom_isClosedFormula :
    IsClosedZFCFormula choiceAxiom :=
  choiceAxiom_hasNoFreeVariables

def choiceSentence : ZFCSentence :=
  ⟨choiceAxiom, choiceAxiom_isClosedFormula⟩

end LRA.VolumeI.Set.ZFC
