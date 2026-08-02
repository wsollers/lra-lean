import Mathlib.SetTheory.ZFC.Basic

namespace LRA.VolumeI.Set

/-!
The Mathlib `ZFSet` backend.

Status: carrier only. This backend wraps Mathlib's own `ZFSet` (the
`PSet`-quotient construction of a model of ZFC) rather than reimplementing
anything; its operations already exist in Mathlib and are deliberately
not re-exported here yet -- which of them to expose through the project's
set-operation vocabulary, and how, is a decision for the upcoming ops
discussion. See also `Set/ZFC/Model/ZFSetModel.lean`, which shows `ZFSet`
already instantiates the project's own `ZFCModel` interface.
-/

/-- The Mathlib `ZFSet` carrier, named as a project backend. -/
abbrev ZFSet := _root_.ZFSet

end LRA.VolumeI.Set
