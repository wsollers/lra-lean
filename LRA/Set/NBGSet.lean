import LRA.Set.NBGSet.Primitives
import LRA.Set.NBGSet.Definition
import LRA.Set.NBGSet.Instances
import LRA.Set.NBGSet.Laws

/-!
Opt-in in-house NBG realization.

This module mirrors `LRA.Set.ZFCSet`: it owns the concrete set/class carriers,
local backend vocabulary, membership, interface operation instances, and law
certificates. The NBG assumptions and derived mathematics are owned by
`LRA.Set.NBG`.
-/
