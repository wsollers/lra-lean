import LRA.Function.Operations.Inverse.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Section

open LRA.Map.Typed
universe u v

/-- Historical typed-map spelling of a section (right inverse). -/
abbrev SectionOf {Domain : Type u} {Codomain : Type v}
    (sectionMap : TypedMap Codomain Domain)
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.SectionOfTyped sectionMap map

end LRA.Map.Section
