universe u

namespace LRA.VolumeI.Set.Finiteness

/-!
LRA-native finiteness predicates.

These definitions use Lean lists as finite witnesses.  Native `Nat` and `List`
are meta-level scaffolding here; Volume II still owns the mathematical
construction of the number systems.
-/

/-- A predicate is listed by a finite list when the list contains exactly the
objects satisfying the predicate. -/
def ListedBy {Alpha : Type u} (predicate : Alpha → Prop)
    (witnesses : List Alpha) : Prop :=
  ∀ element, predicate element ↔ element ∈ witnesses

/-- A predicate is finite when its satisfying objects can be listed by a finite
Lean list. -/
def FinitePredicate {Alpha : Type u} (predicate : Alpha → Prop) : Prop :=
  ∃ witnesses : List Alpha, ListedBy predicate witnesses

/-- A type is finite when all of its inhabitants can be listed by a finite
Lean list. -/
def FiniteType (Alpha : Type u) : Prop :=
  FinitePredicate (fun _ : Alpha => True)

end LRA.VolumeI.Set.Finiteness
