import Mathlib.Data.Set.Defs
import LRA.ModelTheory.SecondOrderMonadic.FullModel
import LRA.Logic.Semantics.Assignment

open LRA.Logic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
`FullSOAssignment` Assignments for full monadic second-order semantics carry element assignments and arbitrary subset assignments, with no separate admissibility proof because all subsets are available.

Predicate logic:

  structure FullSOAssignment
      {S : Signature} (M : FullModel S) (Variable SetVariable : Type) where
    elementAssignment : Variable → M.Domain
    setAssignment : SetVariable → Set M.Domain

Predicate logic (unfolded):

  structure FullSOAssignment
      {S : Signature} (M : FullModel S) (Variable SetVariable : Type) where
    elementAssignment : Variable → M.Domain
    setAssignment : SetVariable → Set M.Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FullSOAssignment
    {S : Signature} (M : FullModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable → M.Domain
  setAssignment : SetVariable → Set M.Domain
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
structure FullSOAssignment
    {S : Signature} (M : FullModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable → M.Domain
  setAssignment : SetVariable → Set M.Domain

/--
`FullSOAssignment.updateSetAssignment` TODO

Predicate logic:

  def FullSOAssignment.updateSetAssignment
      {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
      {M : FullModel S}
      (assignment : FullSOAssignment M Variable SetVariable)
      (targetVariable : SetVariable) (subset : Set M.Domain) :
      FullSOAssignment M Variable SetVariable where
    elementAssignment := assignment.elementAssignment
    setAssignment := updateAssignment assignment.setAssignment targetVariable subset

Predicate logic (unfolded):

  def FullSOAssignment.updateSetAssignment
      {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
      {M : FullModel S}
      (assignment : FullSOAssignment M Variable SetVariable)
      (targetVariable : SetVariable) (subset : Set M.Domain) :
      FullSOAssignment M Variable SetVariable where
    elementAssignment := assignment.elementAssignment
    setAssignment := updateAssignment assignment.setAssignment targetVariable subset (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FullSOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : FullModel S}
    (assignment : FullSOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain) :
    FullSOAssignment M Variable SetVariable where
  elementAssignment := assignment.elementAssignment
  setAssignment := updateAssignment assignment.setAssignment targetVariable subset
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
def FullSOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : FullModel S}
    (assignment : FullSOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain) :
    FullSOAssignment M Variable SetVariable where
  elementAssignment := assignment.elementAssignment
  setAssignment := updateAssignment assignment.setAssignment targetVariable subset

end LRA.ModelTheory.SecondOrderMonadic
