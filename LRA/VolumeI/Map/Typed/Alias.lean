import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Typed

universe u v

/-!
Source-facing aliases for typed maps.

The canonical LRA name is `TypedMap`; aliases record common source vocabulary
without changing the theorem namespace.
-/

/--
Sources: Sohrab (*Basic Real Analysis*) says a function is also called a
mapping or map; many topology and analysis texts use "map" as the default term.
-/
abbrev Map (Domain : Type u) (Codomain : Type v) :=
  TypedMap Domain Codomain

/--
Sources: Zorich, Munkres, Conway, and Hilgert regularly use "mapping" for a
typed function between spaces or structures.
-/
abbrev Mapping (Domain : Type u) (Codomain : Type v) :=
  TypedMap Domain Codomain

/--
Sources: algebra and topology texts often call maps from a space to itself
"self-maps"; LRA keeps the canonical name `Endomap`.
-/
abbrev SelfMap (Carrier : Type u) :=
  Endomap Carrier

end LRA.Map.Typed
