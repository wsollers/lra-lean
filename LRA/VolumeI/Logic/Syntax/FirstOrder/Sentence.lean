import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariables

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Closed formulas and sentences.

A first-order formula is closed when it has no free variables. A sentence is
a formula bundled with that closedness proof. This is syntax-level
infrastructure: semantic assignment-independence for closed formulas lives in
`LRA.VolumeI.Logic.Semantics.Sentence`.
-/

/-- A formula is closed when it has no free variables. -/
def IsClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (formula : Formula S Variable) : Prop :=
  freeVariables formula = ∅

/-- A first-order sentence is a closed formula. -/
abbrev Sentence (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  { formula : Formula S Variable // IsClosedFormula formula }

/-- The underlying formula of a sentence has no free variables. -/
theorem sentence_hasNoFreeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (sentence : Sentence S Variable) :
    freeVariables sentence.val = ∅ :=
  sentence.property

end LRA.VolumeI.Logic.FirstOrder
