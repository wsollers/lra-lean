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

  (∀ A ∈ U ∀ x ∈ Element), GreatestElement(x, A)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : Element → Element → Prop}, (∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x → x = y ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) → ∀ {subset : SetObject} {maximal : Element}, ((Exists fun element => inst.1 subset element ∧ ∀ (first second : Element), inst.1 subset first → inst.1 subset second → Exists fun upper => (inst.1 subset upper ∧ (relation first upper ∧ relation second upper))) ∧ (inst.1 subset maximal ∧ ∀ (element : Element), inst.1 subset element → (relation maximal element ∧ maximal = element → False) → False)) → (inst.1 subset maximal ∧ ∀ (element : Element), inst.1 subset element → relation element maximal)

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

  (forall pair : Alpha × Beta, pair ∈ productSubset ↔ pair.1 ∈ leftSubset ∧ pair.2 ∈ rightSubset) → Directed (ProductRelation leftRelation rightRelation) productSubset

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} {LeftSet : Type w} {RightSet : Type x} {ProductSet : Type y} [inst : Membership Alpha LeftSet] [inst_1 : Membership Beta RightSet] [inst_2 : Membership (Prod Alpha Beta) ProductSet] {leftRelation : Alpha → Alpha → Prop} {rightRelation : Beta → Beta → Prop} {leftSubset : LeftSet} {rightSubset : RightSet} {productSubset : ProductSet}, (∀ (pair : Prod Alpha Beta), inst_2.1 productSubset pair ↔ (inst.1 leftSubset pair.1 ∧ inst_1.1 rightSubset pair.2) ∧ ((Exists fun element => inst.1 leftSubset element ∧ ∀ (first second : Alpha), inst.1 leftSubset first → inst.1 leftSubset second → Exists fun upper => (inst.1 leftSubset upper ∧ (leftRelation first upper ∧ leftRelation second upper))) ∧ (Exists fun element => inst_1.1 rightSubset element ∧ ∀ (first second : Beta), inst_1.1 rightSubset first → inst_1.1 rightSubset second → Exists fun upper => (inst_1.1 rightSubset upper ∧ (rightRelation first upper ∧ rightRelation second upper))))) → (Exists fun element => inst_2.1 productSubset element ∧ ∀ (first second : Prod Alpha Beta), inst_2.1 productSubset first → inst_2.1 productSubset second → Exists fun upper => (inst_2.1 productSubset upper ∧ ((leftRelation first.1 upper.1 ∧ rightRelation first.2 upper.2) ∧ (leftRelation second.1 upper.1 ∧ rightRelation second.2 upper.2))))

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
