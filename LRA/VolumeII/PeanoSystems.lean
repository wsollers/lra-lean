import LRA.NumberSystems.PeanoSystem
import LRA.VolumeII.PeanoSystems.Presburger

/-!
Aggregate import for the current TeX-facing Volume II Peano-system layer.

The generic Peano-system axioms, structure, induction, recursion, and
categoricity theorem have promoted to `LRA.NumberSystems.PeanoSystem` per
§1.6.10/§7.7 step 4; this file now carries only Presburger arithmetic, which
is a natural-number construction (additive-only) rather than the shared
generic layer, and stays here pending its own construction's promotion.
-/
