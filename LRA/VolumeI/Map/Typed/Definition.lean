namespace LRA.Map.Typed

universe u v

/--
A typed map from a domain type to a codomain type.
-/
abbrev TypedMap (Domain : Type u) (Codomain : Type v) :=
  Domain -> Codomain

/--
A typed map from a carrier to itself.
-/
abbrev Endomap (Carrier : Type u) :=
  TypedMap Carrier Carrier

end LRA.Map.Typed
