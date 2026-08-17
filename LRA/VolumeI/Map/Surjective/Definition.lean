import LRA.Function.Properties.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Surjective

open LRA.Map.Typed
universe u v

/-- Historical typed-map spelling of canonical function surjectivity. -/
abbrev Surjective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.Surjective (LRA.Function.OfTypedFunction map)

end LRA.Map.Surjective
