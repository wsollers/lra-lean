import LRA.Relation.Interface
import LRA.Set.Interop.Providers.Mathlib.Predicate

namespace LRA.Relation.Constructions.Mathlib

universe u

abbrev PredicateSetRelation (Carrier : Type u) : Type u :=
  LRA.Set.Interop.Providers.Mathlib.Predicate.PredicateSet (Carrier × Carrier)

def PredicateSetRelation.toEndorelation
    {Carrier : Type u} :
    PredicateSetRelation Carrier → LRA.Relation.Endorelation Carrier :=
  fun relation left right => (left, right) ∈ relation

def PredicateSetRelation.ofEndorelation
    {Carrier : Type u} :
    LRA.Relation.Endorelation Carrier → PredicateSetRelation Carrier :=
  fun relation => { pair | relation pair.1 pair.2 }

end LRA.Relation.Constructions.Mathlib
