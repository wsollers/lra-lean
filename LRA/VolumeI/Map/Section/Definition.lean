import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Section

open LRA.Map.Typed

universe u v

/--
A section of a map chooses a preimage of every codomain element.
-/
def SectionOf {Domain : Type u} {Codomain : Type v}
    (sectionMap : TypedMap Codomain Domain)
    (map : TypedMap Domain Codomain) : Prop :=
  forall output, map (sectionMap output) = output

end LRA.Map.Section
