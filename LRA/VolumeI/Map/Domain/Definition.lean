import LRA.Function.Calculus.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Domain

open LRA.Map.Typed
universe u v

/-- Historical typed-map spelling of the declared function domain type. -/
abbrev DomainOf {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Type u :=
  LRA.Function.DomainType (LRA.Function.OfTypedFunction map)

/-- Legacy adapter: an object carries an explicit domain object. -/
class HasDomain (MapObject : Type u) (DomainObject : outParam (Type v)) where
  domain : MapObject → DomainObject

/-- Legacy adapter for retrieving the declared domain object of a map-like object. -/
def Domain {MapObject : Type u} {DomainObject : Type v}
    [HasDomain MapObject DomainObject]
    (mapObject : MapObject) : DomainObject :=
  HasDomain.domain mapObject

end LRA.Map.Domain
