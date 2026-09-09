import LRA.NumberSystems.PeanoSystem.Theorems.Successor

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PredecessorInPeanoSystem` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (predecessor element : Element), ps.successor predecessor = element

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ps.2 predecessor = element

Logical form (Lean):

```lean
def PredecessorInPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (predecessor element : Element) : Prop :=
  ps.successor predecessor = element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def PredecessorInPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (predecessor element : Element) : Prop :=
  ps.successor predecessor = element

/--
`UniquePredecessor` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Exists fun predecessor => (ps.successor predecessor = element ∧ (∀ (other_predecessor : Element), ps.successor other_predecessor = element → other_predecessor = predecessor))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun predecessor => (ps.2 predecessor = element ∧ (∀ (other_predecessor : Element), ps.2 other_predecessor = element → other_predecessor = predecessor))

Logical form (Lean):

```lean
def UniquePredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) : Prop :=
  exists predecessor : Element,
    ps.successor predecessor = element /\
      forall other_predecessor : Element,
        ps.successor other_predecessor = element ->
        other_predecessor = predecessor
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def UniquePredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) : Prop :=
  exists predecessor : Element,
    ps.successor predecessor = element /\
      forall other_predecessor : Element,
        ps.successor other_predecessor = element ->
        other_predecessor = predecessor

/--
`SuccessorsHaveUniquePredecessors` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), LRA.NumberSystems.PeanoSystem.UniquePredecessor ps (ps.successor element)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    element : Element
  Prove
    Exists fun predecessor => (ps.2 predecessor = ps.2 element ∧ (∀ (other_predecessor : Element), ps.2 other_predecessor = ps.2 element → other_predecessor = predecessor))

Logical form (Lean):

```lean
theorem SuccessorsHaveUniquePredecessors
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    UniquePredecessor ps (ps.successor element)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SuccessorsHaveUniquePredecessors
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    UniquePredecessor ps (ps.successor element) := by
  sorry
/--
`PredecessorUnique` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first_predecessor second_predecessor element : Element), (LRA.NumberSystems.PeanoSystem.PredecessorInPeanoSystem ps first_predecessor element ∧ LRA.NumberSystems.PeanoSystem.PredecessorInPeanoSystem ps second_predecessor element) → first_predecessor = second_predecessor

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    first_predecessor second_predecessor element : Element
  Prove
    (ps.2 first_predecessor = element ∧ ps.2 second_predecessor = element) → first_predecessor = second_predecessor

Logical form (Lean):

```lean
theorem PredecessorUnique
    (ps : PeanoSystem Element SetObject)
    (first_predecessor second_predecessor element : Element) :
    PredecessorInPeanoSystem ps first_predecessor element ->
    PredecessorInPeanoSystem ps second_predecessor element ->
    first_predecessor = second_predecessor
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
theorem PredecessorUnique
    (ps : PeanoSystem Element SetObject)
    (first_predecessor second_predecessor element : Element) :
    PredecessorInPeanoSystem ps first_predecessor element ->
    PredecessorInPeanoSystem ps second_predecessor element ->
    first_predecessor = second_predecessor := by
  sorry
/--
`NonOneElementsHaveAPredecessor` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Ne element ps.base → Exists fun predecessor => ps.successor predecessor = element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    element : Element
  Prove
    (element = ps.1 → False) → Exists fun predecessor => ps.2 predecessor = element

Logical form (Lean):

```lean
theorem NonOneElementsHaveAPredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.base ->
      exists predecessor : Element,
        ps.successor predecessor = element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem NonOneElementsHaveAPredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.base ->
      exists predecessor : Element,
        ps.successor predecessor = element := by
  sorry
/--
`PredecessorExistsUniqueAwayFromOne` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Ne element ps.base → LRA.NumberSystems.PeanoSystem.UniquePredecessor ps element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    element : Element
  Prove
    (element = ps.1 → False) → Exists fun predecessor => (ps.2 predecessor = element ∧ (∀ (other_predecessor : Element), ps.2 other_predecessor = element → other_predecessor = predecessor))

Logical form (Lean):

```lean
theorem PredecessorExistsUniqueAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.base -> UniquePredecessor ps element
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
theorem PredecessorExistsUniqueAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.base -> UniquePredecessor ps element := by
  sorry
/--
`UniquePredecessorCharacterizationAwayFromOne` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Ne element ps.base ↔ LRA.NumberSystems.PeanoSystem.UniquePredecessor ps element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    element : Element
  Prove
    Ne element ps.base ↔ LRA.NumberSystems.PeanoSystem.UniquePredecessor ps element

Logical form (Lean):

```lean
theorem UniquePredecessorCharacterizationAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.base <-> UniquePredecessor ps element
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
theorem UniquePredecessorCharacterizationAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.base <-> UniquePredecessor ps element := by
  sorry
end LRA.NumberSystems.PeanoSystem
