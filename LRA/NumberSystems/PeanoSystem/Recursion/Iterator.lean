import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem.Recursion

open LRA.NumberSystems.PeanoSystem

universe u v w

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`IteratorData` TODO

Predicate logic:

  structure IteratorData (ps : PeanoSystem Element SetObject) where
  Target : Type w
  InitialValue : Target
  StepRule : Target -> Target

Predicate logic (unfolded):

  structure IteratorData (ps : PeanoSystem Element SetObject) where
  Target : Type w
  InitialValue : Target
  StepRule : Target -> Target (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IteratorData (ps : PeanoSystem Element SetObject) where
  Target : Type w
  InitialValue : Target
  StepRule : Target -> Target
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
structure IteratorData (ps : PeanoSystem Element SetObject) where
  Target : Type w
  InitialValue : Target
  StepRule : Target -> Target

/--
`IteratorDataOnPeanoSystem` TODO

Predicate logic:

  abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem Element SetObject) := IteratorData ps

Predicate logic (unfolded):

  abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem Element SetObject) := IteratorData ps (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem Element SetObject) := IteratorData ps
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
abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem Element SetObject) := IteratorData ps

/--
`IteratorFunctionClauses` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target → target) (iterator_function : Element → target), (iterator_function ps.base = initial_value ∧ ∀ (element : Element), iterator_function (ps.successor element) = step_rule (iterator_function element))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : target → target) (iterator_function : Element → target), (iterator_function ps.1 = initial_value ∧ ∀ (element : Element), iterator_function (ps.2 element) = step_rule (iterator_function element))

Logical form (Lean):

```lean
def IteratorFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (iterator_function : Element -> target) : Prop :=
  iterator_function ps.base = initial_value /\
    forall element : Element,
      iterator_function (ps.successor element) =
        step_rule (iterator_function element)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IteratorFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (iterator_function : Element -> target) : Prop :=
  iterator_function ps.base = initial_value /\
    forall element : Element,
      iterator_function (ps.successor element) =
        step_rule (iterator_function element)

/--
`IteratorRelation` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps) (relation : Element → data.Target → Prop), (relation ps.base data.InitialValue ∧ ∀ (element : Element) (value : data.Target), relation element value → relation (ps.successor element) (data.StepRule value))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps) (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value))

Logical form (Lean):

```lean
def IteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (relation : Element -> data.Target -> Prop) : Prop :=
  relation ps.base data.InitialValue /\
    forall element : Element,
      forall value : data.Target,
        relation element value ->
        relation (ps.successor element) (data.StepRule value)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (relation : Element -> data.Target -> Prop) : Prop :=
  relation ps.base data.InitialValue /\
    forall element : Element,
      forall value : data.Target,
        relation element value ->
        relation (ps.successor element) (data.StepRule value)

/--
`MinimalIteratorRelation` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps) (element : Element) (value : data.Target) (relation : Element → data.Target → Prop), LRA.NumberSystems.PeanoSystem.Recursion.IteratorRelation ps data relation → relation element value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps) (element : Element) (value : data.1) (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element value

Logical form (Lean):

```lean
def MinimalIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (element : Element)
    (value : data.Target) : Prop :=
  forall relation : Element -> data.Target -> Prop,
    IteratorRelation ps data relation ->
    relation element value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def MinimalIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (element : Element)
    (value : data.Target) : Prop :=
  forall relation : Element -> data.Target -> Prop,
    IteratorRelation ps data relation ->
    relation element value

/--
`MinimalIteratorRelationIsIteratorRelation` TODO

Predicate logic:

  IteratorRelation ps data (MinimalIteratorRelation ps data)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps), (∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), (∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element value) → ∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation (ps.2 element) (data.3 value))

Logical form (Lean):

```lean
theorem MinimalIteratorRelationIsIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data
      (MinimalIteratorRelation ps data)
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
theorem MinimalIteratorRelationIsIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data
      (MinimalIteratorRelation ps data) := by
  sorry
/--
`IteratorRelationConsistency` TODO

Predicate logic:

  IteratorRelation ps data (MinimalIteratorRelation ps data)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps), (∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), (∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element value) → ∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation (ps.2 element) (data.3 value))

Logical form (Lean):

```lean
theorem IteratorRelationConsistency
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data (MinimalIteratorRelation ps data)
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
theorem IteratorRelationConsistency
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data (MinimalIteratorRelation ps data) := by
  sorry
/--
`MinimalIteratorRelationComplete` TODO

Predicate logic:

  forall element : Element, exists value : data.Target, MinimalIteratorRelation ps data element value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps) (element : Element), Exists fun value => ∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element value

Logical form (Lean):

```lean
theorem MinimalIteratorRelationComplete
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      exists value : data.Target,
        MinimalIteratorRelation ps data element value
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
theorem MinimalIteratorRelationComplete
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      exists value : data.Target,
        MinimalIteratorRelation ps data element value := by
  sorry
/--
`MinimalIteratorRelationDeterministic` TODO

Predicate logic:

  forall element : Element, forall first_value second_value : data.Target, MinimalIteratorRelation ps data element first_value -> MinimalIteratorRelation ps data element second_value -> first_value = second_value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps) (element : Element) (first_value second_value : data.1), (∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element first_value ∧ ∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element second_value) → first_value = second_value

Logical form (Lean):

```lean
theorem MinimalIteratorRelationDeterministic
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value
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
theorem MinimalIteratorRelationDeterministic
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value := by
  sorry
/--
`ForcedValuesAreUnique` TODO

Predicate logic:

  forall element : Element, forall first_value second_value : data.Target, MinimalIteratorRelation ps data element first_value -> MinimalIteratorRelation ps data element second_value -> first_value = second_value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (data : LRA.NumberSystems.PeanoSystem.Recursion.IteratorData ps) (element : Element) (first_value second_value : data.1), (∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element first_value ∧ ∀ (relation : Element → data.1 → Prop), (relation ps.1 data.2 ∧ ∀ (element : Element) (value : data.1), relation element value → relation (ps.2 element) (data.3 value)) → relation element second_value) → first_value = second_value

Logical form (Lean):

```lean
theorem ForcedValuesAreUnique
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value
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
theorem ForcedValuesAreUnique
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value := by
  sorry
/--
`ExistenceOfIteratorFunction` TODO

Predicate logic:

  (∀ initial_value ∈ target), exists iterator_function : Element -> target, IteratorFunctionClauses ps target initial_value step_rule iterator_function

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (target : Type w) (initial_value : target) (step_rule : target → target), Exists fun iterator_function => (iterator_function ps.1 = initial_value ∧ ∀ (element : Element), iterator_function (ps.2 element) = step_rule (iterator_function element))

Logical form (Lean):

```lean
theorem ExistenceOfIteratorFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function
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
theorem ExistenceOfIteratorFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function := by
  sorry
/--
`UniquenessOfIteratorFunctions` TODO

Predicate logic:

  (∀ initial_value ∈ target), IteratorFunctionClauses ps target initial_value step_rule first_iterator -> IteratorFunctionClauses ps target initial_value step_rule second_iterator -> first_iterator = second_iterator

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (target : Type w) (initial_value : target) (step_rule : target → target) (first_iterator second_iterator : Element → target), ((first_iterator ps.1 = initial_value ∧ ∀ (element : Element), first_iterator (ps.2 element) = step_rule (first_iterator element)) ∧ (second_iterator ps.1 = initial_value ∧ ∀ (element : Element), second_iterator (ps.2 element) = step_rule (second_iterator element))) → first_iterator = second_iterator

Logical form (Lean):

```lean
theorem UniquenessOfIteratorFunctions
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (first_iterator second_iterator : Element -> target) :
    IteratorFunctionClauses ps target initial_value step_rule first_iterator ->
      IteratorFunctionClauses ps target initial_value step_rule second_iterator ->
      first_iterator = second_iterator
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
theorem UniquenessOfIteratorFunctions
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (first_iterator second_iterator : Element -> target) :
    IteratorFunctionClauses ps target initial_value step_rule first_iterator ->
      IteratorFunctionClauses ps target initial_value step_rule second_iterator ->
      first_iterator = second_iterator := by
  sorry
/--
`IteratorFunctionWellDefined` TODO

Predicate logic:

  (∀ initial_value ∈ target), exists iterator_function : Element -> target, IteratorFunctionClauses ps target initial_value step_rule iterator_function ∧ forall other_iterator : Element -> target, IteratorFunctionClauses ps target initial_value step_rule other_iterator -> other_iterator = iterator_function

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (target : Type w) (initial_value : target) (step_rule : target → target), Exists fun iterator_function => ((iterator_function ps.1 = initial_value ∧ ∀ (element : Element), iterator_function (ps.2 element) = step_rule (iterator_function element)) ∧ ∀ (other_iterator : Element → target), (other_iterator ps.1 = initial_value ∧ ∀ (element : Element), other_iterator (ps.2 element) = step_rule (other_iterator element)) → other_iterator = iterator_function)

Logical form (Lean):

```lean
theorem IteratorFunctionWellDefined
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem IteratorFunctionWellDefined
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function := by
  sorry
/--
`IteratorGeneratedFunction` TODO

Predicate logic:

  noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    Element -> target

Predicate logic (unfolded):

  noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    Element -> target (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    Element -> target
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    Element -> target :=
  Classical.choose
    (ExistenceOfIteratorFunction
      ps
      fullInduction
      target
      initial_value
      step_rule)

/--
`IteratorBaseValue` TODO

Predicate logic:

  (∀ initial_value ∈ target), IteratorGeneratedFunction ps fullInduction target initial_value step_rule ps.base = initial_value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (fullInduction : ∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) (target : Type w) (initial_value : target) (step_rule : target → target), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.IteratorFunctionClauses ps target initial_value step_rule) ⋯).1 ps.1 = initial_value

Logical form (Lean):

```lean
theorem IteratorBaseValue
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    IteratorGeneratedFunction ps fullInduction target initial_value step_rule ps.base = initial_value
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
theorem IteratorBaseValue
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    IteratorGeneratedFunction ps fullInduction target initial_value step_rule ps.base = initial_value := by
  sorry
/--
`IteratorSuccessorStep` TODO

Predicate logic:

  (∀ initial_value ∈ target ∀ x ∈ Element), IteratorGeneratedFunction ps fullInduction target initial_value step_rule (ps.successor x) = step_rule (IteratorGeneratedFunction ps fullInduction target initial_value step_rule x)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (fullInduction : ∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) (target : Type w) (initial_value : target) (step_rule : target → target) (element : Element), (Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.IteratorFunctionClauses ps target initial_value step_rule) ⋯).1 (ps.2 element) = step_rule ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.IteratorFunctionClauses ps target initial_value step_rule) ⋯).1 element)

Logical form (Lean):

```lean
theorem IteratorSuccessorStep
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (element : Element) :
    IteratorGeneratedFunction ps fullInduction target initial_value step_rule (ps.successor element) =
      step_rule (IteratorGeneratedFunction ps fullInduction target initial_value step_rule element)
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
theorem IteratorSuccessorStep
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (element : Element) :
    IteratorGeneratedFunction ps fullInduction target initial_value step_rule (ps.successor element) =
      step_rule (IteratorGeneratedFunction ps fullInduction target initial_value step_rule element) := by
  sorry
/--
`IterationOfASelfMap` TODO

Predicate logic:

  noncomputable def IterationOfASelfMap
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (initial_value : Element)
    (step_rule : Element -> Element) : Element -> Element :=
  IteratorGeneratedFunction ps fullInduction Element initial_value step_rule

Predicate logic (unfolded):

  noncomputable def IterationOfASelfMap
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (initial_value : Element)
    (step_rule : Element -> Element) : Element -> Element :=
  IteratorGeneratedFunction ps fullInduction Element initial_value step_rule (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def IterationOfASelfMap
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (initial_value : Element)
    (step_rule : Element -> Element) : Element -> Element :=
  IteratorGeneratedFunction ps fullInduction Element initial_value step_rule
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def IterationOfASelfMap
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (initial_value : Element)
    (step_rule : Element -> Element) : Element -> Element :=
  IteratorGeneratedFunction ps fullInduction Element initial_value step_rule

/--
`PeanoIteratorTheorem` TODO

Predicate logic:

  (∀ initial_value ∈ target), exists iterator_function : Element -> target, IteratorFunctionClauses ps target initial_value step_rule iterator_function ∧ forall other_iterator : Element -> target, IteratorFunctionClauses ps target initial_value step_rule other_iterator -> other_iterator = iterator_function

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (target : Type w) (initial_value : target) (step_rule : target → target), Exists fun iterator_function => ((iterator_function ps.1 = initial_value ∧ ∀ (element : Element), iterator_function (ps.2 element) = step_rule (iterator_function element)) ∧ ∀ (other_iterator : Element → target), (other_iterator ps.1 = initial_value ∧ ∀ (element : Element), other_iterator (ps.2 element) = step_rule (other_iterator element)) → other_iterator = iterator_function)

Logical form (Lean):

```lean
theorem PeanoIteratorTheorem
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem PeanoIteratorTheorem
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function := by
  sorry
/--
`StageDependentStepRule` TODO

Predicate logic:

  def StageDependentStepRule
    (_ps : PeanoSystem Element SetObject)
    (target : Type w) : Type (max u w) :=
  Element -> target -> target

Predicate logic (unfolded):

  def StageDependentStepRule
    (_ps : PeanoSystem Element SetObject)
    (target : Type w) : Type (max u w) :=
  Element -> target -> target (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def StageDependentStepRule
    (_ps : PeanoSystem Element SetObject)
    (target : Type w) : Type (max u w) :=
  Element -> target -> target
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def StageDependentStepRule
    (_ps : PeanoSystem Element SetObject)
    (target : Type w) : Type (max u w) :=
  Element -> target -> target

/--
`GeneralRecursiveFunctionClauses` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : LRA.NumberSystems.PeanoSystem.Recursion.StageDependentStepRule ps target) (recursive_function : Element → target), (recursive_function ps.base = initial_value ∧ ∀ (element : Element), recursive_function (ps.successor element) = step_rule element (recursive_function element))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : Element → target → target) (recursive_function : Element → target), (recursive_function ps.1 = initial_value ∧ ∀ (element : Element), recursive_function (ps.2 element) = step_rule element (recursive_function element))

Logical form (Lean):

```lean
def GeneralRecursiveFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (recursive_function : Element -> target) : Prop :=
  recursive_function ps.base = initial_value /\
    forall element : Element,
      recursive_function (ps.successor element) =
        step_rule element (recursive_function element)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def GeneralRecursiveFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (recursive_function : Element -> target) : Prop :=
  recursive_function ps.base = initial_value /\
    forall element : Element,
      recursive_function (ps.successor element) =
        step_rule element (recursive_function element)

/--
`GeneralRecursiveFunction` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : LRA.NumberSystems.PeanoSystem.Recursion.StageDependentStepRule ps target), Exists fun recursive_function => LRA.NumberSystems.PeanoSystem.Recursion.GeneralRecursiveFunctionClauses ps target initial_value step_rule recursive_function

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (target : Type w) (initial_value : target) (step_rule : Element → target → target), Exists fun recursive_function => (recursive_function ps.1 = initial_value ∧ ∀ (element : Element), recursive_function (ps.2 element) = step_rule element (recursive_function element))

Logical form (Lean):

```lean
def GeneralRecursiveFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w) : Prop :=
  forall initial_value : target,
    forall step_rule : StageDependentStepRule ps target,
      exists recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule recursive_function
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def GeneralRecursiveFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w) : Prop :=
  forall initial_value : target,
    forall step_rule : StageDependentStepRule ps target,
      exists recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule recursive_function

/--
`UniquenessOfGeneralRecursiveFunctions` TODO

Predicate logic:

  (∀ initial_value ∈ target), GeneralRecursiveFunctionClauses ps target initial_value step_rule first_recursive_function -> GeneralRecursiveFunctionClauses ps target initial_value step_rule second_recursive_function -> first_recursive_function = second_recursive_function

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (target : Type w) (initial_value : target) (step_rule : Element → target → target) (first_recursive_function second_recursive_function : Element → target), ((first_recursive_function ps.1 = initial_value ∧ ∀ (element : Element), first_recursive_function (ps.2 element) = step_rule element (first_recursive_function element)) ∧ (second_recursive_function ps.1 = initial_value ∧ ∀ (element : Element), second_recursive_function (ps.2 element) = step_rule element (second_recursive_function element))) → first_recursive_function = second_recursive_function

Logical form (Lean):

```lean
theorem UniquenessOfGeneralRecursiveFunctions
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (first_recursive_function second_recursive_function : Element -> target) :
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule first_recursive_function ->
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule second_recursive_function ->
    first_recursive_function = second_recursive_function
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
theorem UniquenessOfGeneralRecursiveFunctions
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (first_recursive_function second_recursive_function : Element -> target) :
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule first_recursive_function ->
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule second_recursive_function ->
    first_recursive_function = second_recursive_function := by
  sorry
/--
`GeneralRecursionByStateEncoding` TODO

Predicate logic:

  (∀ initial_value ∈ target), exists recursive_function : Element -> target, GeneralRecursiveFunctionClauses ps target initial_value step_rule recursive_function

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (target : Type w) (initial_value : target) (step_rule : Element → target → target), Exists fun recursive_function => (recursive_function ps.1 = initial_value ∧ ∀ (element : Element), recursive_function (ps.2 element) = step_rule element (recursive_function element))

Logical form (Lean):

```lean
theorem GeneralRecursionByStateEncoding
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function
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
theorem GeneralRecursionByStateEncoding
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function := by
  sorry
/--
`GeneralRecursionTheoremForPeanoSystem` TODO

Predicate logic:

  (∀ initial_value ∈ target), exists recursive_function : Element -> target, GeneralRecursiveFunctionClauses ps target initial_value step_rule recursive_function ∧ forall other_recursive_function : Element -> target, GeneralRecursiveFunctionClauses ps target initial_value step_rule other_recursive_function -> other_recursive_function = recursive_function

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate ps.1 → (∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element) → ∀ (target : Type w) (initial_value : target) (step_rule : Element → target → target), Exists fun recursive_function => ((recursive_function ps.1 = initial_value ∧ ∀ (element : Element), recursive_function (ps.2 element) = step_rule element (recursive_function element)) ∧ ∀ (other_recursive_function : Element → target), (other_recursive_function ps.1 = initial_value ∧ ∀ (element : Element), other_recursive_function (ps.2 element) = step_rule element (other_recursive_function element)) → other_recursive_function = recursive_function)

Logical form (Lean):

```lean
theorem GeneralRecursionTheoremForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function /\
      forall other_recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule other_recursive_function ->
        other_recursive_function = recursive_function
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem GeneralRecursionTheoremForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function /\
      forall other_recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule other_recursive_function ->
        other_recursive_function = recursive_function := by
  sorry
end LRA.NumberSystems.PeanoSystem.Recursion
