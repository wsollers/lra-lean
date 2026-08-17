import LRA.Function.Operations.Inverse.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Retraction

open LRA.Map.Typed
universe u v

/-- Historical typed-map spelling of a retraction (left inverse). -/
abbrev RetractionOf {Small : Type u} {Large : Type v}
    (retraction : TypedMap Large Small)
    (inclusion : TypedMap Small Large) : Prop :=
  LRA.Function.RetractionOfTyped retraction inclusion

end LRA.Map.Retraction
