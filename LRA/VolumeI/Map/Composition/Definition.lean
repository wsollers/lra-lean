import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed

universe u v w

/--
**[Definition — Composition]**

Composition of typed maps.

Logical form:

```lean
def Composition {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle) :
    TypedMap Domain Codomain
```
-/
def Composition {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle) :
    TypedMap Domain Codomain :=
  fun input => second (first input)

/--
**[Definition — Compose]**

Compatibility alias for composition.

Logical form:

```lean
def Compose {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle) :
    TypedMap Domain Codomain
```
-/
def Compose {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle) :
    TypedMap Domain Codomain :=
  Composition second first

end LRA.Map.Composition
