import LRA.Logic.Model.SecondOrderMonadic.HenkinModel
import LRA.Logic.Semantics.Assignment

namespace LRA.Logic.SecondOrderMonadic

/--
`SOAssignment` TODO

Predicate logic:

  structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain
  setAssignment_admissible :
    ∀ setVariable : SetVariable, setAssignment setVariable ∈ M.SecondOrderDomain

Predicate logic (unfolded):

  structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain
  setAssignment_admissible :
    ∀ setVariable : SetVariable, setAssignment setVariable ∈ M.SecondOrderDomain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain
  setAssignment_admissible :
    ∀ setVariable : SetVariable, setAssignment setVariable ∈ M.SecondOrderDomain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain
  setAssignment_admissible :
    ∀ setVariable : SetVariable, setAssignment setVariable ∈ M.SecondOrderDomain

/--
`SOAssignment.updateSetAssignment` TODO

Predicate logic:

  def SOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain)
    (subset_admissible : subset ∈ M.SecondOrderDomain) :
    SOAssignment M Variable SetVariable where
  elementAssignment

Predicate logic (unfolded):

  def SOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain)
    (subset_admissible : subset ∈ M.SecondOrderDomain) :
    SOAssignment M Variable SetVariable where
  elementAssignment (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain)
    (subset_admissible : subset ∈ M.SecondOrderDomain) :
    SOAssignment M Variable SetVariable where
  elementAssignment
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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
