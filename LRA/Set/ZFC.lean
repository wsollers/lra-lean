import LRA.Set.ZFC.Axioms
import LRA.Set.ZFC.Public

/-!
Canonical ZFC theory layer.

`ZFC` owns the axioms and the mathematics derived from them, and is the sole
owner of every name it declares. The primitive single-sorted carrier and its
membership relation live in `LRA.Set.ZFCSet`; the law certificates realizing
this carrier against the set interface live in `LRA.Set.ZFCSet.Laws`.
-/
