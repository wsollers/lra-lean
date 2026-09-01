import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`UniquenessOfPeanoSystemsUpToIsomorphism` TODO

Predicate logic:

  FullPredicateInduction second -> exists forward : Element -> SecondElement, exists backward : SecondElement -> Element, forward first.base = second.base ∧ backward second.base = first.base ∧ forall element ∈ Element, forward (first.successor element = second.successor (forward element)) ∧ forall element ∈ SecondElement, backward (second.successor element = first.successor (backward element)) ∧ forall element ∈ Element, backward (forward element = element) ∧ forall element ∈ SecondElement, forward (backward element = element)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {SecondElement : Type u} {SecondSetObject : Type v} [inst_1 : Membership SecondElement SecondSetObject] (first : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), (∀ (predicate : Element → Prop), predicate first.1 → (∀ (element : Element), predicate element → predicate (first.2 element)) → ∀ (element : Element), predicate element) → ∀ (second : LRA.NumberSystems.PeanoSystem.PeanoSystem SecondElement SecondSetObject), (∀ (predicate : SecondElement → Prop), predicate second.1 → (∀ (element : SecondElement), predicate element → predicate (second.2 element)) → ∀ (element : SecondElement), predicate element) → Exists fun forward => Exists fun backward => (forward first.1 = second.1 ∧ (backward second.1 = first.1 ∧ (∀ (element : Element), forward (first.2 element) = second.2 (forward element) ∧ (∀ (element : SecondElement), backward (second.2 element) = first.2 (backward element) ∧ (∀ (element : Element), backward (forward element) = element ∧ ∀ (element : SecondElement), forward (backward element) = element)))))

Logical form (Lean):

```lean
theorem UniquenessOfPeanoSystemsUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : PeanoSystem Element SetObject)
    (firstFullInduction : FullPredicateInduction first)
    (second : PeanoSystem SecondElement SecondSetObject) :
    FullPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.base = second.base /\
        backward second.base = first.base /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
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
theorem UniquenessOfPeanoSystemsUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : PeanoSystem Element SetObject)
    (firstFullInduction : FullPredicateInduction first)
    (second : PeanoSystem SecondElement SecondSetObject) :
    FullPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.base = second.base /\
        backward second.base = first.base /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element) := by

  sorry

end LRA.NumberSystems.PeanoSystem
