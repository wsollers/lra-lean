import LRA.Set.TGSet.Primitives
import LRA.Set.TGSet.Definition
import LRA.Set.TGSet.Instances
import LRA.Set.TGSet.Laws

/-!
Opt-in in-house single-sorted TG set realization.

This module mirrors `LRA.Set.ZFCSet`: it owns the concrete carrier, local
backend vocabulary, membership, interface operation instances, and law
certificates. The TG assumptions and derived mathematics are owned by
`LRA.Set.TG`.
-/
