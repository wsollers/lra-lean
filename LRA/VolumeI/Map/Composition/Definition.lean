import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed

universe u v w

/--
Composition of typed maps.
-/
def Composition {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle) :
    TypedMap Domain Codomain :=
  fun input => second (first input)

/--
Compatibility alias for composition.
-/
def Compose {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle) :
    TypedMap Domain Codomain :=
  Composition second first

end LRA.Map.Composition
