import LRA.Order.Directedness.Chain.Definition
import LRA.Order.Directedness.Directed.Definition
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Order

universe u v

/--
`NonemptyChainIsDirected` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {relation : LRA.Relation.Endorelation Element} {subset : SetObject}, (LRA.Relation.Reflexive relation ∧ (LRA.Order.Chain relation subset ∧ Exists fun element => element ∈ subset)) → LRA.Order.Directed relation subset

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    relation : LRA.Relation.Endorelation Element
    subset : SetObject
    relationIsReflexive : LRA.Relation.Reflexive relation
    subsetIsChain : Chain relation subset
  Prove
    ((∀ (x : Element), relation x x) ∧ ((∀ (first second : Element), inst.1 subset first → inst.1 subset second → Or (relation first second) (relation second first)) ∧ Exists fun element => inst.1 subset element)) → (Exists fun element => inst.1 subset element ∧ (∀ (first second : Element), inst.1 subset first → inst.1 subset second → Exists fun upper => (inst.1 subset upper ∧ (relation first upper ∧ relation second upper))))

Logical form (Lean):

```lean
theorem NonemptyChainIsDirected
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (subsetIsChain : Chain relation subset)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    Directed relation subset
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
theorem NonemptyChainIsDirected
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (subsetIsChain : Chain relation subset)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    Directed relation subset := by
  sorry
end LRA.Order
