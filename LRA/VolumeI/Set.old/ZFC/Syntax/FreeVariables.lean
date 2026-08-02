import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariables
import LRA.VolumeI.Logic.Syntax.FirstOrder.AllVariables
import LRA.VolumeI.Set.ZFC.Syntax.Formula

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
Free variables of ZFC formulas.

This is the ZFC-facing specialization of the generic first-order
`freeVariables` operation. It gives schema constructors a concrete finite
set of variables to avoid when they introduce their own bound variables.
-/

/-- The finite set of variables occurring free in a ZFC formula. -/
def freeVariablesInZFCFormula (φ : ZFCFormula) : Finset ZFCVariable :=
  FirstOrder.freeVariables φ

/-- The finite set of *all* variables occurring in a ZFC formula, free and
bound. Used where a rename must avoid a formula's bound variables as well
as its free ones -- notably the output-variable rename in the Replacement
schema, so that rename is capture-avoiding for any predicate. -/
def allVariablesInZFCFormula (φ : ZFCFormula) : Finset ZFCVariable :=
  FirstOrder.allVariables φ

end LRA.VolumeI.Set.ZFC
