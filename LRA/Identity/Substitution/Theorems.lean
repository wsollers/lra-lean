import LRA.Identity.Axioms
import LRA.Identity.Equality

namespace LRA.Identity

universe u v

/-- Leibniz substitution as the public substitution theorem. -/
theorem LeibnizSubstitution {Carrier : Type u} {Left Right : Carrier}
    (ObjectsAreIdentical : Left = Right)
    (Property : Carrier -> Prop) :
    Property Left ↔ Property Right :=
  LeibnizLaw ObjectsAreIdentical Property

/-- Equality substitution for an arbitrary unary formula. -/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right :=
  LeibnizLaw ObjectsAreEqual formula

/-- Substitution preserves unary predicates. -/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right :=
  EqualitySubstitution ObjectsAreEqual predicate

/-- Substitution preserves the left coordinate of a binary relation. -/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed :=
  EqualitySubstitution ObjectsAreEqual (fun value => relation value fixed)

/-- Substitution preserves the right coordinate of a binary relation. -/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right :=
  EqualitySubstitution ObjectsAreEqual (fun value => relation fixed value)

/-- Substitution preserves both coordinates of a binary relation. -/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  have leftSubstitution : relation left right ↔ relation left' right :=
    SubstitutionPreservesRelationsLeft LeftsAreEqual relation
  have rightSubstitution : relation left' right ↔ relation left' right' :=
    SubstitutionPreservesRelationsRight RightsAreEqual relation
  exact Iff.trans leftSubstitution rightSubstitution

/-- Substitution preserves arbitrary functions. -/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  have substitution :=
    LeibnizLaw ObjectsAreEqual (fun value => function left = function value)
  exact substitution.mp (EqualityReflexivity (function left))

/-- Substitution preserves the left coordinate of a binary operation. -/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right :=
  SubstitutionPreservesFunctions LeftsAreEqual (fun value => operation value right)

/-- Substitution preserves the right coordinate of a binary operation. -/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' :=
  SubstitutionPreservesFunctions RightsAreEqual (operation left)

/-- Substitution preserves both coordinates of a binary operation. -/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  have leftSubstitution : operation left right = operation left' right :=
    SubstitutionPreservesOperationsLeft LeftsAreEqual operation
  have rightSubstitution : operation left' right = operation left' right' :=
    SubstitutionPreservesOperationsRight RightsAreEqual operation
  exact EqualityTransitivity leftSubstitution rightSubstitution

end LRA.Identity
