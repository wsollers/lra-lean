namespace LRA.VolumeI.Set

/-!
The from-scratch, inductive (cumulative-hierarchy-style) set object.

Status: placeholder, no definitions yet. The plan is a pre-set tree type
(index type + child function, mirroring Mathlib's `PSet`), an extensional
bisimulation equivalence on it, and `ZFCTreeSet` as the resulting quotient
type -- with real, structurally-recursive operations proved well-defined
against the quotient, rather than existence claims discharged by
`Classical.choose`. Shape to be decided in discussion before any
definitions are added here.
-/

end LRA.VolumeI.Set
