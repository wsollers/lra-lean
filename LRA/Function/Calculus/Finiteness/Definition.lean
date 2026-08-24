import LRA.Function.Calculus.Classes.Definition

namespace LRA.Function

open LRA.Set
universe u v

/--
`FinitelyEnumerates` TODO

Predicate logic:

  ∀ {Element : Type u} (values : List Element) (selected : LRA.Set.SetClass Element) (value : Element), List.instMembership.mem values value ↔ selected value

Predicate logic (unfolded):

  ∀ {Element : Type u} (values : List Element) (selected : Element → Prop) (value : Element), List.instMembership.1 values value ↔ selected value

Logical form (Lean):

```lean
def FinitelyEnumerates {Element : Type u}
    (values : List Element) (selected : SetClass Element) : Prop :=
  ∀ value : Element, value ∈ values ↔ selected value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def FinitelyEnumerates {Element : Type u}
    (values : List Element) (selected : SetClass Element) : Prop :=
  ∀ value : Element, value ∈ values ↔ selected value

/--
`HasFiniteEnumeration` TODO

Predicate logic:

  ∀ {Element : Type u} (selected : LRA.Set.SetClass Element), Exists fun values => LRA.Function.FinitelyEnumerates values selected

Predicate logic (unfolded):

  ∀ {Element : Type u} (selected : Element → Prop), Exists fun values => ∀ (value : Element), List.instMembership.1 values value ↔ selected value

Logical form (Lean):

```lean
def HasFiniteEnumeration {Element : Type u}
    (selected : SetClass Element) : Prop :=
  ∃ values : List Element, FinitelyEnumerates values selected
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def HasFiniteEnumeration {Element : Type u}
    (selected : SetClass Element) : Prop :=
  ∃ values : List Element, FinitelyEnumerates values selected

/--
`FiniteImage` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain), Exists fun values => LRA.Function.FinitelyEnumerates values (function.ImageClass source)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop), Exists fun values => ∀ (value : Codomain), List.instMembership.1 values value ↔ Exists fun x => (source x ∧ function x = value)

Logical form (Lean):

```lean
def FiniteImage {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  HasFiniteEnumeration (ImageClass function source)
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
def FiniteImage {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  HasFiniteEnumeration (ImageClass function source)

/--
`FiniteRange` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), Exists fun values => LRA.Function.FinitelyEnumerates values function.RangeClass

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun values => ∀ (value : Codomain), List.instMembership.1 values value ↔ Exists fun x => function x = value

Logical form (Lean):

```lean
def FiniteRange {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasFiniteEnumeration (RangeClass function)
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
def FiniteRange {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasFiniteEnumeration (RangeClass function)

end LRA.Function
