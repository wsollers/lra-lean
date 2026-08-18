import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Definition

namespace LRA.Map.Codomain

universe u v

/-- Historical typed-map spelling of the declared function codomain type. -/
abbrev CodomainOf {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Type v :=
  LRA.Function.CodomainType (map)

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
