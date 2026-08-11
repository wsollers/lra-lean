import LRA.VolumeI.Set.ModelTheory.Language
import LRA.VolumeI.Set.ModelTheory.Axioms
import LRA.VolumeI.Set.ModelTheory.EndertonModel
import LRA.VolumeI.Set.ModelTheory.ZFSetModel

/-!
Aggregate import for the Set chapter's model-theory workup: the
language `L_∈`, the ZFC axioms as sentences and schemas, and the two
single-sorted set backends as `L_∈` structures with their satisfaction
theorems (`Enderton ⊨ ZFC`, `ZFSet ⊨ ZFC`).

Note: `EndertonModel` and `ZFSetModel` import Mathlib (the latter
essentially); the language and axioms modules are Mathlib-light
(Finset for free variables only).
-/
