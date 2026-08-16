import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Domain

open LRA.Map.Typed

universe u v w

/--
The source type of a typed map.
-/
abbrev DomainOf {Domain : Type u} {Codomain : Type v}
    (_map : TypedMap Domain Codomain) : Type u :=
  Domain

/--
An object carries an explicit domain object.
-/
class HasDomain (MapObject : Type u) (DomainObject : outParam (Type v)) where
  domain : MapObject -> DomainObject

/--
Retrieve the declared domain object of a map-like object.
-/
def Domain {MapObject : Type u} {DomainObject : Type v}
    [HasDomain MapObject DomainObject]
    (mapObject : MapObject) : DomainObject :=
  HasDomain.domain mapObject

end LRA.Map.Domain
