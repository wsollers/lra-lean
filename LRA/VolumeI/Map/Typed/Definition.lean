namespace LRA.Map.Typed

universe u v

/--
**[Abbreviation — TypedMap]**

A typed map from a domain type to a codomain type.

Logical form:

```lean
abbrev TypedMap (Domain : Type u) (Codomain : Type v)
```
-/
abbrev TypedMap (Domain : Type u) (Codomain : Type v) :=
  Domain -> Codomain

/--
**[Abbreviation — Endomap]**

A typed map from a carrier to itself.

Logical form:

```lean
abbrev Endomap (Carrier : Type u)
```
-/
abbrev Endomap (Carrier : Type u) :=
  TypedMap Carrier Carrier

end LRA.Map.Typed
