import LRA.Set.Constructions.Mathlib.PredicateSet

namespace LRA.Set.Interop.Providers.Mathlib.Predicate

universe u

/-- The Mathlib-backed predicate-set provider backed by `Alpha -> Prop`. -/
abbrev PredicateSet (Alpha : Type u) : Type u := _root_.Set Alpha

end LRA.Set.Interop.Providers.Mathlib.Predicate
