namespace LRA.Identity

universe u v

theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right := by
  rw [ObjectsAreEqual]

theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  rw [ObjectsAreEqual]

theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  rw [ObjectsAreEqual]

theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  rw [LeftsAreEqual, RightsAreEqual]

theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  rw [ObjectsAreEqual]

theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  rw [LeftsAreEqual]

theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  rw [RightsAreEqual]

theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  rw [LeftsAreEqual, RightsAreEqual]

end LRA.Identity
