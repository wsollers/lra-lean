import LRA.VolumeI.Logic.Syntax.FirstOrder.Substitute
import LRA.VolumeI.Set.ZFC.Syntax.FreeVariables
import LRA.VolumeI.Set.ZFC.Syntax.Vocabulary

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
ZFC axiom schemas.

These constructors build individual schema instances from predicate
formulas. The caller supplies the variables that give the predicate its
intended reading; semantic correctness theorems are proved separately when
the model-facing layer needs them.
-/

/-- Separation schema instance for a predicate read as a condition on
`elementVariable`.

The returned formula says: for every source set `x`, there is a subset
`y` whose members are exactly the members of `x` satisfying `predicate`.
The source and subset variables are chosen fresh relative to
`elementVariable` and the predicate's free variables.

This constructor does not prove that `elementVariable` is the intended
distinguished free variable of `predicate`; that is the caller's schema
contract. It also leaves any additional free variables of `predicate` as
parameters of the schema instance rather than taking a universal closure
over them. -/
def separationAxiomFor (elementVariable : ZFCVariable) (predicate : ZFCFormula) :
    ZFCFormula :=
  let predicateVariables := freeVariablesInZFCFormula predicate
  let sourceSet := freshVariableForFinset ({elementVariable} ∪ predicateVariables)
  let subsetSet :=
    freshVariableForFinset ({sourceSet} ∪ {elementVariable} ∪ predicateVariables)
  forallVariable sourceSet
    (existsVariable subsetSet
      (forallVariable elementVariable
        (iffFormula
          (isMemberOf elementVariable subsetSet)
          (andFormula (isMemberOf elementVariable sourceSet) predicate))))

/-- Replacement schema instance for a predicate read as a relation between
an input `inputVariable` and an output `outputVariable`.

The returned formula says: for every source set `x`, *if* `predicate` is
functional on the members of `x` (each input in `x` is related to at most
one output), *then* there is an image set `y` whose members are exactly
the outputs related to some member of `x`. Written schematically as
`∀x (functional(x) → ∃y ∀b (b ∈ y ↔ ∃a (a ∈ x ∧ predicate)))`, where
`functional(x)` is `∀a (a ∈ x → ∀b ∀b' ((predicate ∧ predicate[b := b'])
→ b = b'))`.

The functionality hypothesis is stated for inputs drawn from the source
set `x` (`∀a (a ∈ x → …)`) rather than globally over all sets, as some
presentations (e.g. Kunen's) state it. Restricting to `a ∈ x` is a
*weaker* hypothesis, hence a *stronger* -- but still sound -- axiom: if
`predicate` is single-valued on the members of `x`, the image is still a
set. This is a deliberate choice, not an oversight.

The functionality antecedent needs a second copy of `predicate` with the
output variable renamed to a fresh `b'`; that copy is built with the
generic, unconditional `FirstOrder.substitute`. Here `b'` is chosen fresh
relative to *every* variable occurring in `predicate` -- free *and* bound
(`allVariablesInZFCFormula`) -- together with the input/output variables
and the source/image set variables. Because `b'` therefore occurs nowhere
in `predicate`, the rename introduces no capture whatever `predicate`'s
own binders are, so the functionality antecedent faithfully expresses
single-valuedness for every predicate this schema ranges over -- with no
`IsSubstitutable` side condition left to the caller. The source and image
set variables are likewise chosen fresh, which (as in `separationAxiomFor`)
automatically enforces the standard requirement that neither occurs free
in `predicate`.

This constructor still does not prove that `inputVariable`/`outputVariable`
are the intended distinguished free variables of `predicate`, or that the
resulting formula has the intended reading; those remain the caller's
schema contract and the model-facing layer's separate correctness
theorems. It also leaves any additional free variables of `predicate` as
parameters of the schema instance rather than taking a universal closure
over them. -/
def replacementAxiomFor
    (inputVariable outputVariable : ZFCVariable) (predicate : ZFCFormula) :
    ZFCFormula :=
  let predicateVariables := allVariablesInZFCFormula predicate
  let baseUsed := {inputVariable} ∪ {outputVariable} ∪ predicateVariables
  let sourceSet := freshVariableForFinset baseUsed
  let imageSet := freshVariableForFinset ({sourceSet} ∪ baseUsed)
  let outputVariable' := freshVariableForFinset ({imageSet} ∪ {sourceSet} ∪ baseUsed)
  let renamedPredicate :=
    FirstOrder.substitute outputVariable (variableTerm outputVariable') predicate
  forallVariable sourceSet
    (impliesFormula
      (forallVariable inputVariable
        (impliesFormula
          (isMemberOf inputVariable sourceSet)
          (forallVariable outputVariable
            (forallVariable outputVariable'
              (impliesFormula
                (andFormula predicate renamedPredicate)
                (isEqualTo outputVariable outputVariable'))))))
      (existsVariable imageSet
        (forallVariable outputVariable
          (iffFormula
            (isMemberOf outputVariable imageSet)
            (existsVariable inputVariable
              (andFormula (isMemberOf inputVariable sourceSet) predicate))))))

end LRA.VolumeI.Set.ZFC
