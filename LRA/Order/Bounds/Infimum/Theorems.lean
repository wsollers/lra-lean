import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Relation.Interface.Laws.Definition
import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Order.Lattices.Meet.Definition
import LRA.Order.Relation.Dominated.Definition
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Indexed

namespace LRA.Order

universe u v

/--
`InfimumUnique` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), x = y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {first second : Element}, ((∀ (element : Element), inst.1 subset element → relation first element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound first) ∧ (∀ (element : Element), inst.1 subset element → relation second element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound second)) → first = second

Logical form (Lean):

```lean
theorem InfimumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsInfimum : Infimum relation subset first)
    (secondIsInfimum : Infimum relation subset second) :
    first = second
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
theorem InfimumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsInfimum : Infimum relation subset first)
    (secondIsInfimum : Infimum relation subset second) :
    first = second := by
  sorry

/--
`InfimumOfSingleton` TODO

Predicate logic:

  (∀ x ∈ Element), (forall candidate, candidate ∈ {x} ∈ SetObject ↔ candidate = x) → Infimum relation {x} ∈ SetObject x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Singleton Element SetObject] {relation : Element → Element → Prop}, (∀ (x : Element), relation x x) → ∀ (element : Element), (∀ (candidate : Element), inst.1 (inst_1.1 element) candidate ↔ candidate = element) → (∀ (element_1 : Element), inst.1 (inst_1.1 element) element_1 → relation element element_1 ∧ ∀ (bound : Element), (∀ (element_1 : Element), inst.1 (inst_1.1 element) element_1 → relation bound element_1) → relation bound element)

Logical form (Lean):

```lean
theorem InfimumOfSingleton
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [Singleton Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Element)
    (singletonMembership :
      forall candidate,
        candidate ∈ ({element} : SetObject) ↔ candidate = element) :
    Infimum relation ({element} : SetObject) element
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
theorem InfimumOfSingleton
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [Singleton Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Element)
    (singletonMembership :
      forall candidate,
        candidate ∈ ({element} : SetObject) ↔ candidate = element) :
    Infimum relation ({element} : SetObject) element := by
  sorry

/--
`InfimumIsLowerBound` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), LowerBound relation A x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {subset : SetObject} {infimum : Element}, (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum) → ∀ (element : Element), inst.1 subset element → relation infimum element

Logical form (Lean):

```lean
theorem InfimumIsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset infimum
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
theorem InfimumIsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset infimum := by
  sorry

/--
`EveryLowerBoundRelatedToInfimum` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {subset : SetObject} {infimum bound : Element}, ((∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum) ∧ ∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum

Logical form (Lean):

```lean
theorem EveryLowerBoundRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (boundIsLowerBound : LowerBound relation subset bound) :
    relation bound infimum
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
theorem EveryLowerBoundRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (boundIsLowerBound : LowerBound relation subset bound) :
    relation bound infimum := by
  sorry

/--
`LowerBoundIffRelatedToInfimum` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), LowerBound relation A y ↔ relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ {subset : SetObject} {infimum bound : Element}, (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum) → ∀ (element : Element), inst.1 subset element → relation bound element ↔ relation bound infimum

Logical form (Lean):

```lean
theorem LowerBoundIffRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset bound ↔ relation bound infimum
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem LowerBoundIffRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset bound ↔ relation bound infimum := by
  sorry

/--
`InfimumMonotoneUnderInclusion` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x y ∈ Element), (forall element, element ∈ A -> element ∈ B) → relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {smaller larger : SetObject} {smallerInfimum largerInfimum : Element}, (∀ (element : Element), inst.1 smaller element → inst.1 larger element ∧ ((∀ (element : Element), inst.1 smaller element → relation smallerInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 smaller element → relation bound element) → relation bound smallerInfimum) ∧ (∀ (element : Element), inst.1 larger element → relation largerInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 larger element → relation bound element) → relation bound largerInfimum))) → relation largerInfimum smallerInfimum

Logical form (Lean):

```lean
theorem InfimumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerInfimum largerInfimum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerInfimumIsInfimum : Infimum relation smaller smallerInfimum)
    (largerInfimumIsInfimum : Infimum relation larger largerInfimum) :
    relation largerInfimum smallerInfimum
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
theorem InfimumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerInfimum largerInfimum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerInfimumIsInfimum : Infimum relation smaller smallerInfimum)
    (largerInfimumIsInfimum : Infimum relation larger largerInfimum) :
    relation largerInfimum smallerInfimum := by
  sorry

/--
`InfimaCompareUnderPointwiseDomination` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x y ∈ Element), relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ {leftSubset rightSubset : SetObject} {leftInfimum rightInfimum : Element}, (∀ (element : Element), inst.1 leftSubset element → Exists fun other => (inst.1 rightSubset other ∧ relation other element) ∧ ((∀ (element : Element), inst.1 leftSubset element → relation leftInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 leftSubset element → relation bound element) → relation bound leftInfimum) ∧ (∀ (element : Element), inst.1 rightSubset element → relation rightInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 rightSubset element → relation bound element) → relation bound rightInfimum))) → relation rightInfimum leftInfimum

Logical form (Lean):

```lean
theorem InfimaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum : Element}
    (leftDominatedByRightUnderConverse :
      Dominated (LRA.Relation.Converse relation) leftSubset rightSubset)
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum) :
    relation rightInfimum leftInfimum
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
theorem InfimaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum : Element}
    (leftDominatedByRightUnderConverse :
      Dominated (LRA.Relation.Converse relation) leftSubset rightSubset)
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum) :
    relation rightInfimum leftInfimum := by
  sorry

/--
`InfimumInSubsetIsLeastElement` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), (x ∈ A) → LeastElement(x, A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop} {subset : SetObject} {infimum : Element}, ((∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum) ∧ inst.1 subset infimum) → (inst.1 subset infimum ∧ ∀ (element : Element), inst.1 subset element → relation infimum element)

Logical form (Lean):

```lean
theorem InfimumInSubsetIsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (infimumBelongs : infimum ∈ subset) :
    LeastElement relation subset infimum
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
theorem InfimumInSubsetIsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (infimumBelongs : infimum ∈ subset) :
    LeastElement relation subset infimum := by
  sorry

open scoped LRA.Set

/--
`InfimumOfUnion` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x y z ∈ Element), Infimum relation (A ∪ B) z

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ {leftSubset rightSubset : SetObject} {leftInfimum rightInfimum unionInfimum : Element}, ((∀ (element : Element), inst.1 leftSubset element → relation leftInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 leftSubset element → relation bound element) → relation bound leftInfimum) ∧ ((∀ (element : Element), inst.1 rightSubset element → relation rightInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 rightSubset element → relation bound element) → relation bound rightInfimum) ∧ (relation unionInfimum leftInfimum ∧ (relation unionInfimum rightInfimum ∧ ∀ (lower : Element), relation lower leftInfimum → relation lower rightInfimum → relation lower unionInfimum)))) → (∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation unionInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element) → relation bound unionInfimum)

Logical form (Lean):

```lean
theorem InfimumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum unionInfimum : Element}
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum)
    (unionInfimumIsMeet : Meet relation leftInfimum rightInfimum unionInfimum) :
    Infimum relation (leftSubset ∪ rightSubset) unionInfimum
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
theorem InfimumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum unionInfimum : Element}
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum)
    (unionInfimumIsMeet : Meet relation leftInfimum rightInfimum unionInfimum) :
    Infimum relation (leftSubset ∪ rightSubset) unionInfimum := by
  sorry

/--
`ContainingInfimumRelatedToInfimumOfIntersection` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x y ∈ Element), relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {containingSubset otherSubset : SetObject} {intersectionInfimum containingInfimum : Element}, ((∀ (element : Element), inst.1 (inst_2.1 containingSubset otherSubset) element → relation intersectionInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_2.1 containingSubset otherSubset) element → relation bound element) → relation bound intersectionInfimum) ∧ (∀ (element : Element), inst.1 containingSubset element → relation containingInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 containingSubset element → relation bound element) → relation bound containingInfimum)) → relation containingInfimum intersectionInfimum

Logical form (Lean):

```lean
theorem ContainingInfimumRelatedToInfimumOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionInfimum containingInfimum : Element}
    (intersectionIsInfimum : Infimum relation (containingSubset ∩ otherSubset) intersectionInfimum)
    (containingIsInfimum : Infimum relation containingSubset containingInfimum) :
    relation containingInfimum intersectionInfimum
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
theorem ContainingInfimumRelatedToInfimumOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionInfimum containingInfimum : Element}
    (intersectionIsInfimum : Infimum relation (containingSubset ∩ otherSubset) intersectionInfimum)
    (containingIsInfimum : Infimum relation containingSubset containingInfimum) :
    relation containingInfimum intersectionInfimum := by
  sorry

/--
`ContainingInfimumRelatedToInfimumOfDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x y ∈ Element), relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset removed : SetObject} {differenceInfimum subsetInfimum : Element}, ((∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation differenceInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation bound element) → relation bound differenceInfimum) ∧ (∀ (element : Element), inst.1 subset element → relation subsetInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound subsetInfimum)) → relation subsetInfimum differenceInfimum

Logical form (Lean):

```lean
theorem ContainingInfimumRelatedToInfimumOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceInfimum subsetInfimum : Element}
    (differenceIsInfimum : Infimum relation (subset \ removed) differenceInfimum)
    (subsetIsInfimum : Infimum relation subset subsetInfimum) :
    relation subsetInfimum differenceInfimum
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
theorem ContainingInfimumRelatedToInfimumOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceInfimum subsetInfimum : Element}
    (differenceIsInfimum : Infimum relation (subset \ removed) differenceInfimum)
    (subsetIsInfimum : Infimum relation subset subsetInfimum) :
    relation subsetInfimum differenceInfimum := by
  sorry

/--
`UnionInfimumRelatedToInfimumOfSymmetricDifference` TODO

Predicate logic:

  (∀ A B ∈ U ∀ x y ∈ Element), relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {differenceInfimum unionInfimum : Element}, ((∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation differenceInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation bound element) → relation bound differenceInfimum) ∧ (∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation unionInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation bound element) → relation bound unionInfimum)) → relation unionInfimum differenceInfimum

Logical form (Lean):

```lean
theorem UnionInfimumRelatedToInfimumOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceInfimum unionInfimum : Element}
    (differenceIsInfimum : Infimum relation (leftSubset ∆ rightSubset) differenceInfimum)
    (unionIsInfimum : Infimum relation (leftSubset ∪ rightSubset) unionInfimum) :
    relation unionInfimum differenceInfimum
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
theorem UnionInfimumRelatedToInfimumOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceInfimum unionInfimum : Element}
    (differenceIsInfimum : Infimum relation (leftSubset ∆ rightSubset) differenceInfimum)
    (unionIsInfimum : Infimum relation (leftSubset ∪ rightSubset) unionInfimum) :
    relation unionInfimum differenceInfimum := by
  sorry

/--
`InfimumOfIndexedUnion` TODO

Predicate logic:

  (∀ x ∈ Element), Infimum relation (LRA.Set.HasIndexedUnion.indexedUnion family) x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ (family : Index → SetObject) (memberInfimum : Index → Element) (familyInfimum : Element), (∀ (index : Index), (∀ (element : Element), inst.1 (family index) element → relation (memberInfimum index) element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (family index) element → relation bound element) → relation bound (memberInfimum index)) ∧ (∀ (index : Index), relation familyInfimum (memberInfimum index) ∧ ∀ (bound : Element), (∀ (index : Index), relation bound (memberInfimum index)) → relation bound familyInfimum)) → (∀ (element : Element), inst.1 (inst_1.1 family) element → relation familyInfimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 family) element → relation bound element) → relation bound familyInfimum)

Logical form (Lean):

```lean
theorem InfimumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberInfimum : Index -> Element)
    (familyInfimum : Element)
    (eachIsInfimum : forall index, Infimum relation (family index) (memberInfimum index))
    (familyInfimumBoundsMembers : forall index, relation familyInfimum (memberInfimum index))
    (familyInfimumIsGreatest : forall bound,
      (forall index, relation bound (memberInfimum index)) -> relation bound familyInfimum) :
    Infimum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familyInfimum
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
theorem InfimumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberInfimum : Index -> Element)
    (familyInfimum : Element)
    (eachIsInfimum : forall index, Infimum relation (family index) (memberInfimum index))
    (familyInfimumBoundsMembers : forall index, relation familyInfimum (memberInfimum index))
    (familyInfimumIsGreatest : forall bound,
      (forall index, relation bound (memberInfimum index)) -> relation bound familyInfimum) :
    Infimum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familyInfimum := by
  sorry

end LRA.Order
