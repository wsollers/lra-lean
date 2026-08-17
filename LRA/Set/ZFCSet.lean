import LRA.Set.ZFCSet.Primitives
import LRA.Set.ZFCSet.Definition
import LRA.Set.ZFCSet.Instances
import LRA.Set.ZFCSet.Laws

/-!
Opt-in in-house single-sorted ZFC set realization.

This module owns the concrete carrier, local backend vocabulary, membership,
interface operation instances, and law certificates. The ZFC assumptions and
derived mathematics are owned by `LRA.Set.ZFC`.
-/
