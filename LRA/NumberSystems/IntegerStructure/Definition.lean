
import LRA.Set
import LRA.Set.Constructions.TypeSet
import LRA.Set.Constructions.ZFCSet.Axioms
import LRA.Set.Constructions.ZFCSet
import LRA.Set.Model
import LRA.SetSystems

namespace LRA.NumberSystems.IntegerStructure

universe u v

/--
`iterate` TODO

Predicate logic:

  def iterate {Alpha : Type u} (f : Alpha -> Alpha) : Nat -> Alpha -> Alpha
  | 0, x => x
  | n + 1, x => f (iterate f n x)

Predicate logic (unfolded):

  def iterate {Alpha : Type u} (f : Alpha -> Alpha) : Nat -> Alpha -> Alpha
  | 0, x => x
  | n + 1, x => f (iterate f n x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def iterate {Alpha : Type u} (f : Alpha -> Alpha) : Nat -> Alpha -> Alpha
  | 0, x => x
  | n + 1, x => f (iterate f n x)
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
def iterate {Alpha : Type u} (f : Alpha -> Alpha) : Nat -> Alpha -> Alpha
  | 0, x => x
  | n + 1, x => f (iterate f n x)

/--
`IntegerStructure` TODO

Predicate logic:

  structure IntegerStructure (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  one : Element
  negativeOne : Element
  successor : Element -> Element
  predecessor : Element -> Element
  predecessor_successor :
    forall element : Element, predecessor (successor element) = element
  successor_predecessor :
    forall element : Element, successor (predecessor element) = element
  successor_zero : successor zero = one
  predecessor_zero : predecessor zero = negativeOne
  aperiodic :
    forall iterations : Nat, 0 < iterations ->
      iterate successor iterations zero ≠ zero
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element, element ∈ subset -> successor element ∈ subset) ->
      (forall element : Element, element ∈ subset -> predecessor element ∈ subset) ->
      forall element : Element, element ∈ subset

Predicate logic (unfolded):

  structure IntegerStructure (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  one : Element
  negativeOne : Element
  successor : Element -> Element
  predecessor : Element -> Element
  predecessor_successor :
    forall element : Element, predecessor (successor element) = element
  successor_predecessor :
    forall element : Element, successor (predecessor element) = element
  successor_zero : successor zero = one
  predecessor_zero : predecessor zero = negativeOne
  aperiodic :
    forall iterations : Nat, 0 < iterations ->
      iterate successor iterations zero ≠ zero
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element, element ∈ subset -> successor element ∈ subset) ->
      (forall element : Element, element ∈ subset -> predecessor element ∈ subset) ->
      forall element : Element, element ∈ subset (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerStructure (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  one : Element
  negativeOne : Element
  successor : Element -> Element
  predecessor : Element -> Element
  predecessor_successor :
    forall element : Element, predecessor (successor element) = element
  successor_predecessor :
    forall element : Element, successor (predecessor element) = element
  successor_zero : successor zero = one
  predecessor_zero : predecessor zero = negativeOne
  aperiodic :
    forall iterations : Nat, 0 < iterations ->
      iterate successor iterations zero ≠ zero
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element, element ∈ subset -> successor element ∈ subset) ->
      (forall element : Element, element ∈ subset -> predecessor element ∈ subset) ->
      forall element : Element, element ∈ subset
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
structure IntegerStructure (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  one : Element
  negativeOne : Element
  successor : Element -> Element
  predecessor : Element -> Element
  predecessor_successor :
    forall element : Element, predecessor (successor element) = element
  successor_predecessor :
    forall element : Element, successor (predecessor element) = element
  successor_zero : successor zero = one
  predecessor_zero : predecessor zero = negativeOne
  aperiodic :
    forall iterations : Nat, 0 < iterations ->
      iterate successor iterations zero ≠ zero
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element, element ∈ subset -> successor element ∈ subset) ->
      (forall element : Element, element ∈ subset -> predecessor element ∈ subset) ->
      forall element : Element, element ∈ subset

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
`TwoSidedClosedSubset` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (is : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject) (subset : SetObject), (∀ (element : Element), element ∈ subset → is.successor element ∈ subset ∧ ∀ (element : Element), element ∈ subset → is.predecessor element ∈ subset)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (is : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject) (subset : SetObject), (∀ (element : Element), inst.1 subset element → inst.1 subset (is.4 element) ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (is.5 element))

Logical form (Lean):

```lean
def TwoSidedClosedSubset
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  (forall element : Element, element ∈ subset -> is.successor element ∈ subset) /\
  (forall element : Element, element ∈ subset -> is.predecessor element ∈ subset)
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
def TwoSidedClosedSubset
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  (forall element : Element, element ∈ subset -> is.successor element ∈ subset) /\
  (forall element : Element, element ∈ subset -> is.predecessor element ∈ subset)

/--
`InductiveSubsetOfIntegerStructure` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (is : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject) (subset : SetObject), (is.zero ∈ subset ∧ LRA.NumberSystems.IntegerStructure.TwoSidedClosedSubset is subset)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (is : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject) (subset : SetObject), (inst.1 subset is.1 ∧ (∀ (element : Element), inst.1 subset element → inst.1 subset (is.4 element) ∧ ∀ (element : Element), inst.1 subset element → inst.1 subset (is.5 element)))

Logical form (Lean):

```lean
def InductiveSubsetOfIntegerStructure
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  is.zero ∈ subset /\ TwoSidedClosedSubset is subset
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
def InductiveSubsetOfIntegerStructure
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  is.zero ∈ subset /\ TwoSidedClosedSubset is subset

/--
`FullTwoSidedPredicateInduction` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (is : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject) (predicate : Set Element), (predicate is.zero ∧ (∀ (element : Element), predicate element → predicate (is.successor element) ∧ ∀ (element : Element), predicate element → predicate (is.predecessor element))) → ∀ (element : Element), predicate element

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (is : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject) (predicate : Element → Prop), (predicate is.1 ∧ (∀ (element : Element), predicate element → predicate (is.4 element) ∧ ∀ (element : Element), predicate element → predicate (is.5 element))) → ∀ (element : Element), predicate element

Logical form (Lean):

```lean
def FullTwoSidedPredicateInduction
    (is : IntegerStructure Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate is.zero ->
    (forall element : Element,
      predicate element ->
      predicate (is.successor element)) ->
    (forall element : Element,
      predicate element ->
      predicate (is.predecessor element)) ->
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
def FullTwoSidedPredicateInduction
    (is : IntegerStructure Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate is.zero ->
    (forall element : Element,
      predicate element ->
      predicate (is.successor element)) ->
    (forall element : Element,
      predicate element ->
      predicate (is.predecessor element)) ->
    forall element : Element,
      predicate element

/--
`FullTwoSidedPredicateInductionOfComprehensionAdequacy` TODO

Predicate logic:

  FullTwoSidedPredicateInduction is

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (is : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject) (a : LRA.NumberSystems.IntegerStructure.PredicateSetComprehensionAdequacy Element SetObject) (predicate : Element → Prop), (predicate is.1 ∧ (∀ (element : Element), predicate element → predicate (is.4 element) ∧ ∀ (element : Element), predicate element → predicate (is.5 element))) → ∀ (element : Element), predicate element

Logical form (Lean):

```lean
theorem FullTwoSidedPredicateInductionOfComprehensionAdequacy
    (is : IntegerStructure Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullTwoSidedPredicateInduction is
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
theorem FullTwoSidedPredicateInductionOfComprehensionAdequacy
    (is : IntegerStructure Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullTwoSidedPredicateInduction is := by

  sorry

end

end LRA.NumberSystems.IntegerStructure
