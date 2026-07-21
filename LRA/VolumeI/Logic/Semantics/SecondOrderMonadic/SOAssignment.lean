import LRA.VolumeI.Logic.Model.SecondOrderMonadic.HenkinModel

namespace LRA.VolumeI.Logic.SecondOrderMonadic

/-!
Second-order assignments.

Satisfying an `SOFormula` needs two independent assignments: an ordinary
first-order one (`Variable -> M.Domain`, exactly what `Satisfies` already
needed), and a new second-order one (`SetVariable -> Set M.Domain`), giving
a current denotation to every set variable the formula might mention.

The second-order assignment is deliberately *unconstrained* -- it may send
a `SetVariable` to any subset of `M.Domain` whatsoever, not only to subsets
already present in `M.SecondOrderDomain`. The Henkin restriction is not
baked into the assignment's type; it is enforced entirely at the point of
quantification, in `SOSatisfies`'s `forallSet`/`existsSet` cases, which
only ever *range over* `M.SecondOrderDomain` when picking a new value to
assign. This mirrors exactly how `Satisfies`'s `∀v` case ranges over
`M.Domain` directly (not some subtype of it), with the quantifier itself
doing the restricting rather than the assignment's type.

Updating a second-order assignment at one set variable reuses
`updateAssignment` unchanged: `Set M.Domain` is, like any other type, a
legitimate instantiation of `updateAssignment`'s generic `Domain`
parameter, so no second, near-duplicate "update a set assignment" function
is needed.
-/

/-- A second-order assignment over a Henkin model `M`: an element
assignment (as `Satisfies` already needed) paired with a set assignment,
giving a current denotation to every set variable. -/
structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain

end LRA.VolumeI.Logic.SecondOrderMonadic
