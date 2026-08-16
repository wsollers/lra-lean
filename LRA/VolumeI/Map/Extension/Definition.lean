import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Extension

open LRA.Map.Typed

universe u v w

/--
`extension` extends `original` along an inclusion-like map.
-/
def Extends {SmallDomain : Type u} {LargeDomain : Type v}
    {Codomain : Type w}
    (extension : TypedMap LargeDomain Codomain)
    (original : TypedMap SmallDomain Codomain)
    (inclusion : TypedMap SmallDomain LargeDomain) : Prop :=
  forall input, extension (inclusion input) = original input

end LRA.Map.Extension
