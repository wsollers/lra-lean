import LRA.Relation.Interface.Laws.WellFounded.Definition

namespace LRA.Relation

universe u v

/--
`MinimalElementPrinciple` TODO

Predicate logic:

  (∀ A ∈ U), (∃ element ∈ Element, element ∈ A) → ∃ minimalElement, MinimalElement strictRelation A minimalElement

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {strictRelation : Element → Element → Prop}, (∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun minimum => (inst.1 subset minimum ∧ ∀ (element : Element), inst.1 subset element → strictRelation element minimum → False)) → ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun minimalElement => (inst.1 subset minimalElement ∧ ∀ (element : Element), inst.1 subset element → strictRelation element minimalElement → False)

Logical form (Lean):

```lean
theorem MinimalElementPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {strictRelation : Endorelation Element}
    (strictRelationIsWellFounded : WellFounded SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : ∃ element : Element, element ∈ subset) :
    ∃ minimalElement,
      MinimalElement strictRelation subset minimalElement
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem MinimalElementPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {strictRelation : Endorelation Element}
    (strictRelationIsWellFounded : WellFounded SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : ∃ element : Element, element ∈ subset) :
    ∃ minimalElement,
      MinimalElement strictRelation subset minimalElement := by
  sorry

end LRA.Relation
