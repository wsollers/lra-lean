import LRA.Set
import LRA.Set.Constructions.TypeSet
import LRA.Set.Constructions.ZFCSet.Axioms
import LRA.Set.Constructions.ZFCSet
import LRA.Set.Interface.ModelTheory
import LRA.SetSystems

namespace LRA.NumberSystems.PeanoSystem

universe u v

/--
`PeanoSystem` TODO

Predicate logic:

  structure PeanoSystem (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  one : Element
  successor : Element -> Element
  one_not_successor :
    forall element : Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      one ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset

Predicate logic (unfolded):

  structure PeanoSystem (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  one : Element
  successor : Element -> Element
  one_not_successor :
    forall element : Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      one ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PeanoSystem (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  one : Element
  successor : Element -> Element
  one_not_successor :
    forall element : Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      one ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
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
structure PeanoSystem (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  one : Element
  successor : Element -> Element
  one_not_successor :
    forall element : Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      one ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset

/--
`PredicateSetComprehensionAdequacy` TODO

Predicate logic:

  structure PredicateSetComprehensionAdequacy
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Represent : Set Element -> SetObject
  MembershipIff :
    forall (predicate : Set Element) (element : Element),
      element ∈ Represent predicate ↔ predicate element

Predicate logic (unfolded):

  structure PredicateSetComprehensionAdequacy
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Represent : Set Element -> SetObject
  MembershipIff :
    forall (predicate : Set Element) (element : Element),
      element ∈ Represent predicate ↔ predicate element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PredicateSetComprehensionAdequacy
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Represent : Set Element -> SetObject
  MembershipIff :
    forall (predicate : Set Element) (element : Element),
      element ∈ Represent predicate ↔ predicate element
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
structure PredicateSetComprehensionAdequacy
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Represent : Set Element -> SetObject
  MembershipIff :
    forall (predicate : Set Element) (element : Element),
      element ∈ Represent predicate ↔ predicate element

section

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PeanoSystemFromTex` TODO

Predicate logic:

  abbrev PeanoSystemFromTex := @PeanoSystem

Predicate logic (unfolded):

  abbrev PeanoSystemFromTex := @PeanoSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PeanoSystemFromTex := @PeanoSystem
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
abbrev PeanoSystemFromTex := @PeanoSystem

/--
`SuccessorClosedSubset` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject) (element : Element), element ∈ subset → ps.successor element ∈ subset

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject) (element : Element), inst.1 subset element → inst.1 subset (ps.2 element)

Logical form (Lean):

```lean
def SuccessorClosedSubset
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  forall element : Element,
    element ∈ subset ->
    ps.successor element ∈ subset
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
def SuccessorClosedSubset
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  forall element : Element,
    element ∈ subset ->
    ps.successor element ∈ subset

/--
`InductiveSubsetOfPeanoSystem` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (ps.one ∈ subset ∧ LRA.NumberSystems.PeanoSystem.SuccessorClosedSubset ps subset)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (subset : SetObject), (inst.1 subset ps.1 ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (ps.2 element))

Logical form (Lean):

```lean
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  ps.one ∈ subset /\
    SuccessorClosedSubset ps subset
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  ps.one ∈ subset /\
    SuccessorClosedSubset ps subset

/--
`FullPredicateInduction` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (predicate : Set Element), (predicate ps.one ∧ ∀ (element : Element), predicate element → predicate (ps.successor element)) → ∀ (element : Element), predicate element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (predicate : Element → Prop), (predicate ps.1 ∧ ∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element

Logical form (Lean):

```lean
def FullPredicateInduction
    (ps : PeanoSystem Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate ps.one ->
    (forall element : Element,
      predicate element ->
      predicate (ps.successor element)) ->
    forall element : Element,
      predicate element
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
def FullPredicateInduction
    (ps : PeanoSystem Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate ps.one ->
    (forall element : Element,
      predicate element ->
      predicate (ps.successor element)) ->
    forall element : Element,
      predicate element

/--
`FullPredicateInductionOfComprehensionAdequacy` TODO

Predicate logic:

  FullPredicateInduction ps

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (ps : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject) (a : LRA.NumberSystems.PeanoSystem.PredicateSetComprehensionAdequacy Element SetObject) (predicate : Element → Prop), (predicate ps.1 ∧ ∀ (element : Element), predicate element → predicate (ps.2 element)) → ∀ (element : Element), predicate element

Logical form (Lean):

```lean
theorem FullPredicateInductionOfComprehensionAdequacy
    (ps : PeanoSystem Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullPredicateInduction ps
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
theorem FullPredicateInductionOfComprehensionAdequacy
    (ps : PeanoSystem Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullPredicateInduction ps := by

  sorry

end

end LRA.NumberSystems.PeanoSystem
