import LRA.VolumeI.Identity.Axioms.Axioms

/-!
Derived identity theorems.

Reflexivity and Leibniz substitution are primitive identity axioms. Symmetry,
transitivity, equivalence-relation status, substitution results, and congruence
are derived here for later mathematics.
-/

namespace LRA.Identity

universe u v

/--
Equality is symmetric.

Logical form:

```lean
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left
```
-/
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left := by
  exact Eq.symm ObjectsAreEqual

/--
Equality is transitive.

Logical form:

```lean
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third
```
-/
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  exact Eq.trans FirstEqualsSecond SecondEqualsThird

/-- TeX label: `def:definitional-propositional-equality`.

Logical form:

```lean
def PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right
```
-/
def PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `ax:equality-substitution`.

Logical form:

```lean
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right
```
-/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right :=
  by
    exact LeibnizLaw ObjectsAreEqual formula

/-- TeX label: `prop:substitution-preserves-predicates`.

Logical form:

```lean
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right
```
-/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right :=
  by
    exact EqualitySubstitution ObjectsAreEqual predicate

/-- TeX label: `prop:substitution-preserves-relations-left`.

Logical form:

```lean
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed
```
-/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  exact EqualitySubstitution ObjectsAreEqual (fun value => relation value fixed)

/-- TeX label: `prop:substitution-preserves-relations-right`.

Logical form:

```lean
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right
```
-/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  exact EqualitySubstitution ObjectsAreEqual (fun value => relation fixed value)

/-- TeX label: `prop:substitution-preserves-relations-full`.

Logical form:

```lean
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right'
```
-/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  subst LeftsAreEqual
  subst RightsAreEqual
  rfl

/-- TeX label: `prop:substitution-preserves-functions`.

Logical form:

```lean
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right
```
-/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  exact congrArg function ObjectsAreEqual

/-- TeX label: `prop:substitution-preserves-operations-left`.

Logical form:

```lean
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right
```
-/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  exact congrArg (fun value => operation value right) LeftsAreEqual

/-- TeX label: `prop:substitution-preserves-operations-right`.

Logical form:

```lean
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right'
```
-/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  exact congrArg (operation left) RightsAreEqual

/-- TeX label: `prop:substitution-preserves-operations-full`.

Logical form:

```lean
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right'
```
-/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  subst LeftsAreEqual
  subst RightsAreEqual
  rfl

/-- TeX label: `prop:congruence-with-respect-to-equality-is-automatic`.

Logical form:

```lean
theorem CongruenceWithRespectToEqualityIsAutomatic {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right') :
    (∀ predicate : Carrier -> Prop, predicate left ↔ predicate left') ∧
      (∀ relation : Carrier -> Carrier -> Prop,
        relation left right ↔ relation left' right') ∧
      (∀ operation : Carrier -> Carrier -> Carrier,
        operation left right = operation left' right')
```
-/
theorem CongruenceWithRespectToEqualityIsAutomatic {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right') :
    (∀ predicate : Carrier -> Prop, predicate left ↔ predicate left') ∧
      (∀ relation : Carrier -> Carrier -> Prop,
        relation left right ↔ relation left' right') ∧
      (∀ operation : Carrier -> Carrier -> Carrier,
        operation left right = operation left' right') := by
  constructor
  · intro predicate
    exact EqualitySubstitution LeftsAreEqual predicate
  constructor
  · intro relation
    exact SubstitutionPreservesRelations LeftsAreEqual RightsAreEqual relation
  · intro operation
    exact SubstitutionPreservesOperations LeftsAreEqual RightsAreEqual operation

end LRA.Identity
