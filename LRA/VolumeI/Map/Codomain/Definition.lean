import LRA.Function.Calculus.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Codomain

open LRA.Map.Typed
universe u v

/-- Historical typed-map spelling of the declared function codomain type. -/
abbrev CodomainOf {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Type v :=
  LRA.Function.CodomainType (LRA.Function.OfTypedFunction map)

/-- Legacy adapter: an object carries an explicit codomain object. -/
class HasCodomain
    (MapObject : Type u) (CodomainObject : outParam (Type v)) where
  codomain : MapObject → CodomainObject

/-- Legacy adapter for retrieving the declared codomain object of a map-like object. -/
def Codomain {MapObject : Type u} {CodomainObject : Type v}
    [HasCodomain MapObject CodomainObject]
    (mapObject : MapObject) : CodomainObject :=
  HasCodomain.codomain mapObject

end LRA.Map.Codomain
