import LRA.Function.Calculus.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Extension

open LRA.Map.Typed
universe u v w

/-- Historical typed-map spelling of the extension relationship. -/
abbrev Extends {SmallDomain : Type u} {LargeDomain : Type v}
    {Codomain : Type w}
    (extension : TypedMap LargeDomain Codomain)
    (original : TypedMap SmallDomain Codomain)
    (inclusion : TypedMap SmallDomain LargeDomain) : Prop :=
  LRA.Function.ExtendsTyped extension original inclusion

end LRA.Map.Extension
