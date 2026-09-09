import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Relation.Interface.Laws.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Relation.Dominated.Definition
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Indexed

namespace LRA.Order

universe u v

/--
`SupremumUnique` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Antisymmetric relation → ∀ {subset : SetObject} {first second : Element}, (LRA.Order.Supremum relation subset first ∧ LRA.Order.Supremum relation subset second) → first = second

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsAntisymmetric : LRA.Relation.Antisymmetric relation
    subset : SetObject
    first second : Element
    firstIsSupremum : Supremum relation subset first
    secondIsSupremum : Supremum relation subset second
  Prove
    (∀ (x y : Element), relation x y → relation y x → x = y) → ∀ {subset : SetObject} {first second : Element}, (((∀ (element : Element), inst.1 subset element → relation element first) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation first bound)) ∧ ((∀ (element : Element), inst.1 subset element → relation element second) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation second bound))) → first = second

Logical form (Lean):

```lean
theorem SupremumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsSupremum : Supremum relation subset first)
    (secondIsSupremum : Supremum relation subset second) :
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
theorem SupremumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsSupremum : Supremum relation subset first)
    (secondIsSupremum : Supremum relation subset second) :
    first = second := by
  sorry
/--
`SupremumOfSingleton` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Singleton Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Reflexive relation → ∀ (element : Element), (∀ (candidate : Element), candidate ∈ inst_1.singleton element ↔ candidate = element) → LRA.Order.Supremum relation (inst_1.singleton element) element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsReflexive : LRA.Relation.Reflexive relation
    element : Element
  Prove
    LRA.Relation.Reflexive relation → ∀ (element : Element), (∀ (candidate : Element), candidate ∈ inst_1.singleton element ↔ candidate = element) → LRA.Order.Supremum relation (inst_1.singleton element) element

Logical form (Lean):

```lean
theorem SupremumOfSingleton
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [Singleton Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Element)
    (singletonMembership :
      forall candidate,
        candidate ∈ ({element} : SetObject) ↔ candidate = element) :
    Supremum relation ({element} : SetObject) element
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
theorem SupremumOfSingleton
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [Singleton Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Element)
    (singletonMembership :
      forall candidate,
        candidate ∈ ({element} : SetObject) ↔ candidate = element) :
    Supremum relation ({element} : SetObject) element := by
  sorry
/--
`SupremumIsUpperBound` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {subset : SetObject} {supremum : Element}, LRA.Order.Supremum relation subset supremum → LRA.Order.UpperBound relation subset supremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    supremum : Element
    supremumIsSupremum : Supremum relation subset supremum
  Prove
    ((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)) → ∀ (element : Element), inst.1 subset element → relation element supremum

Logical form (Lean):

```lean
theorem SupremumIsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset supremum
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
theorem SupremumIsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset supremum := by
  sorry
/--
`SupremumRelatedToEveryUpperBound` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {subset : SetObject} {supremum bound : Element}, (LRA.Order.Supremum relation subset supremum ∧ LRA.Order.UpperBound relation subset bound) → relation supremum bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    supremum bound : Element
    supremumIsSupremum : Supremum relation subset supremum
    boundIsUpperBound : UpperBound relation subset bound
  Prove
    (((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)) ∧ (∀ (element : Element), inst.1 subset element → relation element bound)) → relation supremum bound

Logical form (Lean):

```lean
theorem SupremumRelatedToEveryUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (boundIsUpperBound : UpperBound relation subset bound) :
    relation supremum bound
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
theorem SupremumRelatedToEveryUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (boundIsUpperBound : UpperBound relation subset bound) :
    relation supremum bound := by
  sorry
/--
`UpperBoundIffSupremumRelated` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Transitive relation → ∀ {subset : SetObject} {supremum bound : Element}, LRA.Order.Supremum relation subset supremum → LRA.Order.UpperBound relation subset bound ↔ relation supremum bound

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsTransitive : LRA.Relation.Transitive relation
    subset : SetObject
    supremum bound : Element
    supremumIsSupremum : Supremum relation subset supremum
  Prove
    LRA.Relation.Transitive relation → ∀ {subset : SetObject} {supremum bound : Element}, LRA.Order.Supremum relation subset supremum → LRA.Order.UpperBound relation subset bound ↔ relation supremum bound

Logical form (Lean):

```lean
theorem UpperBoundIffSupremumRelated
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset bound ↔ relation supremum bound
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
theorem UpperBoundIffSupremumRelated
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset bound ↔ relation supremum bound := by
  sorry
/--
`SupremumMonotoneUnderInclusion` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {smaller larger : SetObject} {smallerSupremum largerSupremum : Element}, ((∀ (element : Element), element ∈ smaller → element ∈ larger) ∧ (LRA.Order.Supremum relation smaller smallerSupremum ∧ LRA.Order.Supremum relation larger largerSupremum)) → relation smallerSupremum largerSupremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    smaller larger : SetObject
    smallerSupremum largerSupremum : Element
    smallerSupremumIsSupremum : Supremum relation smaller smallerSupremum
    largerSupremumIsSupremum : Supremum relation larger largerSupremum
  Prove
    ((∀ (element : Element), inst.1 smaller element → inst.1 larger element) ∧ (((∀ (element : Element), inst.1 smaller element → relation element smallerSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 smaller element → relation element bound) → relation smallerSupremum bound)) ∧ ((∀ (element : Element), inst.1 larger element → relation element largerSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 larger element → relation element bound) → relation largerSupremum bound)))) → relation smallerSupremum largerSupremum

Logical form (Lean):

```lean
theorem SupremumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerSupremum largerSupremum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerSupremumIsSupremum :
      Supremum relation smaller smallerSupremum)
    (largerSupremumIsSupremum :
      Supremum relation larger largerSupremum) :
    relation smallerSupremum largerSupremum
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
theorem SupremumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerSupremum largerSupremum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerSupremumIsSupremum :
      Supremum relation smaller smallerSupremum)
    (largerSupremumIsSupremum :
      Supremum relation larger largerSupremum) :
    relation smallerSupremum largerSupremum := by
  sorry
/--
`SupremaCompareUnderPointwiseDomination` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Transitive relation → ∀ {leftSubset rightSubset : SetObject} {leftSupremum rightSupremum : Element}, (LRA.Order.Dominated relation leftSubset rightSubset ∧ (LRA.Order.Supremum relation leftSubset leftSupremum ∧ LRA.Order.Supremum relation rightSubset rightSupremum)) → relation leftSupremum rightSupremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsTransitive : LRA.Relation.Transitive relation
    leftSubset rightSubset : SetObject
    leftSupremum rightSupremum : Element
    leftDominatedByRight : Dominated relation leftSubset rightSubset
    leftSupremumIsSupremum : Supremum relation leftSubset leftSupremum
    rightSupremumIsSupremum : Supremum relation rightSubset rightSupremum
  Prove
    (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ {leftSubset rightSubset : SetObject} {leftSupremum rightSupremum : Element}, ((∀ (element : Element), inst.1 leftSubset element → Exists fun other => (inst.1 rightSubset other ∧ relation element other)) ∧ (((∀ (element : Element), inst.1 leftSubset element → relation element leftSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 leftSubset element → relation element bound) → relation leftSupremum bound)) ∧ ((∀ (element : Element), inst.1 rightSubset element → relation element rightSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 rightSubset element → relation element bound) → relation rightSupremum bound)))) → relation leftSupremum rightSupremum

Logical form (Lean):

```lean
theorem SupremaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum : Element}
    (leftDominatedByRight : Dominated relation leftSubset rightSubset)
    (leftSupremumIsSupremum :
      Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum :
      Supremum relation rightSubset rightSupremum) :
    relation leftSupremum rightSupremum
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
theorem SupremaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum : Element}
    (leftDominatedByRight : Dominated relation leftSubset rightSubset)
    (leftSupremumIsSupremum :
      Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum :
      Supremum relation rightSubset rightSupremum) :
    relation leftSupremum rightSupremum := by
  sorry
/--
`SupremumInSubsetIsGreatestElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {subset : SetObject} {supremum : Element}, (LRA.Order.Supremum relation subset supremum ∧ supremum ∈ subset) → LRA.Order.GreatestElement relation subset supremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    supremum : Element
    supremumIsSupremum : Supremum relation subset supremum
  Prove
    (((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound)) ∧ inst.1 subset supremum) → (inst.1 subset supremum ∧ (∀ (element : Element), inst.1 subset element → relation element supremum))

Logical form (Lean):

```lean
theorem SupremumInSubsetIsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (supremumBelongs : supremum ∈ subset) :
    GreatestElement relation subset supremum
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
theorem SupremumInSubsetIsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (supremumBelongs : supremum ∈ subset) :
    GreatestElement relation subset supremum := by
  sorry
open scoped LRA.Set

/--
`SupremumOfUnion` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Transitive relation → ∀ {leftSubset rightSubset : SetObject} {leftSupremum rightSupremum unionSupremum : Element}, (LRA.Order.Supremum relation leftSubset leftSupremum ∧ (LRA.Order.Supremum relation rightSubset rightSupremum ∧ LRA.Order.Join relation leftSupremum rightSupremum unionSupremum)) → LRA.Order.Supremum relation (leftSubset ∪ rightSubset)unionSupremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsTransitive : LRA.Relation.Transitive relation
    leftSubset rightSubset : SetObject
    leftSupremum rightSupremum unionSupremum : Element
    leftSupremumIsSupremum : Supremum relation leftSubset leftSupremum
    rightSupremumIsSupremum : Supremum relation rightSubset rightSupremum
    unionSupremumIsJoin : Join relation leftSupremum rightSupremum unionSupremum
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ {leftSubset rightSubset : SetObject} {leftSupremum rightSupremum unionSupremum : Element}, (((∀ (element : Element), inst.1 leftSubset element → relation element leftSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 leftSubset element → relation element bound) → relation leftSupremum bound)) ∧ (((∀ (element : Element), inst.1 rightSubset element → relation element rightSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 rightSubset element → relation element bound) → relation rightSupremum bound)) ∧ (relation leftSupremum unionSupremum ∧ (relation rightSupremum unionSupremum ∧ (∀ (upper : Element), relation leftSupremum upper → relation rightSupremum upper → relation unionSupremum upper))))) → ((∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element unionSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound) → relation unionSupremum bound))

Logical form (Lean):

```lean
theorem SupremumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum unionSupremum : Element}
    (leftSupremumIsSupremum : Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum : Supremum relation rightSubset rightSupremum)
    (unionSupremumIsJoin : Join relation leftSupremum rightSupremum unionSupremum) :
    Supremum relation (leftSubset ∪ rightSubset) unionSupremum
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
theorem SupremumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum unionSupremum : Element}
    (leftSupremumIsSupremum : Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum : Supremum relation rightSubset rightSupremum)
    (unionSupremumIsJoin : Join relation leftSupremum rightSupremum unionSupremum) :
    Supremum relation (leftSubset ∪ rightSubset) unionSupremum := by
  sorry
/--
`SupremumOfIntersectionRelatedToContainingSupremum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {containingSubset otherSubset : SetObject} {intersectionSupremum containingSupremum : Element}, (LRA.Order.Supremum relation (containingSubset ∩ otherSubset)intersectionSupremum ∧ LRA.Order.Supremum relation containingSubset containingSupremum) → relation intersectionSupremum containingSupremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    containingSubset otherSubset : SetObject
    intersectionSupremum containingSupremum : Element
    intersectionIsSupremum : Supremum relation (containingSubset ∩ otherSubset) intersectionSupremum
    containingIsSupremum : Supremum relation containingSubset containingSupremum
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {containingSubset otherSubset : SetObject} {intersectionSupremum containingSupremum : Element}, (((∀ (element : Element), inst.1 (inst_2.1 containingSubset otherSubset) element → relation element intersectionSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_2.1 containingSubset otherSubset) element → relation element bound) → relation intersectionSupremum bound)) ∧ ((∀ (element : Element), inst.1 containingSubset element → relation element containingSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 containingSubset element → relation element bound) → relation containingSupremum bound))) → relation intersectionSupremum containingSupremum

Logical form (Lean):

```lean
theorem SupremumOfIntersectionRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionSupremum containingSupremum : Element}
    (intersectionIsSupremum : Supremum relation (containingSubset ∩ otherSubset) intersectionSupremum)
    (containingIsSupremum : Supremum relation containingSubset containingSupremum) :
    relation intersectionSupremum containingSupremum
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
theorem SupremumOfIntersectionRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionSupremum containingSupremum : Element}
    (intersectionIsSupremum : Supremum relation (containingSubset ∩ otherSubset) intersectionSupremum)
    (containingIsSupremum : Supremum relation containingSubset containingSupremum) :
    relation intersectionSupremum containingSupremum := by
  sorry
/--
`SupremumOfDifferenceRelatedToContainingSupremum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : Union SetObject] [inst_2 : Inter SetObject] [inst_3 : SDiff SetObject] [inst_4 : EmptyCollection SetObject] [inst_5 : HasSubset SetObject], LRA.Set.MembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element} {subset removed : SetObject} {differenceSupremum subsetSupremum : Element}, (LRA.Order.Supremum relation (subset \ removed)differenceSupremum ∧ LRA.Order.Supremum relation subset subsetSupremum) → relation differenceSupremum subsetSupremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset removed : SetObject
    differenceSupremum subsetSupremum : Element
    differenceIsSupremum : Supremum relation (subset \ removed) differenceSupremum
    subsetIsSupremum : Supremum relation subset subsetSupremum
  Prove
    LRA.Set.MembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop} {subset removed : SetObject} {differenceSupremum subsetSupremum : Element}, (((∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation element differenceSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_3.1 subset removed) element → relation element bound) → relation differenceSupremum bound)) ∧ ((∀ (element : Element), inst.1 subset element → relation element subsetSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation subsetSupremum bound))) → relation differenceSupremum subsetSupremum

Logical form (Lean):

```lean
theorem SupremumOfDifferenceRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceSupremum subsetSupremum : Element}
    (differenceIsSupremum : Supremum relation (subset \ removed) differenceSupremum)
    (subsetIsSupremum : Supremum relation subset subsetSupremum) :
    relation differenceSupremum subsetSupremum
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
theorem SupremumOfDifferenceRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceSupremum subsetSupremum : Element}
    (differenceIsSupremum : Supremum relation (subset \ removed) differenceSupremum)
    (subsetIsSupremum : Supremum relation subset subsetSupremum) :
    relation differenceSupremum subsetSupremum := by
  sorry
/--
`SupremumOfSymmetricDifferenceRelatedToUnionSupremum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSymmDiff SetObject] [inst_2 : Union SetObject] [inst_3 : Inter SetObject] [inst_4 : SDiff SetObject] [inst_5 : EmptyCollection SetObject] [inst_6 : HasSubset SetObject], (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : LRA.Relation.Endorelation Element} {leftSubset rightSubset : SetObject} {differenceSupremum unionSupremum : Element}, (LRA.Order.Supremum relation (inst_1.symmDiff leftSubset rightSubset) differenceSupremum ∧ LRA.Order.Supremum relation (leftSubset ∪ rightSubset)unionSupremum) → relation differenceSupremum unionSupremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    leftSubset rightSubset : SetObject
    differenceSupremum unionSupremum : Element
    differenceIsSupremum : Supremum relation (leftSubset ∆ rightSubset) differenceSupremum
    unionIsSupremum : Supremum relation (leftSubset ∪ rightSubset) unionSupremum
  Prove
    (LRA.Set.MembershipLaws Element SetObject ∧ LRA.Set.SymmDiffMembershipLaws Element SetObject) → ∀ {relation : Element → Element → Prop} {leftSubset rightSubset : SetObject} {differenceSupremum unionSupremum : Element}, (((∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element differenceSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 leftSubset rightSubset) element → relation element bound) → relation differenceSupremum bound)) ∧ ((∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation element unionSupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_2.1 leftSubset rightSubset) element → relation element bound) → relation unionSupremum bound))) → relation differenceSupremum unionSupremum

Logical form (Lean):

```lean
theorem SupremumOfSymmetricDifferenceRelatedToUnionSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceSupremum unionSupremum : Element}
    (differenceIsSupremum : Supremum relation (leftSubset ∆ rightSubset) differenceSupremum)
    (unionIsSupremum : Supremum relation (leftSubset ∪ rightSubset) unionSupremum) :
    relation differenceSupremum unionSupremum
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
theorem SupremumOfSymmetricDifferenceRelatedToUnionSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceSupremum unionSupremum : Element}
    (differenceIsSupremum : Supremum relation (leftSubset ∆ rightSubset) differenceSupremum)
    (unionIsSupremum : Supremum relation (leftSubset ∪ rightSubset) unionSupremum) :
    relation differenceSupremum unionSupremum := by
  sorry
/--
`SupremumOfIndexedUnion` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedUnion SetObject] [inst_2 : LRA.Set.HasIndexedIntersection SetObject], LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : LRA.Relation.Endorelation Element}, LRA.Relation.Transitive relation → ∀ (family : Index → SetObject) (memberSupremum : Index → Element) (familySupremum : Element), ((∀ (index : Index), LRA.Order.Supremum relation (family index) (memberSupremum index)) ∧ ((∀ (index : Index), relation (memberSupremum index) familySupremum) ∧ (∀ (bound : Element), (∀ (index : Index), relation (memberSupremum index) bound) → relation familySupremum bound))) → LRA.Order.Supremum relation (inst_1.indexedUnion family) familySupremum

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, Index, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsTransitive : LRA.Relation.Transitive relation
    family : Index -> SetObject
    memberSupremum : Index -> Element
    familySupremum : Element
    eachIsSupremum : forall index, Supremum relation (family index) (memberSupremum index)
    familySupremumBoundsMembers : forall index, relation (memberSupremum index) familySupremum
    familySupremumIsLeast : forall bound, (forall index, relation (memberSupremum index) bound) -> relation familySupremum bound
  Prove
    LRA.Set.IndexedMembershipLaws Element SetObject → ∀ {relation : Element → Element → Prop}, (∀ (x y z : Element), relation x y → relation y z → relation x z) → ∀ (family : Index → SetObject) (memberSupremum : Index → Element) (familySupremum : Element), ((∀ (index : Index), ((∀ (element : Element), inst.1 (family index) element → relation element (memberSupremum index)) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (family index) element → relation element bound) → relation (memberSupremum index) bound))) ∧ ((∀ (index : Index), relation (memberSupremum index) familySupremum) ∧ (∀ (bound : Element), (∀ (index : Index), relation (memberSupremum index) bound) → relation familySupremum bound))) → ((∀ (element : Element), inst.1 (inst_1.1 family) element → relation element familySupremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 family) element → relation element bound) → relation familySupremum bound))

Logical form (Lean):

```lean
theorem SupremumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberSupremum : Index -> Element)
    (familySupremum : Element)
    (eachIsSupremum : forall index, Supremum relation (family index) (memberSupremum index))
    (familySupremumBoundsMembers : forall index, relation (memberSupremum index) familySupremum)
    (familySupremumIsLeast : forall bound,
      (forall index, relation (memberSupremum index) bound) -> relation familySupremum bound) :
    Supremum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familySupremum
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
theorem SupremumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberSupremum : Index -> Element)
    (familySupremum : Element)
    (eachIsSupremum : forall index, Supremum relation (family index) (memberSupremum index))
    (familySupremumBoundsMembers : forall index, relation (memberSupremum index) familySupremum)
    (familySupremumIsLeast : forall bound,
      (forall index, relation (memberSupremum index) bound) -> relation familySupremum bound) :
    Supremum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familySupremum := by
  sorry
end LRA.Order
