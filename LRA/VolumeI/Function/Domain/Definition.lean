import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Domain

open LRA.Function

universe u v w

/--
**[Abbreviation — DomainOf]**

The source type of a typed function.

Logical form:

```lean
abbrev DomainOf {Domain : Type u} {Codomain : Type v}
    (_map : Function Domain Codomain) : Type u
```
-/
abbrev DomainOf {Domain : Type u} {Codomain : Type v}
    (_map : Function Domain Codomain) : Type u :=
  Domain

/--
An object carries an explicit domain object.
-/
class HasDomain (MapObject : Type u) (DomainObject : outParam (Type v)) where
  domain : MapObject -> DomainObject

/--
**[Definition — Domain]**

Retrieve the declared domain object of a map-like object.

Logical form:

```lean
def Domain {MapObject : Type u} {DomainObject : Type v}
    [HasDomain MapObject DomainObject]
    (mapObject : MapObject) : DomainObject
```
-/
def Domain {MapObject : Type u} {DomainObject : Type v}
    [HasDomain MapObject DomainObject]
    (mapObject : MapObject) : DomainObject :=
  HasDomain.domain mapObject

end LRA.Function.Domain
