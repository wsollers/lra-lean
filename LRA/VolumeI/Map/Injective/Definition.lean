import LRA.Function.Properties.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Injective

open LRA.Map.Typed
universe u v

/-- Historical typed-map spelling of canonical function injectivity. -/
abbrev Injective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.Injective (LRA.Function.OfTypedFunction map)

end LRA.Map.Injective
