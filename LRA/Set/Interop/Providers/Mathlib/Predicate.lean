import LRA.Set.Constructions.Mathlib.PredicateSet

namespace LRA.Set.Interop.Providers.Mathlib.Predicate

universe u

/-- The Mathlib-backed predicate-set provider backed by `Alpha -> Prop`; it intentionally has no dedicated `HasPairing`, since predicate-backed sets lack a same-carrier pairing object and therefore fall back to `Prod`. -/
abbrev PredicateSet (Alpha : Type u) : Type u := _root_.Set Alpha

end LRA.Set.Interop.Providers.Mathlib.Predicate
