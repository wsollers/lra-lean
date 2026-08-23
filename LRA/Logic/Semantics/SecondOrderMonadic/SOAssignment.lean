import LRA.Logic.Model.SecondOrderMonadic.HenkinModel
import LRA.Logic.Semantics.Assignment

namespace LRA.Logic.SecondOrderMonadic

/-!
Second-order assignments.

Satisfying an `SOFormula` needs two independent assignments: an ordinary
first-order one (`Variable -> M.Domain`, exactly what `Satisfies` already
needed), and a new second-order one assigning each free set variable a
*Henkin-admissible* subset of `M.Domain`.

This admissibility restriction is load-bearing. Under Henkin semantics,
free set variables should range over the same chosen family
`M.SecondOrderDomain` that bound set quantifiers range over; otherwise the
surface silently mixes "Henkin for bound variables" with "full powerset for
free variables". The assignment therefore records not only the denotation
`setAssignment X`, but also a proof that each such denotation lies in
`M.SecondOrderDomain`.

Updating a second-order assignment at one set variable still reuses
`updateAssignment` for the underlying function. The only extra work is to
thread the proof that the newly assigned set is Henkin-admissible.
-/

/-- A second-order assignment over a Henkin model `M`: an element
assignment (as `Satisfies` already needed) paired with a set assignment,
giving a current denotation to every set variable.

Logical form:

```lean
structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain
```
-/
structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain
  setAssignment_admissible :
    ∀ setVariable : SetVariable, setAssignment setVariable ∈ M.SecondOrderDomain

/-- Update a Henkin second-order assignment at one set variable, preserving
the invariant that every free set-variable denotation lies in the chosen
second-order domain.

Logical form:

```lean
def SOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable SetVariable)
    (variable : SetVariable) (subset : Set M.Domain)
    (subset_admissible : subset ∈ M.SecondOrderDomain) :
    SOAssignment M Variable SetVariable
```
-/
def SOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain)
    (subset_admissible : subset ∈ M.SecondOrderDomain) :
    SOAssignment M Variable SetVariable where
  elementAssignment := assignment.elementAssignment
  setAssignment := updateAssignment assignment.setAssignment targetVariable subset
  setAssignment_admissible := by
    intro other
    by_cases h : other = targetVariable
    · subst h
      simp [updateAssignment]
      exact subset_admissible
    · simp [updateAssignment, h]
      exact assignment.setAssignment_admissible other

end LRA.Logic.SecondOrderMonadic
