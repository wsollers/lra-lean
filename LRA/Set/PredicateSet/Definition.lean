namespace LRA.Set

universe u

/-- The in-house typed predicate-set realization over an ambient carrier. -/
def PredicateSet (Alpha : Type u) := Alpha → Prop

variable {Alpha : Type u}

/-- Membership in a predicate set is evaluation of its defining predicate. -/
instance : Membership Alpha (PredicateSet Alpha) where
  mem containingSet element := containingSet element

/-- Predicate sets are extensional. -/
theorem PredicateSetExtensionality {A B : PredicateSet Alpha}
    (sameMembers : ∀ x : Alpha, x ∈ A ↔ x ∈ B) :
    A = B := by
  funext x
  exact propext (sameMembers x)

/-! Compatibility vocabulary for the pre-standardization `LRASet` name. -/
namespace LRASet

abbrev LRASet (Alpha : Type u) := PredicateSet Alpha

/-- Legacy theorem name forwarding to canonical predicate-set extensionality. -/
theorem LRASetExtensionality {A B : LRASet Alpha}
    (sameMembers : ∀ x : Alpha, x ∈ A ↔ x ∈ B) :
    A = B :=
  PredicateSetExtensionality sameMembers

end LRASet

end LRA.Set
