import LRA.Order.Bounds.GreatestElement.Relationships
import LRA.Order.Bounds.LeastElement.Relationships
import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Order.Lattices.CompleteLattice.Definition
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.OrderedSets.WellOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Set.Constructions.Mathlib.PredicateSet
import Mathlib.Data.Finite.Defs
import Mathlib.Data.Set.Finite.Basic

namespace LRA.Order

universe u v

/--
`NonemptyFiniteSubsetHasMaximalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {relation : LRA.Relation.Endorelation Element}, LRA.Order.PartialOrder relation → ∀ (subset : Set Element), (subset.Finite ∧ Exists fun element => element ∈ subset) → Exists fun maximal => LRA.Order.MaximalElement (LRA.Order.StrictPart relation) subset maximal

Predicate logic (unfolded):

  Ambient
    (Element)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsPartialOrder : PartialOrder relation
    subset : Set Element
    subsetIsFinite : subset.Finite
  Prove
    ((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => x) ∈ subset ∧ Exists fun element => element ∈ subset) → Exists fun maximal => (maximal ∈ subset ∧ (∀ (element : Element), element ∈ subset → (relation maximal element ∧ (maximal = element → False)) → False))

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasMaximalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists maximal, MaximalElement (StrictPart relation) subset maximal
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
theorem NonemptyFiniteSubsetHasMaximalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists maximal, MaximalElement (StrictPart relation) subset maximal := by
  sorry
/--
`NonemptyFiniteSubsetHasGreatestElement` TODO

Predicate logic:

  ∀ {Element : Type u} {relation : LRA.Relation.Endorelation Element}, LRA.Order.LinearOrder relation → ∀ (subset : Set Element), (subset.Finite ∧ Exists fun element => element ∈ subset) → Exists fun greatest => LRA.Order.GreatestElement relation subset greatest

Predicate logic (unfolded):

  Ambient
    (Element)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsLinearOrder : LinearOrder relation
    subset : Set Element
    subsetIsFinite : subset.Finite
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (x y : Element), Or (relation x y) (relation y x))) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => x) ∈ subset ∧ Exists fun element => element ∈ subset) → Exists fun greatest => (greatest ∈ subset ∧ (∀ (element : Element), element ∈ subset → relation element greatest))

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasGreatestElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists greatest, GreatestElement relation subset greatest
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
theorem NonemptyFiniteSubsetHasGreatestElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists greatest, GreatestElement relation subset greatest := by
  sorry
/--
`NonemptyFiniteSubsetHasMinimalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {relation : LRA.Relation.Endorelation Element}, LRA.Order.PartialOrder relation → ∀ (subset : Set Element), (subset.Finite ∧ Exists fun element => element ∈ subset) → Exists fun minimal => LRA.Order.MinimalElement (LRA.Order.StrictPart relation) subset minimal

Predicate logic (unfolded):

  Ambient
    (Element)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsPartialOrder : PartialOrder relation
    subset : Set Element
    subsetIsFinite : subset.Finite
  Prove
    ((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => x) ∈ subset ∧ Exists fun element => element ∈ subset) → Exists fun minimal => (minimal ∈ subset ∧ (∀ (element : Element), element ∈ subset → (relation element minimal ∧ (element = minimal → False)) → False))

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasMinimalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists minimal, MinimalElement (StrictPart relation) subset minimal
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
theorem NonemptyFiniteSubsetHasMinimalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists minimal, MinimalElement (StrictPart relation) subset minimal := by
  sorry
/--
`NonemptyFiniteSubsetHasLeastElement` TODO

Predicate logic:

  ∀ {Element : Type u} {relation : LRA.Relation.Endorelation Element}, LRA.Order.LinearOrder relation → ∀ (subset : Set Element), (subset.Finite ∧ Exists fun element => element ∈ subset) → Exists fun least => LRA.Order.LeastElement relation subset least

Predicate logic (unfolded):

  Ambient
    (Element)
  Objects
    relation : LRA.Relation.Endorelation Element
    relationIsLinearOrder : LinearOrder relation
    subset : Set Element
    subsetIsFinite : subset.Finite
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (x y : Element), Or (relation x y) (relation y x))) → ∀ (subset : Element → Prop), (Finite (Subtype fun x => x) ∈ subset ∧ Exists fun element => element ∈ subset) → Exists fun least => (least ∈ subset ∧ (∀ (element : Element), element ∈ subset → relation least element))

Logical form (Lean):

```lean
theorem NonemptyFiniteSubsetHasLeastElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists least, LeastElement relation subset least
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
theorem NonemptyFiniteSubsetHasLeastElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists least, LeastElement relation subset least := by
  sorry
/--
`FiniteLatticeIsComplete` TODO

Predicate logic:

  ∀ {Alpha : Type u}, (Finite Alpha ∧ Nonempty Alpha) → ∀ {relation : LRA.Relation.Endorelation Alpha}, LRA.Order.Lattice relation → LRA.Order.CompleteLattice (Set Alpha) relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsLattice : Lattice relation
  Prove
    (Finite Alpha ∧ Nonempty Alpha) → ∀ {relation : Alpha → Alpha → Prop}, (((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x → x = y) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) ∧ (∀ (left right : Alpha), ((Exists fun join => (relation left join ∧ (relation right join ∧ (∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)))) ∧ (Exists fun meet => (relation meet left ∧ (relation meet right ∧ (∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet))))))) → (((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x → x = y) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) ∧ (∀ (subset : Alpha → Prop), ((Exists fun supremum => ((∀ (element : Alpha), element ∈ subset → relation element supremum) ∧ (∀ (bound : Alpha), (∀ (element : Alpha), element ∈ subset → relation element bound) → relation supremum bound))) ∧ (Exists fun infimum => ((∀ (element : Alpha), element ∈ subset → relation infimum element) ∧ (∀ (bound : Alpha), (∀ (element : Alpha), element ∈ subset → relation bound element) → relation bound infimum))))))

Logical form (Lean):

```lean
theorem FiniteLatticeIsComplete
    {Alpha : Type u} [Finite Alpha] [Nonempty Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation) :
    CompleteLattice (Set Alpha) relation
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
theorem FiniteLatticeIsComplete
    {Alpha : Type u} [Finite Alpha] [Nonempty Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation) :
    CompleteLattice (Set Alpha) relation := by
  sorry
/--
`FiniteLinearOrderIsWellOrder` TODO

Predicate logic:

  ∀ {Alpha : Type u}, Finite Alpha → ∀ {relation : LRA.Relation.Endorelation Alpha}, LRA.Order.LinearOrder relation → LRA.Order.WellOrder (Set Alpha) relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsLinearOrder : LinearOrder relation
  Prove
    Finite Alpha → ∀ {relation : Alpha → Alpha → Prop}, (((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x → x = y) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) ∧ (∀ (x y : Alpha), Or (relation x y) (relation y x))) → ((((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x → x = y) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) ∧ (∀ (x y : Alpha), Or (relation x y) (relation y x))) ∧ (∀ (subset : Alpha → Prop), (Exists fun element => element) ∈ subset → Exists fun least => (least ∈ subset ∧ (∀ (element : Alpha), element ∈ subset → relation least element))))

Logical form (Lean):

```lean
theorem FiniteLinearOrderIsWellOrder
    {Alpha : Type u} [Finite Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    WellOrder (Set Alpha) relation
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
theorem FiniteLinearOrderIsWellOrder
    {Alpha : Type u} [Finite Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    WellOrder (Set Alpha) relation := by
  sorry
end LRA.Order
