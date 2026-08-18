import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Composition

open LRA.Function

universe u v w

/--
**[Definition — Composition]**

Composition of typed functions.

Logical form:

```lean
def Composition {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : Function Middle Codomain)
    (first : Function Domain Middle) :
    Function Domain Codomain
```
-/
def Composition {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : Function Middle Codomain)
    (first : Function Domain Middle) :
    Function Domain Codomain :=
  fun input => second (first input)

end LRA.Function.Composition
