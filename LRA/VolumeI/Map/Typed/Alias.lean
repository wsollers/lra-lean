import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Typed

universe u v

/-!
Source-facing aliases for typed maps.

The canonical LRA name is `TypedMap`; aliases record common source vocabulary
without changing the theorem namespace.
-/

/--
**[Abbreviation — Map]**

Sources: Sohrab (*Basic Real Analysis*) says a function is also called a
mapping or map; many topology and analysis texts use "map" as the default term.

Logical form:

```lean
abbrev Map (Domain : Type u) (Codomain : Type v)
```
-/
abbrev Map (Domain : Type u) (Codomain : Type v) :=
  TypedMap Domain Codomain

/--
**[Abbreviation — Mapping]**

Sources: Zorich, Munkres, Conway, and Hilgert regularly use "mapping" for a
typed function between spaces or structures.

Logical form:

```lean
abbrev Mapping (Domain : Type u) (Codomain : Type v)
```
-/
abbrev Mapping (Domain : Type u) (Codomain : Type v) :=
  TypedMap Domain Codomain

/--
**[Abbreviation — SelfMap]**

Sources: algebra and topology texts often call maps from a space to itself
"self-maps"; LRA keeps the canonical name `Endomap`.

Logical form:

```lean
abbrev SelfMap (Carrier : Type u)
```
-/
abbrev SelfMap (Carrier : Type u) :=
  Endomap Carrier

end LRA.Map.Typed
