import LRA.Set.ZFC.Axioms
import LRA.Set.ZFC.Public

/-!
Canonical ZFC theory layer.

`ZFC` owns the axioms and mathematics derived from them. The primitive
single-sorted carrier and membership relation live in `LRA.Set.ZFCSet`.
New canonical code should use names under `LRA.Set.ZFC`; the historical
`LRA.Set.Enderton` names remain only as migration compatibility aliases.
-/
