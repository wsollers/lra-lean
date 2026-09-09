import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Constructions.ProductOrder.Definition
import LRA.Order.Directedness.Directed.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.Relation.StrictPart.Definition

namespace LRA.Order

universe u v w x y

/--
`MaximalElementOfDirectedSubsetIsGreatest` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element}, LRA.Order.PartialOrder relation → ∀ {subset : SetObject} {maximal : Element}, (LRA.Order.Directed relation subset ∧ LRA.Order.MaximalElement (LRA.Order.StrictPart relation) subset maximal) → LRA.Order.GreatestElement relation subset maximal

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsPartialOrder : PartialOrder relation
    subset : SetObject
    maximal : Element
    subsetIsDirected : Directed relation subset
    maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal
  Prove
    ((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) → ∀ {subset : SetObject} {maximal : Element}, ((Exists fun element => inst.1 subset element ∧ (∀ (first second : Element), inst.1 subset first → inst.1 subset second → Exists fun upper => (inst.1 subset upper ∧ (relation first upper ∧ relation second upper)))) ∧ (inst.1 subset maximal ∧ (∀ (element : Element), inst.1 subset element → (relation maximal element ∧ (maximal = element → False)) → False))) → (inst.1 subset maximal ∧ (∀ (element : Element), inst.1 subset element → relation element maximal))

Logical form (Lean):

```lean
theorem MaximalElementOfDirectedSubsetIsGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    {subset : SetObject} {maximal : Element}
    (subsetIsDirected : Directed relation subset)
    (maximalIsMaximal :
      MaximalElement (StrictPart relation) subset maximal) :
    GreatestElement relation subset maximal
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
theorem MaximalElementOfDirectedSubsetIsGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    {subset : SetObject} {maximal : Element}
    (subsetIsDirected : Directed relation subset)
    (maximalIsMaximal :
      MaximalElement (StrictPart relation) subset maximal) :
    GreatestElement relation subset maximal := by
  sorry
/--
`ProductOfDirectedSubsetsIsDirected` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} {LeftSet : Type w} {RightSet : Type x} {ProductSet : Type y} [inst : Membership Alpha LeftSet] [inst_1 : Membership Beta RightSet] [inst_2 : Membership (Prod Alpha Beta) ProductSet] {leftRelation : LRA.Relation.Endorelation Alpha} {rightRelation : LRA.Relation.Endorelation Beta} {leftSubset : LeftSet} {rightSubset : RightSet} {productSubset : ProductSet}, ((∀ (pair : Prod Alpha Beta), pair ∈ productSubset ↔ (pair.fst ∈ leftSubset ∧ pair.snd ∈ rightSubset)) ∧ (LRA.Order.Directed leftRelation leftSubset ∧ LRA.Order.Directed rightRelation rightSubset)) → LRA.Order.Directed (LRA.Order.ProductRelation leftRelation rightRelation) productSubset

Predicate logic (unfolded):

  Ambient
    (Alpha, Beta, LeftSet, RightSet, ProductSet, ∈)
  Objects
    leftRelation : LRA.Relation.Endorelation Alpha
    rightRelation : LRA.Relation.Endorelation Beta
    leftSubset : LeftSet
    rightSubset : RightSet
    productSubset : ProductSet
    leftIsDirected : Directed leftRelation leftSubset
    rightIsDirected : Directed rightRelation rightSubset
  Prove
    ((∀ (pair : Prod Alpha Beta), pair ∈ productSubset ↔ (pair.fst ∈ leftSubset ∧ pair.snd ∈ rightSubset)) ∧ (LRA.Order.Directed leftRelation leftSubset ∧ LRA.Order.Directed rightRelation rightSubset)) → LRA.Order.Directed (LRA.Order.ProductRelation leftRelation rightRelation) productSubset

Logical form (Lean):

```lean
theorem ProductOfDirectedSubsetsIsDirected
    {Alpha : Type u} {Beta : Type v}
    {LeftSet : Type w} {RightSet : Type x} {ProductSet : Type y}
    [Membership Alpha LeftSet] [Membership Beta RightSet]
    [Membership (Alpha × Beta) ProductSet]
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    {leftSubset : LeftSet} {rightSubset : RightSet}
    {productSubset : ProductSet}
    (productMembership :
      forall pair : Alpha × Beta,
        pair ∈ productSubset ↔
          pair.1 ∈ leftSubset /\ pair.2 ∈ rightSubset)
    (leftIsDirected : Directed leftRelation leftSubset)
    (rightIsDirected : Directed rightRelation rightSubset) :
    Directed (ProductRelation leftRelation rightRelation) productSubset
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem ProductOfDirectedSubsetsIsDirected
    {Alpha : Type u} {Beta : Type v}
    {LeftSet : Type w} {RightSet : Type x} {ProductSet : Type y}
    [Membership Alpha LeftSet] [Membership Beta RightSet]
    [Membership (Alpha × Beta) ProductSet]
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    {leftSubset : LeftSet} {rightSubset : RightSet}
    {productSubset : ProductSet}
    (productMembership :
      forall pair : Alpha × Beta,
        pair ∈ productSubset ↔
          pair.1 ∈ leftSubset /\ pair.2 ∈ rightSubset)
    (leftIsDirected : Directed leftRelation leftSubset)
    (rightIsDirected : Directed rightRelation rightSubset) :
    Directed (ProductRelation leftRelation rightRelation) productSubset := by
  sorry
end LRA.Order
