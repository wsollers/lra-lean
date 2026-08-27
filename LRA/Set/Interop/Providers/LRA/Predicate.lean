import LRA.Set.Constructions.TypeSet

namespace LRA.Set.Interop.Providers.LRA.Predicate

universe u

/-- The in-house predicate-set provider backed by `Alpha -> Prop`. -/
abbrev PredicateSet (Alpha : Type u) : Type u := LRA.Set.Constructions.TypeSet Alpha

end LRA.Set.Interop.Providers.LRA.Predicate
