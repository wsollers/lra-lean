import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`SuccessorInjective` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second : Element), ps.successor first = ps.successor second → first = second

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
  Prove
    ps.2 first = ps.2 second → first = second

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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Ne (ps.successor element) ps.base

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
  Prove
    ps.2 element = ps.1 → False

Logical form (Lean):

```lean
theorem OneIsNotSuccessor
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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first_element second_element : Element), Ne first_element second_element → Ne (ps.successor first_element) (ps.successor second_element)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    first_element second_element : Element
    elements_not_equal : first_element ≠ second_element
  Prove
    ((first_element = second_element → False) ∧ ps.2 first_element = ps.2 second_element) → False

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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (first second : Element), Ne (ps.successor first) (ps.successor second) → Ne first second

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    first second : Element
  Prove
    ((ps.2 first = ps.2 second → False) ∧ first = second) → False

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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Or (element = ps.base)(Exists fun predecessor => ps.successor predecessor = element)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
  Prove
    Or (element = ps.1)(Exists fun predecessor => ps.2 predecessor = element)

Logical form (Lean):

```lean
theorem EveryElementIsOneOrASuccessor
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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), Ne (ps.successor element) element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
  Prove
    ps.2 element = element → False

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

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (element : Element), ∀ (predecessor : Element), Ne (ps.successor predecessor) element ↔ element = ps.base

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ps : PeanoSystem Element SetObject
    element : Element
  Prove
    ∀ (predecessor : Element), Ne (ps.successor predecessor) element ↔ element = ps.base

Logical form (Lean):

```lean
theorem OneIsUniqueNonSuccessor
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
