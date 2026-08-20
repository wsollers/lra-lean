import LRA.Identity.Axioms
import LRA.Identity.Equality

namespace LRA.Identity

universe u v

/-- Leibniz substitution as the public substitution theorem. -/
theorem LeibnizSubstitution {Carrier : Type u} {Left Right : Carrier}
    (ObjectsAreIdentical : Left = Right)
    (Property : Carrier -> Prop) :
    Property Left ↔ Property Right := by
  sorry

/-- Equality substitution for an arbitrary unary formula. -/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right := by
  sorry

/-- Substitution preserves unary predicates. -/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right := by
  sorry

/-- Substitution preserves the left coordinate of a binary relation. -/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  sorry

/-- Substitution preserves the right coordinate of a binary relation. -/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  sorry

/-- Substitution preserves both coordinates of a binary relation. -/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  sorry

/-- Substitution preserves arbitrary functions. -/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  sorry

/-- Substitution preserves the left coordinate of a binary operation. -/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  sorry

/-- Substitution preserves the right coordinate of a binary operation. -/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  sorry

/-- Substitution preserves both coordinates of a binary operation. -/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  sorry

end LRA.Identity
