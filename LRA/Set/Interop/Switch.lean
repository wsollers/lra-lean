import Mathlib.Data.Set.Defs

namespace LRA.Set

/-- The project-wide default notion of "a set of `α`" for code that wants to stay
generic over which set theory backs it. Currently Mathlib's `Set` — ambient,
`Type`-level, impredicative-`Prop`-membership, no size/universe discipline of its own.
Downstream code that specifically wants LRA's own axiomatic set theory (`ZFCSet`,
`NBGSet`, ...) should say so explicitly rather than go through this alias. -/
abbrev LRA_Set (α : Type u) : Type u := _root_.Set α

end LRA.Set
