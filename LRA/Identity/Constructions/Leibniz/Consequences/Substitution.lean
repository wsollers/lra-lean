import LRA.Identity.Constructions.Leibniz.Axioms
import LRA.Identity.Constructions.Leibniz.Definitions.Equality

namespace LRA.Identity

universe u v

/--
`LeibnizSubstitution` TODO

Predicate logic:

  (Left = Right) → Property Left ↔ Property Right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {Left Right : Carrier}, Left = Right → ∀ (Property : Carrier → Prop), Property Left ↔ Property Right

Logical form (Lean):

```lean
theorem LeibnizSubstitution {Carrier : Type u} {Left Right : Carrier}
    (ObjectsAreIdentical : Left = Right)
    (Property : Carrier -> Prop) :
    Property Left ↔ Property Right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem LeibnizSubstitution {Carrier : Type u} {Left Right : Carrier}
    (ObjectsAreIdentical : Left = Right)
    (Property : Carrier -> Prop) :
    Property Left ↔ Property Right := by
  rw [ObjectsAreIdentical]


/--
`EqualitySubstitution` TODO

Predicate logic:

  (left = right) → formula left ↔ formula right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right : Carrier}, left = right → ∀ (formula : Carrier → Prop), formula left ↔ formula right

Logical form (Lean):

```lean
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem EqualitySubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (formula : Carrier -> Prop) :
    formula left ↔ formula right := by
  rw [ObjectsAreEqual]

/--
`SubstitutionPreservesPredicates` TODO

Predicate logic:

  (left = right) → predicate left ↔ predicate right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right : Carrier}, left = right → ∀ (predicate : Carrier → Prop), predicate left ↔ predicate right

Logical form (Lean):

```lean
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SubstitutionPreservesPredicates {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier -> Prop) :
    predicate left ↔ predicate right := by
  rw [ObjectsAreEqual]

/--
`SubstitutionPreservesRelationsLeft` TODO

Predicate logic:

  (left = right) → relation left fixed ↔ relation right fixed

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right fixed : Carrier}, left = right → ∀ (relation : Carrier → Carrier → Prop), relation left fixed ↔ relation right fixed

Logical form (Lean):

```lean
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SubstitutionPreservesRelationsLeft {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation left fixed ↔ relation right fixed := by
  rw [ObjectsAreEqual]


/--
`SubstitutionPreservesRelationsRight` TODO

Predicate logic:

  (left = right) → relation fixed left ↔ relation fixed right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right fixed : Carrier}, left = right → ∀ (relation : Carrier → Carrier → Prop), relation fixed left ↔ relation fixed right

Logical form (Lean):

```lean
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SubstitutionPreservesRelationsRight {Carrier : Type u}
    {left right fixed : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Carrier -> Prop) :
    relation fixed left ↔ relation fixed right := by
  rw [ObjectsAreEqual]

/--
`SubstitutionPreservesRelations` TODO

Predicate logic:

  (left = left' ∧ right = right') → relation left right ↔ relation left' right'

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left left' right right' : Carrier}, (left = left' ∧ right = right') → ∀ (relation : Carrier → Carrier → Prop), relation left right ↔ relation left' right'

Logical form (Lean):

```lean
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SubstitutionPreservesRelations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  rw [LeftsAreEqual]
  rw [RightsAreEqual]

/--
`SubstitutionPreservesFunctions` TODO

Predicate logic:

  (left = right) → function left = function right

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} {left right : Domain}, left = right → ∀ (function : Domain → Codomain), function left = function right

Logical form (Lean):

```lean
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem SubstitutionPreservesFunctions {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  rw [ObjectsAreEqual]

/--
`SubstitutionPreservesOperationsLeft` TODO

Predicate logic:

  (left = left') → operation left right = operation left' right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left left' right : Carrier}, left = left' → ∀ (operation : Carrier → Carrier → Carrier), operation left right = operation left' right

Logical form (Lean):

```lean
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem SubstitutionPreservesOperationsLeft {Carrier : Type u}
    {left left' right : Carrier}
    (LeftsAreEqual : left = left')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right := by
  rw [LeftsAreEqual]

/--
`SubstitutionPreservesOperationsRight` TODO

Predicate logic:

  (right = right') → operation left right = operation left right'

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right right' : Carrier}, right = right' → ∀ (operation : Carrier → Carrier → Carrier), operation left right = operation left right'

Logical form (Lean):

```lean
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem SubstitutionPreservesOperationsRight {Carrier : Type u}
    {left right right' : Carrier}
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left right' := by
  rw [RightsAreEqual]

/--
`SubstitutionPreservesOperations` TODO

Predicate logic:

  (left = left' ∧ right = right') → operation left right = operation left' right'

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left left' right right' : Carrier}, (left = left' ∧ right = right') → ∀ (operation : Carrier → Carrier → Carrier), operation left right = operation left' right'

Logical form (Lean):

```lean
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem SubstitutionPreservesOperations {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  rw [RightsAreEqual]
  rw [LeftsAreEqual]

end LRA.Identity
