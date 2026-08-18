import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Codomain

open LRA.Function

universe u v w

/--
**[Abbreviation — CodomainOf]**

The target type of a typed function.

Logical form:

```lean
abbrev CodomainOf {Domain : Type u} {Codomain : Type v}
    (_map : Function Domain Codomain) : Type v
```
-/
abbrev CodomainOf {Domain : Type u} {Codomain : Type v}
    (_map : Function Domain Codomain) : Type v :=
  Codomain

/--
An object carries an explicit codomain object.
-/
class HasCodomain
    (MapObject : Type u) (CodomainObject : outParam (Type v)) where
  codomain : MapObject -> CodomainObject

/--
**[Definition — Codomain]**

Retrieve the declared codomain object of a map-like object.

Logical form:

```lean
def Codomain {MapObject : Type u} {CodomainObject : Type v}
    [HasCodomain MapObject CodomainObject]
    (mapObject : MapObject) : CodomainObject
```
-/
def Codomain {MapObject : Type u} {CodomainObject : Type v}
    [HasCodomain MapObject CodomainObject]
    (mapObject : MapObject) : CodomainObject :=
  HasCodomain.codomain mapObject

end LRA.Function.Codomain
