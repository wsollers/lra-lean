import LRA.Order.OrderedSets.WellOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Set.Interface.Laws.Membership

namespace LRA.Order

universe u v

/--
`WellOrderingPrinciple` TODO

Predicate logic:

  (∀ A ∈ U), (exists element : Element, element ∈ A) → exists leastElement, LeastElement(leastElement, A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {nonStrictRelation : Element → Element → Prop}, (((∀ (x : Element), nonStrictRelation x x ∧ (∀ (x y : Element), nonStrictRelation x y → nonStrictRelation y x → x = y ∧ ∀ (x y z : Element), nonStrictRelation x y → nonStrictRelation y z → nonStrictRelation x z)) ∧ ∀ (x y : Element), Or (nonStrictRelation x y) (nonStrictRelation y x)) ∧ ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun least => (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → nonStrictRelation least element)) → ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun leastElement => (inst.1 subset leastElement ∧ ∀ (element : Element), inst.1 subset element → nonStrictRelation leastElement element)

Logical form (Lean):

```lean
theorem WellOrderingPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.Relation.Endorelation Element}
    (nonStrictRelationIsWellOrder : WellOrder SetObject nonStrictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists leastElement, LeastElement nonStrictRelation subset leastElement
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
theorem WellOrderingPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.Relation.Endorelation Element}
    (nonStrictRelationIsWellOrder : WellOrder SetObject nonStrictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists leastElement, LeastElement nonStrictRelation subset leastElement := by
  sorry
/--
`WellOrderHasImmediateSuccessor` TODO

Predicate logic:

  (∀ x ∈ Element), exists successor, StrictPart relation x successor ∧ forall candidate, StrictPart relation x candidate -> relation successor candidate

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasComplement SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.UniversalMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop}, (((∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ ∀ (x y : Element), Or (relation x y) (relation y x)) ∧ ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun least => (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → relation least element)) → ∀ (element : Element), (Exists fun candidate => (relation element candidate ∧ element = candidate → False)) → Exists fun successor => ((relation element successor ∧ element = successor → False) ∧ ∀ (candidate : Element), (relation element candidate ∧ element = candidate → False) → relation successor candidate)

Logical form (Lean):

```lean
theorem WellOrderHasImmediateSuccessor
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsWellOrder : WellOrder SetObject relation)
    (element : Element)
    (elementHasStrictSuccessor :
      exists candidate, StrictPart relation element candidate) :
    exists successor,
      StrictPart relation element successor /\
        forall candidate,
          StrictPart relation element candidate ->
            relation successor candidate
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
theorem WellOrderHasImmediateSuccessor
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsWellOrder : WellOrder SetObject relation)
    (element : Element)
    (elementHasStrictSuccessor :
      exists candidate, StrictPart relation element candidate) :
    exists successor,
      StrictPart relation element successor /\
        forall candidate,
          StrictPart relation element candidate ->
            relation successor candidate := by
  sorry
end LRA.Order
