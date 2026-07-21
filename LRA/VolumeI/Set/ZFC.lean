import LRA.VolumeI.Set.ZFC.Signature
import LRA.VolumeI.Set.ZFC.FreshVariable

/-!
Aggregate import shim for `Set/ZFC/`: the signature of ZFC, and
`freshVariable` (a capture-avoiding fresh-variable generator for building
formulas that introduce their own bound variables). Derived vocabulary
(subset, empty set, pairing, etc.) and the axioms themselves are added
here as they are built.
-/
