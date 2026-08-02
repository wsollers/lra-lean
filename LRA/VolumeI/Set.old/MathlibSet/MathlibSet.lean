import Mathlib.Data.Set.Basic
import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set

/-!
The Mathlib `Set X` backend.

Status: carrier only. This backend wraps Mathlib's own `Set` type rather
than reimplementing anything; its operations already exist in Mathlib and
are deliberately not re-exported here yet -- which of them to expose
through the project's set-operation vocabulary, and how, is a decision
for the upcoming ops discussion.
-/

/-- The Mathlib `Set X` carrier, named as a project backend. -/
abbrev MathlibSet (Point : LRACarrier) := _root_.Set Point

end LRA.VolumeI.Set
