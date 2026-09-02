
import LRA.NumberSystems.IntegerStructure.Definition

namespace LRA.NumberSystems.IntegerStructure

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`UniquenessOfIntegerStructuresUpToIsomorphism` TODO

Predicate logic:

  FullTwoSidedPredicateInduction second -> exists forward : Element -> SecondElement, exists backward : SecondElement -> Element, forward first.zero = second.zero ∧ backward second.zero = first.zero ∧ forall element ∈ Element, forward (first.successor element = second.successor (forward element)) ∧ forall element ∈ Element, forward (first.predecessor element = second.predecessor (forward element)) ∧ forall element ∈ SecondElement, backward (second.successor element = first.successor (backward element)) ∧ forall element ∈ SecondElement, backward (second.predecessor element = first.predecessor (backward element)) ∧ forall element ∈ Element, backward (forward element = element) ∧ forall element ∈ SecondElement, forward (backward element = element)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {SecondElement : Type u} {SecondSetObject : Type v} [inst_1 : Membership SecondElement SecondSetObject] (first : LRA.NumberSystems.IntegerStructure.IntegerStructure Element SetObject), (∀ (predicate : Element → Prop), predicate first.1 → (∀ (element : Element), predicate element → predicate (first.4 element)) → (∀ (element : Element), predicate element → predicate (first.5 element)) → ∀ (element : Element), predicate element) → ∀ (second : LRA.NumberSystems.IntegerStructure.IntegerStructure SecondElement SecondSetObject), (∀ (predicate : SecondElement → Prop), predicate second.1 → (∀ (element : SecondElement), predicate element → predicate (second.4 element)) → (∀ (element : SecondElement), predicate element → predicate (second.5 element)) → ∀ (element : SecondElement), predicate element) → Exists fun forward => Exists fun backward => (forward first.1 = second.1 ∧ (backward second.1 = first.1 ∧ (∀ (element : Element), forward (first.4 element) = second.4 (forward element) ∧ (∀ (element : Element), forward (first.5 element) = second.5 (forward element) ∧ (∀ (element : SecondElement), backward (second.4 element) = first.4 (backward element) ∧ (∀ (element : SecondElement), backward (second.5 element) = first.5 (backward element) ∧ (∀ (element : Element), backward (forward element) = element ∧ ∀ (element : SecondElement), forward (backward element) = element)))))))

Logical form (Lean):

```lean
theorem UniquenessOfIntegerStructuresUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : IntegerStructure Element SetObject)
    (firstFullInduction : FullTwoSidedPredicateInduction first)
    (second : IntegerStructure SecondElement SecondSetObject) :
    FullTwoSidedPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.zero = second.zero /\
        backward second.zero = first.zero /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : Element,
          forward (first.predecessor element) =
            second.predecessor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : SecondElement,
          backward (second.predecessor element) =
            first.predecessor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element)
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
theorem UniquenessOfIntegerStructuresUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : IntegerStructure Element SetObject)
    (firstFullInduction : FullTwoSidedPredicateInduction first)
    (second : IntegerStructure SecondElement SecondSetObject) :
    FullTwoSidedPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.zero = second.zero /\
        backward second.zero = first.zero /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : Element,
          forward (first.predecessor element) =
            second.predecessor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : SecondElement,
          backward (second.predecessor element) =
            first.predecessor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element) := by
  sorry
end LRA.NumberSystems.IntegerStructure
