import LRA.VolumeI.Set.ZFC.Syntax.Formula
import LRA.VolumeI.Set.ZFC.Syntax.FreeVariables
import LRA.VolumeI.Set.ZFC.Syntax.Vocabulary

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic.FirstOrder

/-!
ZFC syntax checkpoints.

Small well-formedness tests for the ZFC-specific formula builders and the
derived vocabulary, plus one computation of free variables. These check
the *encoding* only; satisfaction checkpoints live in
`Semantics/Examples.lean` and axiom well-formedness in
`Theory/Examples.lean`.
-/

/-- Syntax checkpoint: `isMemberOf 0 1` is a ZFC formula. -/
example : ZFCFormula :=
  isMemberOf 0 1

/-- Free-variable checkpoint: `isMemberOf 0 1` has free variables `0`
and `1`. -/
example : freeVariablesInZFCFormula (isMemberOf 0 1) = {0, 1} := by
  rfl

/-- Syntax checkpoint: `isEqualTo 0 1` is a ZFC formula. -/
example : ZFCFormula :=
  isEqualTo 0 1

/-- Syntax checkpoint: `isSubsetOf 0 1` is a ZFC formula. -/
example : ZFCFormula :=
  isSubsetOf 0 1

/-- Syntax checkpoint: `isEmptySet 0` is a ZFC formula. -/
example : ZFCFormula :=
  isEmptySet 0

/-- Syntax checkpoint: `isPairSetOf 0 1 2` is a ZFC formula. -/
example : ZFCFormula :=
  isPairSetOf 0 1 2

/-- Syntax checkpoint: `isUnionSetOf 0 1` is a ZFC formula. -/
example : ZFCFormula :=
  isUnionSetOf 0 1

/-- Syntax checkpoint: `isPowerSetOf 0 1` is a ZFC formula. -/
example : ZFCFormula :=
  isPowerSetOf 0 1

/-- Syntax checkpoint: `isSuccessorOf 0 1` is a ZFC formula. -/
example : ZFCFormula :=
  isSuccessorOf 0 1

end LRA.VolumeI.Set.ZFC
