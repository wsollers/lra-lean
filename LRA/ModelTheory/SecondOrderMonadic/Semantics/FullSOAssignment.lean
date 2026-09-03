import Mathlib.Data.Set.Defs
import LRA.ModelTheory.SecondOrderMonadic.FullModel
import LRA.Logic.Semantics.Assignment

open LRA.Logic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
Assignments for full monadic second-order semantics carry element assignments
and arbitrary subset assignments, with no separate admissibility proof because
all subsets are available.
-/
structure FullSOAssignment
    {S : Signature} (M : FullModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable → M.Domain
  setAssignment : SetVariable → Set M.Domain

def FullSOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : FullModel S}
    (assignment : FullSOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain) :
    FullSOAssignment M Variable SetVariable where
  elementAssignment := assignment.elementAssignment
  setAssignment := updateAssignment assignment.setAssignment targetVariable subset

end LRA.ModelTheory.SecondOrderMonadic
