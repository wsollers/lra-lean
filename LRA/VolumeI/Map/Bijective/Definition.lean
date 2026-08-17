import LRA.Function.Properties.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Bijective

open LRA.Map.Typed
universe u v

/-- Historical typed-map spelling of canonical function bijectivity. -/
abbrev Bijective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.Bijective (LRA.Function.OfTypedFunction map)

end LRA.Map.Bijective
