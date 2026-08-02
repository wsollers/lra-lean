import LRA.VolumeI.Logic.Syntax.FirstOrder.Sentence
import LRA.VolumeI.Set.ZFC.Syntax.Formula
import LRA.VolumeI.Set.ZFC.Syntax.FreeVariables

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
ZFC sentences.

This module specializes the generic first-order closed-formula and sentence
vocabulary to the ZFC signature and concrete variable supply.
-/

/-- A ZFC formula is closed when it has no free variables. -/
def IsClosedZFCFormula (formula : ZFCFormula) : Prop :=
  FirstOrder.IsClosedFormula formula

/-- A ZFC sentence is a closed ZFC formula. -/
abbrev ZFCSentence :=
  FirstOrder.Sentence zfcSignature ZFCVariable

/-- The underlying formula of a ZFC sentence has no free variables. -/
theorem zfcSentence_hasNoFreeVariables
    (sentence : ZFCSentence) :
    freeVariablesInZFCFormula sentence.val = ∅ :=
  sentence.property

end LRA.VolumeI.Set.ZFC
