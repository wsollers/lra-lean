import LRA.Function.Operations.Composition.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed
universe u v w

/-- Historical typed-map spelling of canonical function composition. -/
abbrev Composition {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle) :
    TypedMap Domain Codomain :=
  LRA.Function.ComposeTyped second first

end LRA.Map.Composition
