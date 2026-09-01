import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`SuccessorInjective` TODO

Predicate logic:

  forall first second : Element, ps.successor first = ps.successor second -> first = second

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second : Element), ps.2 first = ps.2 second → first = second

Logical form (Lean):

```lean
theorem SuccessorInjective
    (ps : PeanoSystem Element SetObject) :
    forall first second : Element,
      ps.successor first = ps.successor second -> first = second
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
theorem SuccessorInjective
    (ps : PeanoSystem Element SetObject) :
    forall first second : Element,
      ps.successor first = ps.successor second -> first = second := by
  sorry

/--
`OneIsNotSuccessor` TODO

Predicate logic:

  forall element : Element, ps.successor element ≠ ps.base

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), ps.2 element = ps.1 → False

Logical form (Lean):

```lean
theorem BaseIsNotSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ ps.base
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
theorem OneIsNotSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ ps.base := by
  sorry

/--
`SuccessorPreservesInequality` TODO

Predicate logic:

  (∀ x y ∈ Element), ps.successor x ≠ ps.successor y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first_element second_element : Element), (first_element = second_element → False ∧ ps.2 first_element = ps.2 second_element) → False

Logical form (Lean):

```lean
theorem SuccessorPreservesInequality
    (ps : PeanoSystem Element SetObject)
    (first_element second_element : Element)
    (elements_not_equal : first_element ≠ second_element) :
    ps.successor first_element ≠ ps.successor second_element
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
theorem SuccessorPreservesInequality
    (ps : PeanoSystem Element SetObject)
    (first_element second_element : Element)
    (elements_not_equal : first_element ≠ second_element) :
    ps.successor first_element ≠ ps.successor second_element := by
  sorry

/--
`SuccessorInequalityReflection` TODO

Predicate logic:

  (∀ x y ∈ Element), ps.successor x ≠ ps.successor y -> x ≠ y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second : Element), (ps.2 first = ps.2 second → False ∧ first = second) → False

Logical form (Lean):

```lean
theorem SuccessorInequalityReflection
    (ps : PeanoSystem Element SetObject)
    (first second : Element) :
    ps.successor first ≠ ps.successor second -> first ≠ second
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
theorem SuccessorInequalityReflection
    (ps : PeanoSystem Element SetObject)
    (first second : Element) :
    ps.successor first ≠ ps.successor second -> first ≠ second := by
  sorry

/--
`EveryElementIsOneOrASuccessor` TODO

Predicate logic:

  forall element : Element, element = ps.base ∨ exists predecessor : Element, ps.successor predecessor = element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Or (element = ps.1)(Exists fun predecessor => ps.2 predecessor = element)

Logical form (Lean):

```lean
theorem EveryElementIsBaseOrASuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      element = ps.base \/
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

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, use

-/
theorem EveryElementIsOneOrASuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      element = ps.base \/
        exists predecessor : Element,
          ps.successor predecessor = element := by
  sorry

/--
`NoObjectIsItsOwnSuccessor` TODO

Predicate logic:

  forall element : Element, ps.successor element ≠ element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), ps.2 element = element → False

Logical form (Lean):

```lean
theorem NoObjectIsItsOwnSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ element
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
theorem NoObjectIsItsOwnSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ element := by
  sorry

/--
`OneIsUniqueNonSuccessor` TODO

Predicate logic:

  (∀ x ∈ Element), forall predecessor ∈ Element, ps.successor predecessor ≠ x <-> x = ps.base

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), ∀ (predecessor : Element), ps.2 predecessor = element → False ↔ element = ps.1

Logical form (Lean):

```lean
theorem BaseIsUniqueNonSuccessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    (forall predecessor : Element,
      ps.successor predecessor ≠ element) <->
    element = ps.base
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
theorem OneIsUniqueNonSuccessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    (forall predecessor : Element,
      ps.successor predecessor ≠ element) <->
    element = ps.base := by
  sorry

/--
`OneIsTheUniqueNonSuccessor` TODO

Predicate logic:

  abbrev OneIsTheUniqueNonSuccessor := @OneIsUniqueNonSuccessor

Predicate logic (unfolded):

  abbrev OneIsTheUniqueNonSuccessor := @OneIsUniqueNonSuccessor (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev OneIsTheUniqueNonSuccessor := @OneIsUniqueNonSuccessor
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
abbrev OneIsTheUniqueNonSuccessor := @OneIsUniqueNonSuccessor

end LRA.NumberSystems.PeanoSystem
