import LRA.Order
import LRA.Order.Examples
import LRA.Relation.Interface.Laws.Definition
import LRA.Set.Constructions.Mathlib.PredicateSet
import Mathlib.Data.Int.Order.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Logic.Function.Defs
import Mathlib.Order.Interval.Set.Defs

universe u v w x

namespace LRA.Order

open LRA.Set

/--
`UpperBoundsFailToPreserveIndexedIntersectionsAsUnions` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasIndexedUnion SetObject] [inst_4 : LRA.Set.HasIndexedIntersection SetObject] (relation : LRA.Relation.Endorelation Element) (family : Index → SetObject), LRA.Order.UpperBounds relation (inst_4.indexedIntersection family) = inst_3.indexedUnion fun index => LRA.Order.UpperBounds relation (family index) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst_1.1 inst_2.1 fun bound => ∀ (element : Element), inst.1 (inst_4.1 family) element → relation element bound = inst_3.1 fun index => inst_1.1 inst_2.1 fun bound => ∀ (element : Element), inst.1 (family index) element → relation element bound → False

Logical form (Lean):

```lean
def UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  UpperBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => UpperBounds relation (family index))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  UpperBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => UpperBounds relation (family index))

/--
`IntegerSingletonsWitnessUpperBoundsIntersectionFailure` TODO

Predicate logic:

  LRA.Order.UpperBoundsFailToPreserveIndexedIntersectionsAsUnions (fun left right => Int.instLEInt.le left right) fun index => ite (index = Bool.true)(Set.instSingletonSet.singleton 1) (Set.instSingletonSet.singleton 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.MathlibPredicateSet.instHasSeparationSet.1 LRA.Set.MathlibPredicateSet.instHasUniversalSet.1 fun bound => ∀ (element : Int), element ∈ LRA.Set.MathlibPredicateSet.instHasIndexedIntersectionSet.indexedIntersection fun index => ite (index = Bool.true)(Set.instSingletonSet.singleton 1) (Set.instSingletonSet.singleton 0) → (fun left right => Int.instLEInt.le left right) element bound = LRA.Set.MathlibPredicateSet.instHasIndexedUnionSet.1 fun index => LRA.Set.MathlibPredicateSet.instHasSeparationSet.1 LRA.Set.MathlibPredicateSet.instHasUniversalSet.universal (LRA.Order.UpperBound (fun left right => Int.instLEInt.le left right) ((fun index => ite (index = Bool.true)(Set.instSingletonSet.singleton 1) (Set.instSingletonSet.singleton 0)) index)) → False

Logical form (Lean):

```lean
theorem IntegerSingletonsWitnessUpperBoundsIntersectionFailure :
    UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0})
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
theorem IntegerSingletonsWitnessUpperBoundsIntersectionFailure :
    UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry
/--
`LowerBoundsFailToPreserveIndexedIntersectionsAsUnions` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.HasUniversal SetObject] [inst_3 : LRA.Set.HasIndexedUnion SetObject] [inst_4 : LRA.Set.HasIndexedIntersection SetObject] (relation : LRA.Relation.Endorelation Element) (family : Index → SetObject), LRA.Order.LowerBounds relation (inst_4.indexedIntersection family) = inst_3.indexedUnion fun index => LRA.Order.LowerBounds relation (family index) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst_1.1 inst_2.1 fun bound => ∀ (element : Element), inst.1 (inst_4.1 family) element → relation bound element = inst_3.1 fun index => inst_1.1 inst_2.1 fun bound => ∀ (element : Element), inst.1 (family index) element → relation bound element → False

Logical form (Lean):

```lean
def LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  LowerBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => LowerBounds relation (family index))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  LowerBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => LowerBounds relation (family index))

/--
`IntegerSingletonsWitnessLowerBoundsIntersectionFailure` TODO

Predicate logic:

  LRA.Order.LowerBoundsFailToPreserveIndexedIntersectionsAsUnions (fun left right => Int.instLEInt.le left right) fun index => ite (index = Bool.true)(Set.instSingletonSet.singleton 1) (Set.instSingletonSet.singleton 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.MathlibPredicateSet.instHasSeparationSet.1 LRA.Set.MathlibPredicateSet.instHasUniversalSet.1 fun bound => ∀ (element : Int), element ∈ LRA.Set.MathlibPredicateSet.instHasIndexedIntersectionSet.indexedIntersection fun index => ite (index = Bool.true)(Set.instSingletonSet.singleton 1) (Set.instSingletonSet.singleton 0) → (fun left right => Int.instLEInt.le left right) bound element = LRA.Set.MathlibPredicateSet.instHasIndexedUnionSet.1 fun index => LRA.Set.MathlibPredicateSet.instHasSeparationSet.1 LRA.Set.MathlibPredicateSet.instHasUniversalSet.universal (LRA.Order.LowerBound (fun left right => Int.instLEInt.le left right) ((fun index => ite (index = Bool.true)(Set.instSingletonSet.singleton 1) (Set.instSingletonSet.singleton 0)) index)) → False

Logical form (Lean):

```lean
theorem IntegerSingletonsWitnessLowerBoundsIntersectionFailure :
    LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0})
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
theorem IntegerSingletonsWitnessLowerBoundsIntersectionFailure :
    LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry
/--
`EmptyIndexedIntersectionCreatesVacuousBounds` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} {Index : Type w} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasIndexedIntersection SetObject] (relation : LRA.Relation.Endorelation Element) (family : Index → SetObject), ((∀ (element : Element), ¬ element ∈ inst_1.indexedIntersection family) ∧ (∀ (bound : Element), (LRA.Order.UpperBound relation (inst_1.indexedIntersection family) bound ∧ LRA.Order.LowerBound relation (inst_1.indexedIntersection family) bound)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Element), inst.1 (inst_1.1 family) element → False) ∧ (∀ (bound : Element), ((∀ (element : Element), inst.1 (inst_1.1 family) element → relation element bound) ∧ (∀ (element : Element), inst.1 (inst_1.1 family) element → relation bound element))))

Logical form (Lean):

```lean
def EmptyIndexedIntersectionCreatesVacuousBounds
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  (forall element,
      element ∉ HasIndexedIntersection.indexedIntersection family) /\
    (forall bound,
      UpperBound relation
          (HasIndexedIntersection.indexedIntersection family) bound /\
        LowerBound relation
          (HasIndexedIntersection.indexedIntersection family) bound)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def EmptyIndexedIntersectionCreatesVacuousBounds
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  (forall element,
      element ∉ HasIndexedIntersection.indexedIntersection family) /\
    (forall bound,
      UpperBound relation
          (HasIndexedIntersection.indexedIntersection family) bound /\
        LowerBound relation
          (HasIndexedIntersection.indexedIntersection family) bound)

/--
`DisjointIntegerSingletonsCreateVacuousBounds` TODO

Predicate logic:

  LRA.Order.EmptyIndexedIntersectionCreatesVacuousBounds (fun left right => Int.instLEInt.le left right) fun index => ite (index = Bool.true)(Set.instSingletonSet.singleton 1) (Set.instSingletonSet.singleton 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Int), element ∈ LRA.Set.MathlibPredicateSet.instHasIndexedIntersectionSet.1 fun index => Decidable.rec (fun h => (fun x => Set.instSingletonSet.singleton 0) h) (fun h => (fun x => Set.instSingletonSet.singleton 1) h) (instDecidableEqBool index Bool.true) → False) ∧ (∀ (bound : Int), ((∀ (element : Int), element ∈ LRA.Set.MathlibPredicateSet.instHasIndexedIntersectionSet.1 fun index => Decidable.rec (fun h => (fun x => Set.instSingletonSet.singleton 0) h) (fun h => (fun x => Set.instSingletonSet.singleton 1) h) (instDecidableEqBool index Bool.true) → (fun left right => Int.instLEInt.le left right) element bound) ∧ (∀ (element : Int), element ∈ LRA.Set.MathlibPredicateSet.instHasIndexedIntersectionSet.1 fun index => Decidable.rec (fun h => (fun x => Set.instSingletonSet.singleton 0) h) (fun h => (fun x => Set.instSingletonSet.singleton 1) h) (instDecidableEqBool index Bool.true) → (fun left right => Int.instLEInt.le left right) bound element))))

Logical form (Lean):

```lean
theorem DisjointIntegerSingletonsCreateVacuousBounds :
    EmptyIndexedIntersectionCreatesVacuousBounds
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0})
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
theorem DisjointIntegerSingletonsCreateVacuousBounds :
    EmptyIndexedIntersectionCreatesVacuousBounds
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry
end LRA.Order

namespace LRA.Order

open LRA.Set

/--
`FailsBounded` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), LRA.Order.Bounded relation subset → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) ∧ (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element)) → False

Logical form (Lean):

```lean
def FailsBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Bounded relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Bounded relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBounded` TODO

Predicate logic:

  LRA.Order.FailsBounded (fun left right => Int.instLEInt.le left right) Set.univ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun bound => ∀ (element : Int), element ∈ Set.univ → (fun left right => Int.instLEInt.le left right) element bound) ∧ (Exists fun bound => ∀ (element : Int), element ∈ Set.univ → (fun left right => Int.instLEInt.le left right) bound element)) → False

Logical form (Lean):

```lean
theorem IntegerUniverseFailsBounded :
    FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int)
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
theorem IntegerUniverseFailsBounded :
    FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry
end IntegerUniverse

/--
`ComplementDestroysTwoSidedBoundedness` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasComplement SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (LRA.Order.Bounded relation subset ∧ (¬ LRA.Order.BoundedAbove relation (inst_1.complement subset) ∧ ¬ LRA.Order.BoundedBelow relation (inst_1.complement subset)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) ∧ (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element)) ∧ (((Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 subset) element → relation element bound) → False) ∧ ((Exists fun bound => ∀ (element : Element), inst.1 (inst_1.1 subset) element → relation bound element) → False)))

Logical form (Lean):

```lean
def ComplementDestroysTwoSidedBoundedness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasComplement SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Bounded relation subset /\
    Not (BoundedAbove relation subsetᶜ) /\
    Not (BoundedBelow relation subsetᶜ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def ComplementDestroysTwoSidedBoundedness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasComplement SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Bounded relation subset /\
    Not (BoundedAbove relation subsetᶜ) /\
    Not (BoundedBelow relation subsetᶜ)

/--
`EveryBoundedRealSetHasUnboundedComplement` TODO

Predicate logic:

  ∀ (subset : Set Real), LRA.Order.Bounded (fun left right => Real.instLE.le left right) subset → LRA.Order.ComplementDestroysTwoSidedBoundedness (fun left right => Real.instLE.le left right) subset

Predicate logic (unfolded):

  Ambient
    (Real)
  Objects
    subset : Set Real
  Prove
    ((Exists fun bound => ∀ (element : Real), element ∈ subset → (fun left right => Real.instLE.le left right) element bound) ∧ (Exists fun bound => ∀ (element : Real), element ∈ subset → (fun left right => Real.instLE.le left right) bound element)) → (((Exists fun bound => ∀ (element : Real), element ∈ subset → (fun left right => Real.instLE.le left right) element bound) ∧ (Exists fun bound => ∀ (element : Real), element ∈ subset → (fun left right => Real.instLE.le left right) bound element)) ∧ (((Exists fun bound => ∀ (element : Real), element ∈ LRA.Set.MathlibPredicateSet.instHasComplementSet.1 subset → (fun left right => Real.instLE.le left right) element bound) → False) ∧ ((Exists fun bound => ∀ (element : Real), element ∈ LRA.Set.MathlibPredicateSet.instHasComplementSet.1 subset → (fun left right => Real.instLE.le left right) bound element) → False)))

Logical form (Lean):

```lean
theorem EveryBoundedRealSetHasUnboundedComplement
    (subset : Set Real)
    (subsetIsBounded :
      Bounded (fun left right : Real => left ≤ right) subset) :
    ComplementDestroysTwoSidedBoundedness
      (fun left right : Real => left ≤ right) subset
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
theorem EveryBoundedRealSetHasUnboundedComplement
    (subset : Set Real)
    (subsetIsBounded :
      Bounded (fun left right : Real => left ≤ right) subset) :
    ComplementDestroysTwoSidedBoundedness
      (fun left right : Real => left ≤ right) subset := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsBoundedAbove` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), LRA.Order.BoundedAbove relation subset → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) → False

Logical form (Lean):

```lean
def FailsBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedAbove relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedAbove relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBoundedAbove` TODO

Predicate logic:

  LRA.Order.FailsBoundedAbove (fun left right => Int.instLEInt.le left right) Set.univ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun bound => ∀ (element : Int), element ∈ setOf fun _a => True → (fun left right => Int.instLEInt.le left right) element bound) → False

Logical form (Lean):

```lean
theorem IntegerUniverseFailsBoundedAbove :
    FailsBoundedAbove (fun left right : Int => left ≤ right) (Set.univ : Set Int)
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
theorem IntegerUniverseFailsBoundedAbove :
    FailsBoundedAbove (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry
end IntegerUniverse

end LRA.Order

namespace LRA.Order

/--
`FailsBoundedBelow` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), LRA.Order.BoundedBelow relation subset → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) → False

Logical form (Lean):

```lean
def FailsBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedBelow relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedBelow relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBoundedBelow` TODO

Predicate logic:

  LRA.Order.FailsBoundedBelow (fun left right => Int.instLEInt.le left right) Set.univ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun bound => ∀ (element : Int), element ∈ setOf fun _a => True → (fun left right => Int.instLEInt.le left right) bound element) → False

Logical form (Lean):

```lean
theorem IntegerUniverseFailsBoundedBelow :
    FailsBoundedBelow (fun left right : Int => left ≤ right) (Set.univ : Set Int)
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
theorem IntegerUniverseFailsBoundedBelow :
    FailsBoundedBelow (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry
end IntegerUniverse

end LRA.Order

namespace LRA.Order

/--
`FailsGreatestElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.GreatestElement relation subset candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 subset candidate ∧ (∀ (element : Element), inst.1 subset element → relation element candidate)) → False

Logical form (Lean):

```lean
def FailsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (GreatestElement relation subset candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (GreatestElement relation subset candidate)

section RealOpenUnitInterval

/--
`OneFailsGreatestElementOfOpenUnitInterval` TODO

Predicate logic:

  LRA.Order.FailsGreatestElement (fun left right => Real.instLE.le left right) (Set.Ioo 0 1) 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((1 ∈ fun x => (Real.instPreorder.lt 0 x ∧ Real.instPreorder.lt x 1)) ∧ (∀ (element : Real), element ∈ setOf fun x => (Real.instPreorder.lt 0 x ∧ Real.instPreorder.lt x 1) → (fun left right => Real.instLE.le left right) element 1)) → False

Logical form (Lean):

```lean
theorem OneFailsGreatestElementOfOpenUnitInterval :
    FailsGreatestElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1
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
theorem OneFailsGreatestElementOfOpenUnitInterval :
    FailsGreatestElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry
end RealOpenUnitInterval

end LRA.Order

namespace LRA.Order

/--
`FailsGreatestLowerBoundProperty` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element), LRA.Order.GreatestLowerBoundProperty SetObject relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element) → Exists fun infimum => ((∀ (element : Element), inst.1 subset element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum))) → False

Logical form (Lean):

```lean
def FailsGreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (GreatestLowerBoundProperty SetObject relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsGreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (GreatestLowerBoundProperty SetObject relation)

section RationalOrder

/--
`RationalOrderFailsGreatestLowerBoundProperty` TODO

Predicate logic:

  LRA.Order.FailsGreatestLowerBoundProperty (Set Rat) fun left right => Rat.instLE.le left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (subset : Rat → Prop), (Exists fun element => element) ∈ subset → (Exists fun bound => ∀ (element : Rat), element ∈ subset → (fun left right => Rat.instLE.le left right) bound element) → Exists fun infimum => ((∀ (element : Rat), element ∈ subset → (fun left right => Rat.instLE.le left right) infimum element) ∧ (∀ (bound : Rat), (∀ (element : Rat), element ∈ subset → (fun left right => Rat.instLE.le left right) bound element) → (fun left right => Rat.instLE.le left right) bound infimum))) → False

Logical form (Lean):

```lean
theorem RationalOrderFailsGreatestLowerBoundProperty :
    FailsGreatestLowerBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right)
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
theorem RationalOrderFailsGreatestLowerBoundProperty :
    FailsGreatestLowerBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry
end RationalOrder

end LRA.Order

namespace LRA.Order

/--
`FailsInfimum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (Exists fun candidate => LRA.Order.Infimum relation subset candidate) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun candidate => ((∀ (element : Element), inst.1 subset element → relation candidate element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound candidate))) → False

Logical form (Lean):

```lean
def FailsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Exists fun candidate => Infimum relation subset candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Exists fun candidate => Infimum relation subset candidate)

section IntegerEmptySet

/--
`EmptyIntegerSetFailsInfimum` TODO

Predicate logic:

  LRA.Order.FailsInfimum (fun left right => Int.instLEInt.le left right) Set.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun candidate => ((∀ (element : Int), element ∈ Set.instEmptyCollection.1 → (fun left right => Int.instLEInt.le left right) candidate element) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instEmptyCollection.1 → (fun left right => Int.instLEInt.le left right) bound element) → (fun left right => Int.instLEInt.le left right) bound candidate))) → False

Logical form (Lean):

```lean
theorem EmptyIntegerSetFailsInfimum :
    FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int)
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
theorem EmptyIntegerSetFailsInfimum :
    FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int) := by
  sorry
end IntegerEmptySet

/--
`ComplementInfimumFormulaFails` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (complement : SetObject → SetObject) (subset : SetObject), (Exists fun infimum => LRA.Order.Infimum relation subset infimum ∧ ¬ Exists fun infimum => LRA.Order.Infimum relation (complement subset) infimum)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun infimum => ((∀ (element : Element), inst.1 subset element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum))) ∧ ((Exists fun infimum => ((∀ (element : Element), inst.1 (complement subset) element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (complement subset) element → relation bound element) → relation bound infimum))) → False))

Logical form (Lean):

```lean
def ComplementInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists infimum, Infimum relation subset infimum) /\
    Not (exists infimum, Infimum relation (complement subset) infimum)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def ComplementInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists infimum, Infimum relation subset infimum) /\
    Not (exists infimum, Infimum relation (complement subset) infimum)

/--
`IntegerSingletonComplementHasNoInfimum` TODO

Predicate logic:

  LRA.Order.ComplementInfimumFormulaFails (fun left right => Int.instLEInt.le left right) Set.compl (Set.instSingletonSet.singleton 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun infimum => ((∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) infimum element) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) bound element) → (fun left right => Int.instLEInt.le left right) bound infimum))) ∧ ((Exists fun infimum => ((∀ (element : Int), element ∈ setOf fun a => ¬ a ∈ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) infimum element) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ setOf fun a => ¬ a ∈ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) bound element) → (fun left right => Int.instLEInt.le left right) bound infimum))) → False))

Logical form (Lean):

```lean
theorem IntegerSingletonComplementHasNoInfimum :
    ComplementInfimumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int)
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
theorem IntegerSingletonComplementHasNoInfimum :
    ComplementInfimumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry
/--
`DifferenceInfimumFormulaFails` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : SDiff SetObject] (relation : LRA.Relation.Endorelation Element) (left removed : SetObject), (Exists fun infimum => LRA.Order.Infimum relation left infimum ∧ (Exists fun infimum => LRA.Order.Infimum relation removed infimum ∧ ¬ Exists fun infimum => LRA.Order.Infimum relation (left \ removed)infimum))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun infimum => ((∀ (element : Element), inst.1 left element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 left element → relation bound element) → relation bound infimum))) ∧ ((Exists fun infimum => ((∀ (element : Element), inst.1 removed element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 removed element → relation bound element) → relation bound infimum))) ∧ ((Exists fun infimum => ((∀ (element : Element), inst.1 (inst_1.1 left removed) element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 left removed) element → relation bound element) → relation bound infimum))) → False)))

Logical form (Lean):

```lean
def DifferenceInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists infimum, Infimum relation left infimum) /\
    (exists infimum, Infimum relation removed infimum) /\
      Not (exists infimum, Infimum relation (left \ removed) infimum)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def DifferenceInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists infimum, Infimum relation left infimum) /\
    (exists infimum, Infimum relation removed infimum) /\
      Not (exists infimum, Infimum relation (left \ removed) infimum)

/--
`IntegerSingletonDifferenceHasNoInfimum` TODO

Predicate logic:

  LRA.Order.DifferenceInfimumFormulaFails (fun left right => Int.instLEInt.le left right) (Set.instSingletonSet.singleton 0) (Set.instSingletonSet.singleton 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun infimum => ((∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) infimum element) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) bound element) → (fun left right => Int.instLEInt.le left right) bound infimum))) ∧ ((Exists fun infimum => ((∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) infimum element) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) bound element) → (fun left right => Int.instLEInt.le left right) bound infimum))) ∧ ((Exists fun infimum => ((∀ (element : Int), element ∈ Set.instSingletonSet.singleton 0 \ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) infimum element) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.singleton 0 \ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) bound element) → (fun left right => Int.instLEInt.le left right) bound infimum))) → False)))

Logical form (Lean):

```lean
theorem IntegerSingletonDifferenceHasNoInfimum :
    DifferenceInfimumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int)
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
theorem IntegerSingletonDifferenceHasNoInfimum :
    DifferenceInfimumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsLeastElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.LeastElement relation subset candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 subset candidate ∧ (∀ (element : Element), inst.1 subset element → relation candidate element)) → False

Logical form (Lean):

```lean
def FailsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LeastElement relation subset candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LeastElement relation subset candidate)

section RealOpenUnitInterval

/--
`ZeroFailsLeastElementOfOpenUnitInterval` TODO

Predicate logic:

  LRA.Order.FailsLeastElement (fun left right => Real.instLE.le left right) (Set.Ioo 0 1) 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((0 ∈ fun x => (Real.instPreorder.lt 0 x ∧ Real.instPreorder.lt x 1)) ∧ (∀ (element : Real), element ∈ setOf fun x => (Real.instPreorder.lt 0 x ∧ Real.instPreorder.lt x 1) → (fun left right => Real.instLE.le left right) 0 element)) → False

Logical form (Lean):

```lean
theorem ZeroFailsLeastElementOfOpenUnitInterval :
    FailsLeastElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0
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
theorem ZeroFailsLeastElementOfOpenUnitInterval :
    FailsLeastElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry
end RealOpenUnitInterval

end LRA.Order

namespace LRA.Order

/--
`FailsLeastUpperBoundProperty` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element), LRA.Order.LeastUpperBoundProperty SetObject relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound) → Exists fun supremum => ((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound))) → False

Logical form (Lean):

```lean
def FailsLeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (LeastUpperBoundProperty SetObject relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsLeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (LeastUpperBoundProperty SetObject relation)

section RationalOrder

/--
`RationalOrderFailsLeastUpperBoundProperty` TODO

Predicate logic:

  LRA.Order.FailsLeastUpperBoundProperty (Set Rat) fun left right => Rat.instLE.le left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (subset : Rat → Prop), (Exists fun element => element) ∈ subset → (Exists fun bound => ∀ (element : Rat), element ∈ subset → (fun left right => Rat.instLE.le left right) element bound) → Exists fun supremum => ((∀ (element : Rat), element ∈ subset → (fun left right => Rat.instLE.le left right) element supremum) ∧ (∀ (bound : Rat), (∀ (element : Rat), element ∈ subset → (fun left right => Rat.instLE.le left right) element bound) → (fun left right => Rat.instLE.le left right) supremum bound))) → False

Logical form (Lean):

```lean
theorem RationalOrderFailsLeastUpperBoundProperty :
    FailsLeastUpperBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right)
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
theorem RationalOrderFailsLeastUpperBoundProperty :
    FailsLeastUpperBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry
end RationalOrder

end LRA.Order

namespace LRA.Order

/--
`FailsLowerBound` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.LowerBound relation subset candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Element), inst.1 subset element → relation candidate element) → False

Logical form (Lean):

```lean
def FailsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LowerBound relation subset candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LowerBound relation subset candidate)

section RealOpenUnitInterval

/--
`OneFailsLowerBoundOfOpenUnitInterval` TODO

Predicate logic:

  LRA.Order.FailsLowerBound (fun left right => Real.instLE.le left right) (Set.Ioo 0 1) 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Real), element ∈ fun x => (Real.instPreorder.lt 0 x ∧ Real.instPreorder.lt x 1) → (fun left right => Real.instLE.le left right) 1 element) → False

Logical form (Lean):

```lean
theorem OneFailsLowerBoundOfOpenUnitInterval :
    FailsLowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1
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
theorem OneFailsLowerBoundOfOpenUnitInterval :
    FailsLowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry
end RealOpenUnitInterval

end LRA.Order

namespace LRA.Order

/--
`MaximalityFailsToImplyGreatest` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), (LRA.Order.MaximalElement strictRelation subset candidate ∧ ¬ LRA.Order.GreatestElement nonStrictRelation subset candidate)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((inst.1 subset candidate ∧ (∀ (element : Element), inst.1 subset element → strictRelation candidate element → False)) ∧ ((inst.1 subset candidate ∧ (∀ (element : Element), inst.1 subset element → nonStrictRelation element candidate)) → False))

Logical form (Lean):

```lean
def MaximalityFailsToImplyGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MaximalElement strictRelation subset candidate /\
    Not (GreatestElement nonStrictRelation subset candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def MaximalityFailsToImplyGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MaximalElement strictRelation subset candidate /\
    Not (GreatestElement nonStrictRelation subset candidate)

/--
`BooleanAntichainHasDistinctMaximalElementsButNoGreatest` TODO

Predicate logic:

  (LRA.Order.MaximalityFailsToImplyGreatest (LRA.Order.StrictPart fun left right => left = right) (fun left right => left = right)Set.univ Bool.false ∧ (LRA.Order.MaximalityFailsToImplyGreatest (LRA.Order.StrictPart fun left right => left = right) (fun left right => left = right)Set.univ Bool.true ∧ Ne Bool.false Bool.true))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((Bool.false ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ fun _a => True → ((fun left right => left = right)Bool.false element ∧ ¬ Bool.false = element) → False)) ∧ ((Bool.false ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ setOf fun _a => True → (fun left right => left = right)element Bool.false)) → False)) ∧ (((Bool.true ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ fun _a => True → ((fun left right => left = right)Bool.true element ∧ ¬ Bool.true = element) → False)) ∧ ((Bool.true ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ setOf fun _a => True → (fun left right => left = right)element Bool.true)) → False)) ∧ (Bool.false = Bool.true → False)))

Logical form (Lean):

```lean
theorem BooleanAntichainHasDistinctMaximalElementsButNoGreatest :
    MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem BooleanAntichainHasDistinctMaximalElementsButNoGreatest :
    MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`MinimalityFailsToImplyLeast` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), (LRA.Order.MinimalElement strictRelation subset candidate ∧ ¬ LRA.Order.LeastElement nonStrictRelation subset candidate)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((inst.1 subset candidate ∧ (∀ (element : Element), inst.1 subset element → strictRelation element candidate → False)) ∧ ((inst.1 subset candidate ∧ (∀ (element : Element), inst.1 subset element → nonStrictRelation candidate element)) → False))

Logical form (Lean):

```lean
def MinimalityFailsToImplyLeast
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MinimalElement strictRelation subset candidate /\
    Not (LeastElement nonStrictRelation subset candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def MinimalityFailsToImplyLeast
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MinimalElement strictRelation subset candidate /\
    Not (LeastElement nonStrictRelation subset candidate)

/--
`BooleanAntichainHasDistinctMinimalElementsButNoLeast` TODO

Predicate logic:

  (LRA.Order.MinimalityFailsToImplyLeast (LRA.Order.StrictPart fun left right => left = right) (fun left right => left = right)Set.univ Bool.false ∧ (LRA.Order.MinimalityFailsToImplyLeast (LRA.Order.StrictPart fun left right => left = right) (fun left right => left = right)Set.univ Bool.true ∧ Ne Bool.false Bool.true))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((Bool.false ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ fun _a => True → ((fun left right => left = right)element Bool.false ∧ ¬ element = Bool.false) → False)) ∧ ((Bool.false ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ setOf fun _a => True → (fun left right => left = right)Bool.false element)) → False)) ∧ (((Bool.true ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ fun _a => True → ((fun left right => left = right)element Bool.true ∧ ¬ element = Bool.true) → False)) ∧ ((Bool.true ∈ fun _a => True ∧ (∀ (element : Bool), element ∈ setOf fun _a => True → (fun left right => left = right)Bool.true element)) → False)) ∧ (Bool.false = Bool.true → False)))

Logical form (Lean):

```lean
theorem BooleanAntichainHasDistinctMinimalElementsButNoLeast :
    MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem BooleanAntichainHasDistinctMinimalElementsButNoLeast :
    MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsSupremumUniqueness` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), Exists fun first => Exists fun second => (Ne first second ∧ (LRA.Order.Supremum relation subset first ∧ LRA.Order.Supremum relation subset second))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun first => Exists fun second => ((first = second → False) ∧ (((∀ (element : Element), inst.1 subset element → relation element first) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation first bound)) ∧ ((∀ (element : Element), inst.1 subset element → relation element second) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation second bound))))

Logical form (Lean):

```lean
def FailsSupremumUniqueness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists first second,
    first ≠ second /\
      Supremum relation subset first /\
        Supremum relation subset second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def FailsSupremumUniqueness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists first second,
    first ≠ second /\
      Supremum relation subset first /\
        Supremum relation subset second

/--
`SupremaNeedNotBeUniqueInPreorder` TODO

Predicate logic:

  (LRA.Order.Preorder fun x x_1 => True ∧ LRA.Order.FailsSupremumUniqueness (fun x x_1 => True) Set.univ)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Bool), (fun x x_1 => True) x x) ∧ (∀ (x y z : Bool), True → True → (fun x x_1 => True) x z)) ∧ (Exists fun first => Exists fun second => ((first = second → False) ∧ (((∀ (element : Bool), element ∈ fun _a => True → (fun x x_1 => True) element first) ∧ (∀ (bound : Bool), (∀ (element : Bool), element ∈ fun _a => True → (fun x x_1 => True) element bound) → (fun x x_1 => True) first bound)) ∧ ((∀ (element : Bool), element ∈ fun _a => True → (fun x x_1 => True) element second) ∧ (∀ (bound : Bool), (∀ (element : Bool), element ∈ fun _a => True → (fun x x_1 => True) element bound) → (fun x x_1 => True) second bound))))))

Logical form (Lean):

```lean
theorem SupremaNeedNotBeUniqueInPreorder :
    Preorder (fun _ _ : Bool => True) /\
      FailsSupremumUniqueness
        (fun _ _ : Bool => True) (Set.univ : Set Bool)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem SupremaNeedNotBeUniqueInPreorder :
    Preorder (fun _ _ : Bool => True) /\
      FailsSupremumUniqueness
        (fun _ _ : Bool => True) (Set.univ : Set Bool) := by
  sorry
/--
`ComplementSupremumFormulaFails` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (complement : SetObject → SetObject) (subset : SetObject), (Exists fun supremum => LRA.Order.Supremum relation subset supremum ∧ ¬ Exists fun supremum => LRA.Order.Supremum relation (complement subset) supremum)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun supremum => ((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound))) ∧ ((Exists fun supremum => ((∀ (element : Element), inst.1 (complement subset) element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (complement subset) element → relation element bound) → relation supremum bound))) → False))

Logical form (Lean):

```lean
def ComplementSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists supremum, Supremum relation subset supremum) /\
    Not (exists supremum, Supremum relation (complement subset) supremum)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def ComplementSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists supremum, Supremum relation subset supremum) /\
    Not (exists supremum, Supremum relation (complement subset) supremum)

/--
`IntegerSingletonComplementHasNoSupremum` TODO

Predicate logic:

  LRA.Order.ComplementSupremumFormulaFails (fun left right => Int.instLEInt.le left right) Set.compl (Set.instSingletonSet.singleton 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun supremum => ((∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) element supremum) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) element bound) → (fun left right => Int.instLEInt.le left right) supremum bound))) ∧ ((Exists fun supremum => ((∀ (element : Int), element ∈ setOf fun a => ¬ a ∈ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) element supremum) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ setOf fun a => ¬ a ∈ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) element bound) → (fun left right => Int.instLEInt.le left right) supremum bound))) → False))

Logical form (Lean):

```lean
theorem IntegerSingletonComplementHasNoSupremum :
    ComplementSupremumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int)
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
theorem IntegerSingletonComplementHasNoSupremum :
    ComplementSupremumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry
/--
`DifferenceSupremumFormulaFails` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : SDiff SetObject] (relation : LRA.Relation.Endorelation Element) (left removed : SetObject), (Exists fun supremum => LRA.Order.Supremum relation left supremum ∧ (Exists fun supremum => LRA.Order.Supremum relation removed supremum ∧ ¬ Exists fun supremum => LRA.Order.Supremum relation (left \ removed)supremum))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun supremum => ((∀ (element : Element), inst.1 left element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 left element → relation element bound) → relation supremum bound))) ∧ ((Exists fun supremum => ((∀ (element : Element), inst.1 removed element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 removed element → relation element bound) → relation supremum bound))) ∧ ((Exists fun supremum => ((∀ (element : Element), inst.1 (inst_1.1 left removed) element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 (inst_1.1 left removed) element → relation element bound) → relation supremum bound))) → False)))

Logical form (Lean):

```lean
def DifferenceSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists supremum, Supremum relation left supremum) /\
    (exists supremum, Supremum relation removed supremum) /\
      Not (exists supremum, Supremum relation (left \ removed) supremum)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def DifferenceSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists supremum, Supremum relation left supremum) /\
    (exists supremum, Supremum relation removed supremum) /\
      Not (exists supremum, Supremum relation (left \ removed) supremum)

/--
`IntegerSingletonDifferenceHasNoSupremum` TODO

Predicate logic:

  LRA.Order.DifferenceSupremumFormulaFails (fun left right => Int.instLEInt.le left right) (Set.instSingletonSet.singleton 0) (Set.instSingletonSet.singleton 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun supremum => ((∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) element supremum) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) element bound) → (fun left right => Int.instLEInt.le left right) supremum bound))) ∧ ((Exists fun supremum => ((∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) element supremum) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.1 0 → (fun left right => Int.instLEInt.le left right) element bound) → (fun left right => Int.instLEInt.le left right) supremum bound))) ∧ ((Exists fun supremum => ((∀ (element : Int), element ∈ Set.instSingletonSet.singleton 0 \ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) element supremum) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ Set.instSingletonSet.singleton 0 \ Set.instSingletonSet.singleton 0 → (fun left right => Int.instLEInt.le left right) element bound) → (fun left right => Int.instLEInt.le left right) supremum bound))) → False)))

Logical form (Lean):

```lean
theorem IntegerSingletonDifferenceHasNoSupremum :
    DifferenceSupremumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int)
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
theorem IntegerSingletonDifferenceHasNoSupremum :
    DifferenceSupremumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsUpperBound` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (candidate : Element), LRA.Order.UpperBound relation subset candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Element), inst.1 subset element → relation element candidate) → False

Logical form (Lean):

```lean
def FailsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (UpperBound relation subset candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (UpperBound relation subset candidate)

section RealOpenUnitInterval

/--
`ZeroFailsUpperBoundOfOpenUnitInterval` TODO

Predicate logic:

  LRA.Order.FailsUpperBound (fun left right => Real.instLE.le left right) (Set.Ioo 0 1) 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Real), element ∈ fun x => (Real.instPreorder.lt 0 x ∧ Real.instPreorder.lt x 1) → (fun left right => Real.instLE.le left right) element 0) → False

Logical form (Lean):

```lean
theorem ZeroFailsUpperBoundOfOpenUnitInterval :
    FailsUpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0
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
theorem ZeroFailsUpperBoundOfOpenUnitInterval :
    FailsUpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry
end RealOpenUnitInterval

end LRA.Order

namespace LRA.Order

/--
`ProductOrderFailsTotality` TODO

Predicate logic:

  ∀ {Left : Type u} {Right : Type v} (leftRelation : LRA.Relation.Endorelation Left) (rightRelation : LRA.Relation.Endorelation Right), LRA.Relation.Total (LRA.Order.ProductRelation leftRelation rightRelation) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x y : Prod Left Right), Or ((leftRelation x.1 y.1 ∧ rightRelation x.2 y.2)) ((leftRelation y.1 x.1 ∧ rightRelation y.2 x.2))) → False

Logical form (Lean):

```lean
def ProductOrderFailsTotality
    {Left : Type u} {Right : Type v}
    (leftRelation : LRA.Relation.Endorelation Left)
    (rightRelation : LRA.Relation.Endorelation Right) : Prop :=
  Not (LRA.Relation.Total
    (ProductRelation leftRelation rightRelation))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ProductOrderFailsTotality
    {Left : Type u} {Right : Type v}
    (leftRelation : LRA.Relation.Endorelation Left)
    (rightRelation : LRA.Relation.Endorelation Right) : Prop :=
  Not (LRA.Relation.Total
    (ProductRelation leftRelation rightRelation))

/--
`ProductOfLinearOrdersNeedNotBeLinear` TODO

Predicate logic:

  LRA.Order.ProductOrderFailsTotality (fun left right => instLENat.le left right) fun left right => instLENat.le left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x y : Prod Nat Nat), Or (((fun left right => instLENat.le left right) x.1 y.1 ∧ (fun left right => instLENat.le left right) x.2 y.2)) (((fun left right => instLENat.le left right) y.1 x.1 ∧ (fun left right => instLENat.le left right) y.2 x.2))) → False

Logical form (Lean):

```lean
theorem ProductOfLinearOrdersNeedNotBeLinear :
    ProductOrderFailsTotality
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
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
theorem ProductOfLinearOrdersNeedNotBeLinear :
    ProductOrderFailsTotality
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right) := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsDenseLinearOrder` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element), LRA.Order.DenseLinearOrder relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (x : Element), relation x x → False) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ (∀ (x y : Element), Or ((relation x y ∧ ((x = y → False) ∧ (relation y x → False)))) (Or ((x = y ∧ ((relation x y → False) ∧ (relation y x → False)))) ((relation y x ∧ ((relation x y → False) ∧ (x = y → False))))))) ∧ (∀ (x y : Element), relation x y → Exists fun z => (relation x z ∧ relation z y))) → False

Logical form (Lean):

```lean
def FailsDenseLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (DenseLinearOrder relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsDenseLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (DenseLinearOrder relation)

/--
`IntegerStrictOrderIsNotDenseLinearOrder` TODO

Predicate logic:

  LRA.Order.FailsDenseLinearOrder fun left right => Int.instLTInt.lt left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (x : Int), ¬ (fun left right => Int.instLTInt.lt left right) x x) ∧ (∀ (x y z : Int), (fun left right => Int.instLTInt.lt left right) x y → (fun left right => Int.instLTInt.lt left right) y z → (fun left right => Int.instLTInt.lt left right) x z)) ∧ (∀ (x y : Int), Or (((fun left right => Int.instLTInt.lt left right) x y ∧ (¬ x = y ∧ ¬ (fun left right => Int.instLTInt.lt left right) y x))) (Or ((x = y ∧ (¬ (fun left right => Int.instLTInt.lt left right) x y ∧ ¬ (fun left right => Int.instLTInt.lt left right) y x))) (((fun left right => Int.instLTInt.lt left right) y x ∧ (¬ (fun left right => Int.instLTInt.lt left right) x y ∧ ¬ x = y)))))) ∧ (∀ (x y : Int), Int.instLTInt.lt x y → Exists fun z => ((fun left right => Int.instLTInt.lt left right) x z ∧ (fun left right => Int.instLTInt.lt left right) z y))) → False

Logical form (Lean):

```lean
theorem IntegerStrictOrderIsNotDenseLinearOrder :
    FailsDenseLinearOrder (fun left right : Int => left < right)
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
theorem IntegerStrictOrderIsNotDenseLinearOrder :
    FailsDenseLinearOrder (fun left right : Int => left < right) := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`ReflexivityMakesRawDensityVacuous` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element), LRA.Relation.Reflexive relation → LRA.Relation.Dense relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x : Element), relation x x) → ∀ (x y : Element), relation x y → Exists fun z => (relation x z ∧ relation z y)

Logical form (Lean):

```lean
def ReflexivityMakesRawDensityVacuous
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LRA.Relation.Reflexive relation -> LRA.Relation.Dense relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ReflexivityMakesRawDensityVacuous
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LRA.Relation.Reflexive relation -> LRA.Relation.Dense relation

/--
`ReflexiveRelationIsRawDense` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Order.ReflexivityMakesRawDensityVacuous relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
  Prove
    (∀ (x : Alpha), relation x x) → ∀ (x y : Alpha), relation x y → Exists fun z => (relation x z ∧ relation z y)

Logical form (Lean):

```lean
theorem ReflexiveRelationIsRawDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha} :
    ReflexivityMakesRawDensityVacuous relation
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
theorem ReflexiveRelationIsRawDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha} :
    ReflexivityMakesRawDensityVacuous relation := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsChain` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), LRA.Order.Chain relation subset → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (first second : Element), inst.1 subset first → inst.1 subset second → Or (relation first second) (relation second first)) → False

Logical form (Lean):

```lean
def FailsChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Chain relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Chain relation subset)

section NaturalDivisibility

/--
`TwoAndThreeFailDivisibilityChain` TODO

Predicate logic:

  LRA.Order.FailsChain (fun left right => Nat.instDvd.dvd left right) (setOf fun number => Or (number = 2)(number = 3))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (first second : Nat), first ∈ fun number => Or (number = 2)(number = 3) → second ∈ fun number => Or (number = 2)(number = 3) → Or ((fun left right => Nat.instDvd.1 left right) first second) ((fun left right => Nat.instDvd.1 left right) second first)) → False

Logical form (Lean):

```lean
theorem TwoAndThreeFailDivisibilityChain :
    FailsChain (fun left right : Nat => left ∣ right)
      ({number | number = 2 \/ number = 3} : Set Nat)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem TwoAndThreeFailDivisibilityChain :
    FailsChain (fun left right : Nat => left ∣ right)
      ({number | number = 2 \/ number = 3} : Set Nat) := by
  sorry
end NaturalDivisibility

end LRA.Order

namespace LRA.Order

/--
`DirectednessFailsToImplyChain` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (LRA.Order.Directed relation subset ∧ ¬ LRA.Order.Chain relation subset)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun element => inst.1 subset element ∧ (∀ (first second : Element), inst.1 subset first → inst.1 subset second → Exists fun upper => (inst.1 subset upper ∧ (relation first upper ∧ relation second upper)))) ∧ ((∀ (first second : Element), inst.1 subset first → inst.1 subset second → Or (relation first second) (relation second first)) → False))

Logical form (Lean):

```lean
def DirectednessFailsToImplyChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Directed relation subset /\ Not (Chain relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def DirectednessFailsToImplyChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Directed relation subset /\ Not (Chain relation subset)

/--
`DirectednessFailsUnderSubset` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (ambient subset : SetObject), (LRA.Order.Directed relation ambient ∧ ((∀ (element : Element), element ∈ subset → element ∈ ambient) ∧ ¬ LRA.Order.Directed relation subset))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun element => inst.1 ambient element ∧ (∀ (first second : Element), inst.1 ambient first → inst.1 ambient second → Exists fun upper => (inst.1 ambient upper ∧ (relation first upper ∧ relation second upper)))) ∧ ((∀ (element : Element), inst.1 subset element → inst.1 ambient element) ∧ ((Exists fun element => inst.1 subset element ∧ (∀ (first second : Element), inst.1 subset first → inst.1 subset second → Exists fun upper => (inst.1 subset upper ∧ (relation first upper ∧ relation second upper)))) → False)))

Logical form (Lean):

```lean
def DirectednessFailsUnderSubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (ambient subset : SetObject) : Prop :=
  Directed relation ambient /\
    (forall element, element ∈ subset -> element ∈ ambient) /\
      Not (Directed relation subset)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def DirectednessFailsUnderSubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (ambient subset : SetObject) : Prop :=
  Directed relation ambient /\
    (forall element, element ∈ subset -> element ∈ ambient) /\
      Not (Directed relation subset)

/--
`DirectedDoesNotImplyChain` TODO

Predicate logic:

  have subset := setOf fun element => Or (element = 2)(Or (element = 3)(element = 6));LRA.Order.DirectednessFailsToImplyChain (fun left right => Nat.instDvd.dvd left right) subset

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have subset := setOf fun element => Or (element = 2)(Or (element = 3)(element = 6));LRA.Order.DirectednessFailsToImplyChain (fun left right => Nat.instDvd.dvd left right) subset

Logical form (Lean):

```lean
theorem DirectedDoesNotImplyChain :
    let subset : Set Nat := {element | element = 2 \/ element = 3 \/ element = 6}
    DirectednessFailsToImplyChain
      (fun left right : Nat => left ∣ right) subset
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem DirectedDoesNotImplyChain :
    let subset : Set Nat := {element | element = 2 \/ element = 3 \/ element = 6}
    DirectednessFailsToImplyChain
      (fun left right : Nat => left ∣ right) subset := by
  sorry
/--
`SubsetOfDirectedSetNeedNotBeDirected` TODO

Predicate logic:

  have relation := fun left right => Nat.instDvd.dvd left right; have ambient := Set.univ; have subset := setOf fun element => Or (element = 2)(element = 3);LRA.Order.DirectednessFailsUnderSubset relation ambient subset

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    have relation := fun left right => Nat.instDvd.dvd left right; have ambient := Set.univ; have subset := setOf fun element => Or (element = 2)(element = 3);LRA.Order.DirectednessFailsUnderSubset relation ambient subset

Logical form (Lean):

```lean
theorem SubsetOfDirectedSetNeedNotBeDirected :
    let relation := fun left right : Nat => left ∣ right
    let ambient : Set Nat := Set.univ
    let subset : Set Nat := {element | element = 2 \/ element = 3}
    DirectednessFailsUnderSubset relation ambient subset
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem SubsetOfDirectedSetNeedNotBeDirected :
    let relation := fun left right : Nat => left ∣ right
    let ambient : Set Nat := Set.univ
    let subset : Set Nat := {element | element = 2 \/ element = 3}
    DirectednessFailsUnderSubset relation ambient subset := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsCompleteLattice` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element), LRA.Order.CompleteLattice SetObject relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (subset : SetObject), ((Exists fun supremum => ((∀ (element : Element), inst.1 subset element → relation element supremum) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation element bound) → relation supremum bound))) ∧ (Exists fun infimum => ((∀ (element : Element), inst.1 subset element → relation infimum element) ∧ (∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)))))) → False

Logical form (Lean):

```lean
def FailsCompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (CompleteLattice SetObject relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsCompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (CompleteLattice SetObject relation)

/--
`IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice` TODO

Predicate logic:

  (LRA.Order.LeastUpperBoundProperty (Set Int) fun left right => Int.instLEInt.le left right ∧ LRA.Order.FailsCompleteLattice (Set Int) fun left right => Int.instLEInt.le left right)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (subset : Int → Prop), (Exists fun element => element) ∈ subset → (Exists fun bound => ∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) element bound) → Exists fun supremum => ((∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) element supremum) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) element bound) → (fun left right => Int.instLEInt.le left right) supremum bound))) ∧ ((((∀ (x : Int), (fun left right => Int.instLEInt.le left right) x x) ∧ ((∀ (x y : Int), Int.instLEInt.le x y → Int.instLEInt.le y x → x = y) ∧ (∀ (x y z : Int), Int.instLEInt.le x y → Int.instLEInt.le y z → (fun left right => Int.instLEInt.le left right) x z))) ∧ (∀ (subset : Int → Prop), ((Exists fun supremum => ((∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) element supremum) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) element bound) → (fun left right => Int.instLEInt.le left right) supremum bound))) ∧ (Exists fun infimum => ((∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) infimum element) ∧ (∀ (bound : Int), (∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) bound element) → (fun left right => Int.instLEInt.le left right) bound infimum)))))) → False))

Logical form (Lean):

```lean
theorem IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice :
    LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) /\
      FailsCompleteLattice (Set Int)
        (fun left right : Int => left ≤ right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice :
    LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) /\
      FailsCompleteLattice (Set Int)
        (fun left right : Int => left ≤ right) := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsDistributiveLattice` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element), (LRA.Order.Lattice relation ∧ ¬ LRA.Order.DistributiveLattice relation)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (left right : Element), ((Exists fun join => (relation left join ∧ (relation right join ∧ (∀ (upper : Element), relation left upper → relation right upper → relation join upper)))) ∧ (Exists fun meet => (relation meet left ∧ (relation meet right ∧ (∀ (lower : Element), relation lower left → relation lower right → relation lower meet))))))) ∧ (((((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (left right : Element), ((Exists fun join => (relation left join ∧ (relation right join ∧ (∀ (upper : Element), relation left upper → relation right upper → relation join upper)))) ∧ (Exists fun meet => (relation meet left ∧ (relation meet right ∧ (∀ (lower : Element), relation lower left → relation lower right → relation lower meet))))))) ∧ ((∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Element), (relation bMeetC b ∧ (relation bMeetC c ∧ (∀ (lower : Element), relation lower b → relation lower c → relation lower bMeetC))) → (relation a leftSide ∧ (relation bMeetC leftSide ∧ (∀ (upper : Element), relation a upper → relation bMeetC upper → relation leftSide upper))) → (relation a aJoinB ∧ (relation b aJoinB ∧ (∀ (upper : Element), relation a upper → relation b upper → relation aJoinB upper))) → (relation a aJoinC ∧ (relation c aJoinC ∧ (∀ (upper : Element), relation a upper → relation c upper → relation aJoinC upper))) → (relation rightSide aJoinB ∧ (relation rightSide aJoinC ∧ (∀ (lower : Element), relation lower aJoinB → relation lower aJoinC → relation lower rightSide))) → leftSide = rightSide) ∧ (∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Element), (relation b bJoinC ∧ (relation c bJoinC ∧ (∀ (upper : Element), relation b upper → relation c upper → relation bJoinC upper))) → (relation leftSide a ∧ (relation leftSide bJoinC ∧ (∀ (lower : Element), relation lower a → relation lower bJoinC → relation lower leftSide))) → (relation aMeetB a ∧ (relation aMeetB b ∧ (∀ (lower : Element), relation lower a → relation lower b → relation lower aMeetB))) → (relation aMeetC a ∧ (relation aMeetC c ∧ (∀ (lower : Element), relation lower a → relation lower c → relation lower aMeetC))) → (relation aMeetB rightSide ∧ (relation aMeetC rightSide ∧ (∀ (upper : Element), relation aMeetB upper → relation aMeetC upper → relation rightSide upper))) → leftSide = rightSide))) → False))

Logical form (Lean):

```lean
def FailsDistributiveLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Lattice relation /\ Not (DistributiveLattice relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def FailsDistributiveLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Lattice relation /\ Not (DistributiveLattice relation)

/--
`M3Relation` TODO

Predicate logic:

  ∀ (a a_1 : Fin 5), Or (a = a_1)(Or (a = 0)(a_1 = 4))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (a = a_1)(Or (a = 0)(a_1 = 4))

Logical form (Lean):

```lean
def M3Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def M3Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4

/--
`N5Relation` TODO

Predicate logic:

  ∀ (a a_1 : Fin 5), Or (a = a_1)(Or (a = 0)(Or (a_1 = 4)((a = 1 ∧ a_1 = 2))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (a = a_1)(Or (a = 0)(Or (a_1 = 4)((a = 1 ∧ a_1 = 2))))

Logical form (Lean):

```lean
def N5Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4 \/ (left = 1 /\ right = 2)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def N5Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4 \/ (left = 1 /\ right = 2)

/--
`M3IsNondistributiveLattice` TODO

Predicate logic:

  LRA.Order.FailsDistributiveLattice LRA.Order.M3Relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (x : Fin 5), Or (x = x)(Or (x = 0)(x = 4))) ∧ ((∀ (x y : Fin 5), Or (x = y)(Or (x = 0)(y = 4)) → Or (y = x)(Or (y = 0)(x = 4)) → x = y) ∧ (∀ (x y z : Fin 5), Or (x = y)(Or (x = 0)(y = 4)) → Or (y = z)(Or (y = 0)(z = 4)) → Or (x = z)(Or (x = 0)(z = 4))))) ∧ (∀ (left right : Fin 5), ((Exists fun join => (Or (left = join)(Or (left = 0)(join = 4)) ∧ (Or (right = join)(Or (right = 0)(join = 4)) ∧ (∀ (upper : Fin 5), Or (left = upper)(Or (left = 0)(upper = 4)) → Or (right = upper)(Or (right = 0)(upper = 4)) → Or (join = upper)(Or (join = 0)(upper = 4)))))) ∧ (Exists fun meet => (Or (meet = left)(Or (meet = 0)(left = 4)) ∧ (Or (meet = right)(Or (meet = 0)(right = 4)) ∧ (∀ (lower : Fin 5), Or (lower = left)(Or (lower = 0)(left = 4)) → Or (lower = right)(Or (lower = 0)(right = 4)) → Or (lower = meet)(Or (lower = 0)(meet = 4))))))))) ∧ (((((∀ (x : Fin 5), LRA.Order.M3Relation x x) ∧ ((∀ (x y : Fin 5), LRA.Order.M3Relation x y → LRA.Order.M3Relation y x → x = y) ∧ (∀ (x y z : Fin 5), LRA.Order.M3Relation x y → LRA.Order.M3Relation y z → LRA.Order.M3Relation x z))) ∧ (∀ (left right : Fin 5), ((Exists fun join => (Or (left = join)(Or (left = 0)(join = 4)) ∧ (Or (right = join)(Or (right = 0)(join = 4)) ∧ (∀ (upper : Fin 5), Or (left = upper)(Or (left = 0)(upper = 4)) → Or (right = upper)(Or (right = 0)(upper = 4)) → Or (join = upper)(Or (join = 0)(upper = 4)))))) ∧ (Exists fun meet => (Or (meet = left)(Or (meet = 0)(left = 4)) ∧ (Or (meet = right)(Or (meet = 0)(right = 4)) ∧ (∀ (lower : Fin 5), Or (lower = left)(Or (lower = 0)(left = 4)) → Or (lower = right)(Or (lower = 0)(right = 4)) → Or (lower = meet)(Or (lower = 0)(meet = 4))))))))) ∧ ((∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Fin 5), (Or (bMeetC = b)(Or (bMeetC = 0)(b = 4)) ∧ (Or (bMeetC = c)(Or (bMeetC = 0)(c = 4)) ∧ (∀ (lower : Fin 5), Or (lower = b)(Or (lower = 0)(b = 4)) → Or (lower = c)(Or (lower = 0)(c = 4)) → Or (lower = bMeetC)(Or (lower = 0)(bMeetC = 4))))) → (Or (a = leftSide)(Or (a = 0)(leftSide = 4)) ∧ (Or (bMeetC = leftSide)(Or (bMeetC = 0)(leftSide = 4)) ∧ (∀ (upper : Fin 5), Or (a = upper)(Or (a = 0)(upper = 4)) → Or (bMeetC = upper)(Or (bMeetC = 0)(upper = 4)) → Or (leftSide = upper)(Or (leftSide = 0)(upper = 4))))) → (Or (a = aJoinB)(Or (a = 0)(aJoinB = 4)) ∧ (Or (b = aJoinB)(Or (b = 0)(aJoinB = 4)) ∧ (∀ (upper : Fin 5), Or (a = upper)(Or (a = 0)(upper = 4)) → Or (b = upper)(Or (b = 0)(upper = 4)) → Or (aJoinB = upper)(Or (aJoinB = 0)(upper = 4))))) → (Or (a = aJoinC)(Or (a = 0)(aJoinC = 4)) ∧ (Or (c = aJoinC)(Or (c = 0)(aJoinC = 4)) ∧ (∀ (upper : Fin 5), Or (a = upper)(Or (a = 0)(upper = 4)) → Or (c = upper)(Or (c = 0)(upper = 4)) → Or (aJoinC = upper)(Or (aJoinC = 0)(upper = 4))))) → (Or (rightSide = aJoinB)(Or (rightSide = 0)(aJoinB = 4)) ∧ (Or (rightSide = aJoinC)(Or (rightSide = 0)(aJoinC = 4)) ∧ (∀ (lower : Fin 5), Or (lower = aJoinB)(Or (lower = 0)(aJoinB = 4)) → Or (lower = aJoinC)(Or (lower = 0)(aJoinC = 4)) → Or (lower = rightSide)(Or (lower = 0)(rightSide = 4))))) → leftSide = rightSide) ∧ (∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Fin 5), (Or (b = bJoinC)(Or (b = 0)(bJoinC = 4)) ∧ (Or (c = bJoinC)(Or (c = 0)(bJoinC = 4)) ∧ (∀ (upper : Fin 5), Or (b = upper)(Or (b = 0)(upper = 4)) → Or (c = upper)(Or (c = 0)(upper = 4)) → Or (bJoinC = upper)(Or (bJoinC = 0)(upper = 4))))) → (Or (leftSide = a)(Or (leftSide = 0)(a = 4)) ∧ (Or (leftSide = bJoinC)(Or (leftSide = 0)(bJoinC = 4)) ∧ (∀ (lower : Fin 5), Or (lower = a)(Or (lower = 0)(a = 4)) → Or (lower = bJoinC)(Or (lower = 0)(bJoinC = 4)) → Or (lower = leftSide)(Or (lower = 0)(leftSide = 4))))) → (Or (aMeetB = a)(Or (aMeetB = 0)(a = 4)) ∧ (Or (aMeetB = b)(Or (aMeetB = 0)(b = 4)) ∧ (∀ (lower : Fin 5), Or (lower = a)(Or (lower = 0)(a = 4)) → Or (lower = b)(Or (lower = 0)(b = 4)) → Or (lower = aMeetB)(Or (lower = 0)(aMeetB = 4))))) → (Or (aMeetC = a)(Or (aMeetC = 0)(a = 4)) ∧ (Or (aMeetC = c)(Or (aMeetC = 0)(c = 4)) ∧ (∀ (lower : Fin 5), Or (lower = a)(Or (lower = 0)(a = 4)) → Or (lower = c)(Or (lower = 0)(c = 4)) → Or (lower = aMeetC)(Or (lower = 0)(aMeetC = 4))))) → (Or (aMeetB = rightSide)(Or (aMeetB = 0)(rightSide = 4)) ∧ (Or (aMeetC = rightSide)(Or (aMeetC = 0)(rightSide = 4)) ∧ (∀ (upper : Fin 5), Or (aMeetB = upper)(Or (aMeetB = 0)(upper = 4)) → Or (aMeetC = upper)(Or (aMeetC = 0)(upper = 4)) → Or (rightSide = upper)(Or (rightSide = 0)(upper = 4))))) → leftSide = rightSide))) → False))

Logical form (Lean):

```lean
theorem M3IsNondistributiveLattice :
    FailsDistributiveLattice M3Relation
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
theorem M3IsNondistributiveLattice :
    FailsDistributiveLattice M3Relation := by
  sorry
/--
`N5IsNondistributiveLattice` TODO

Predicate logic:

  LRA.Order.FailsDistributiveLattice LRA.Order.N5Relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (x : Fin 5), Or (x = x)(Or (x = 0)(Or (x = 4)((x = 1 ∧ x = 2))))) ∧ ((∀ (x y : Fin 5), Or (x = y)(Or (x = 0)(Or (y = 4)((x = 1 ∧ y = 2)))) → Or (y = x)(Or (y = 0)(Or (x = 4)((y = 1 ∧ x = 2)))) → x = y) ∧ (∀ (x y z : Fin 5), Or (x = y)(Or (x = 0)(Or (y = 4)((x = 1 ∧ y = 2)))) → Or (y = z)(Or (y = 0)(Or (z = 4)((y = 1 ∧ z = 2)))) → Or (x = z)(Or (x = 0)(Or (z = 4)((x = 1 ∧ z = 2))))))) ∧ (∀ (left right : Fin 5), ((Exists fun join => ((Or (left = join)(Or (left = 0)(Or (join = 4)((left = 1 ∧ join = 2))))) ∧ ((Or (right = join)(Or (right = 0)(Or (join = 4)((right = 1 ∧ join = 2))))) ∧ (∀ (upper : Fin 5), Or (left = upper)(Or (left = 0)(Or (upper = 4)((left = 1 ∧ upper = 2)))) → Or (right = upper)(Or (right = 0)(Or (upper = 4)((right = 1 ∧ upper = 2)))) → Or (join = upper)(Or (join = 0)(Or (upper = 4)((join = 1 ∧ upper = 2)))))))) ∧ (Exists fun meet => ((Or (meet = left)(Or (meet = 0)(Or (left = 4)((meet = 1 ∧ left = 2))))) ∧ ((Or (meet = right)(Or (meet = 0)(Or (right = 4)((meet = 1 ∧ right = 2))))) ∧ (∀ (lower : Fin 5), Or (lower = left)(Or (lower = 0)(Or (left = 4)((lower = 1 ∧ left = 2)))) → Or (lower = right)(Or (lower = 0)(Or (right = 4)((lower = 1 ∧ right = 2)))) → Or (lower = meet)(Or (lower = 0)(Or (meet = 4)((lower = 1 ∧ meet = 2))))))))))) ∧ (((((∀ (x : Fin 5), LRA.Order.N5Relation x x) ∧ ((∀ (x y : Fin 5), LRA.Order.N5Relation x y → LRA.Order.N5Relation y x → x = y) ∧ (∀ (x y z : Fin 5), LRA.Order.N5Relation x y → LRA.Order.N5Relation y z → LRA.Order.N5Relation x z))) ∧ (∀ (left right : Fin 5), ((Exists fun join => ((Or (left = join)(Or (left = 0)(Or (join = 4)((left = 1 ∧ join = 2))))) ∧ ((Or (right = join)(Or (right = 0)(Or (join = 4)((right = 1 ∧ join = 2))))) ∧ (∀ (upper : Fin 5), Or (left = upper)(Or (left = 0)(Or (upper = 4)((left = 1 ∧ upper = 2)))) → Or (right = upper)(Or (right = 0)(Or (upper = 4)((right = 1 ∧ upper = 2)))) → Or (join = upper)(Or (join = 0)(Or (upper = 4)((join = 1 ∧ upper = 2)))))))) ∧ (Exists fun meet => ((Or (meet = left)(Or (meet = 0)(Or (left = 4)((meet = 1 ∧ left = 2))))) ∧ ((Or (meet = right)(Or (meet = 0)(Or (right = 4)((meet = 1 ∧ right = 2))))) ∧ (∀ (lower : Fin 5), Or (lower = left)(Or (lower = 0)(Or (left = 4)((lower = 1 ∧ left = 2)))) → Or (lower = right)(Or (lower = 0)(Or (right = 4)((lower = 1 ∧ right = 2)))) → Or (lower = meet)(Or (lower = 0)(Or (meet = 4)((lower = 1 ∧ meet = 2))))))))))) ∧ ((∀ (a b c bMeetC leftSide aJoinB aJoinC rightSide : Fin 5), ((Or (bMeetC = b)(Or (bMeetC = 0)(Or (b = 4)((bMeetC = 1 ∧ b = 2))))) ∧ ((Or (bMeetC = c)(Or (bMeetC = 0)(Or (c = 4)((bMeetC = 1 ∧ c = 2))))) ∧ (∀ (lower : Fin 5), Or (lower = b)(Or (lower = 0)(Or (b = 4)((lower = 1 ∧ b = 2)))) → Or (lower = c)(Or (lower = 0)(Or (c = 4)((lower = 1 ∧ c = 2)))) → Or (lower = bMeetC)(Or (lower = 0)(Or (bMeetC = 4)((lower = 1 ∧ bMeetC = 2))))))) → ((Or (a = leftSide)(Or (a = 0)(Or (leftSide = 4)((a = 1 ∧ leftSide = 2))))) ∧ ((Or (bMeetC = leftSide)(Or (bMeetC = 0)(Or (leftSide = 4)((bMeetC = 1 ∧ leftSide = 2))))) ∧ (∀ (upper : Fin 5), Or (a = upper)(Or (a = 0)(Or (upper = 4)((a = 1 ∧ upper = 2)))) → Or (bMeetC = upper)(Or (bMeetC = 0)(Or (upper = 4)((bMeetC = 1 ∧ upper = 2)))) → Or (leftSide = upper) (Or (leftSide = 0)(Or (upper = 4)((leftSide = 1 ∧ upper = 2))))))) → ((Or (a = aJoinB)(Or (a = 0)(Or (aJoinB = 4)((a = 1 ∧ aJoinB = 2))))) ∧ ((Or (b = aJoinB)(Or (b = 0)(Or (aJoinB = 4)((b = 1 ∧ aJoinB = 2))))) ∧ (∀ (upper : Fin 5), Or (a = upper)(Or (a = 0)(Or (upper = 4)((a = 1 ∧ upper = 2)))) → Or (b = upper)(Or (b = 0)(Or (upper = 4)((b = 1 ∧ upper = 2)))) → Or (aJoinB = upper)(Or (aJoinB = 0)(Or (upper = 4)((aJoinB = 1 ∧ upper = 2))))))) → ((Or (a = aJoinC)(Or (a = 0)(Or (aJoinC = 4)((a = 1 ∧ aJoinC = 2))))) ∧ ((Or (c = aJoinC)(Or (c = 0)(Or (aJoinC = 4)((c = 1 ∧ aJoinC = 2))))) ∧ (∀ (upper : Fin 5), Or (a = upper)(Or (a = 0)(Or (upper = 4)((a = 1 ∧ upper = 2)))) → Or (c = upper)(Or (c = 0)(Or (upper = 4)((c = 1 ∧ upper = 2)))) → Or (aJoinC = upper) (Or (aJoinC = 0)(Or (upper = 4)((aJoinC = 1 ∧ upper = 2))))))) → ((Or (rightSide = aJoinB) (Or (rightSide = 0)(Or (aJoinB = 4)((rightSide = 1 ∧ aJoinB = 2))))) ∧ ((Or (rightSide = aJoinC) (Or (rightSide = 0)(Or (aJoinC = 4)((rightSide = 1 ∧ aJoinC = 2))))) ∧ (∀ (lower : Fin 5), Or (lower = aJoinB)(Or (lower = 0)(Or (aJoinB = 4)((lower = 1 ∧ aJoinB = 2)))) → Or (lower = aJoinC)(Or (lower = 0)(Or (aJoinC = 4)((lower = 1 ∧ aJoinC = 2)))) → Or (lower = rightSide) (Or (lower = 0)(Or (rightSide = 4)((lower = 1 ∧ rightSide = 2))))))) → leftSide = rightSide) ∧ (∀ (a b c bJoinC leftSide aMeetB aMeetC rightSide : Fin 5), ((Or (b = bJoinC)(Or (b = 0)(Or (bJoinC = 4)((b = 1 ∧ bJoinC = 2))))) ∧ ((Or (c = bJoinC)(Or (c = 0)(Or (bJoinC = 4)((c = 1 ∧ bJoinC = 2))))) ∧ (∀ (upper : Fin 5), Or (b = upper)(Or (b = 0)(Or (upper = 4)((b = 1 ∧ upper = 2)))) → Or (c = upper)(Or (c = 0)(Or (upper = 4)((c = 1 ∧ upper = 2)))) → Or (bJoinC = upper)(Or (bJoinC = 0)(Or (upper = 4)((bJoinC = 1 ∧ upper = 2))))))) → ((Or (leftSide = a)(Or (leftSide = 0)(Or (a = 4)((leftSide = 1 ∧ a = 2))))) ∧ ((Or (leftSide = bJoinC)(Or (leftSide = 0)(Or (bJoinC = 4)((leftSide = 1 ∧ bJoinC = 2))))) ∧ (∀ (lower : Fin 5), Or (lower = a)(Or (lower = 0)(Or (a = 4)((lower = 1 ∧ a = 2)))) → Or (lower = bJoinC)(Or (lower = 0)(Or (bJoinC = 4)((lower = 1 ∧ bJoinC = 2)))) → Or (lower = leftSide) (Or (lower = 0)(Or (leftSide = 4)((lower = 1 ∧ leftSide = 2))))))) → ((Or (aMeetB = a)(Or (aMeetB = 0)(Or (a = 4)((aMeetB = 1 ∧ a = 2))))) ∧ ((Or (aMeetB = b)(Or (aMeetB = 0)(Or (b = 4)((aMeetB = 1 ∧ b = 2))))) ∧ (∀ (lower : Fin 5), Or (lower = a)(Or (lower = 0)(Or (a = 4)((lower = 1 ∧ a = 2)))) → Or (lower = b)(Or (lower = 0)(Or (b = 4)((lower = 1 ∧ b = 2)))) → Or (lower = aMeetB)(Or (lower = 0)(Or (aMeetB = 4)((lower = 1 ∧ aMeetB = 2))))))) → ((Or (aMeetC = a)(Or (aMeetC = 0)(Or (a = 4)((aMeetC = 1 ∧ a = 2))))) ∧ ((Or (aMeetC = c)(Or (aMeetC = 0)(Or (c = 4)((aMeetC = 1 ∧ c = 2))))) ∧ (∀ (lower : Fin 5), Or (lower = a)(Or (lower = 0)(Or (a = 4)((lower = 1 ∧ a = 2)))) → Or (lower = c)(Or (lower = 0)(Or (c = 4)((lower = 1 ∧ c = 2)))) → Or (lower = aMeetC) (Or (lower = 0)(Or (aMeetC = 4)((lower = 1 ∧ aMeetC = 2))))))) → ((Or (aMeetB = rightSide) (Or (aMeetB = 0)(Or (rightSide = 4)((aMeetB = 1 ∧ rightSide = 2))))) ∧ ((Or (aMeetC = rightSide) (Or (aMeetC = 0)(Or (rightSide = 4)((aMeetC = 1 ∧ rightSide = 2))))) ∧ (∀ (upper : Fin 5), Or (aMeetB = upper)(Or (aMeetB = 0)(Or (upper = 4)((aMeetB = 1 ∧ upper = 2)))) → Or (aMeetC = upper)(Or (aMeetC = 0)(Or (upper = 4)((aMeetC = 1 ∧ upper = 2)))) → Or (rightSide = upper) (Or (rightSide = 0)(Or (upper = 4)((rightSide = 1 ∧ upper = 2))))))) → leftSide = rightSide))) → False))

Logical form (Lean):

```lean
theorem N5IsNondistributiveLattice :
    FailsDistributiveLattice N5Relation
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
theorem N5IsNondistributiveLattice :
    FailsDistributiveLattice N5Relation := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsJoin` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element) (left right candidate : Element), LRA.Order.Join relation left right candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (relation left candidate ∧ (relation right candidate ∧ (∀ (upper : Element), relation left upper → relation right upper → relation candidate upper))) → False

Logical form (Lean):

```lean
def FailsJoin
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Join relation left right candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsJoin
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Join relation left right candidate)

section NaturalNumbers

/--
`TwoFailsJoinOfTwoAndThree` TODO

Predicate logic:

  LRA.Order.FailsJoin (fun left right => instLENat.le left right) 2 3 2

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((fun left right => instLENat.le left right) 2 2 ∧ ((fun left right => instLENat.le left right) 3 2 ∧ (∀ (upper : Nat), instLENat.le 2 upper → instLENat.le 3 upper → (fun left right => instLENat.le left right) 2 upper))) → False

Logical form (Lean):

```lean
theorem TwoFailsJoinOfTwoAndThree :
    FailsJoin (fun left right : Nat => left ≤ right) 2 3 2
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
theorem TwoFailsJoinOfTwoAndThree :
    FailsJoin (fun left right : Nat => left ≤ right) 2 3 2 := by
  sorry
end NaturalNumbers

end LRA.Order

namespace LRA.Order

/--
`FailsJoinSemilattice` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element), LRA.Order.JoinSemilattice relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (left right : Element), Exists fun join => (relation left join ∧ (relation right join ∧ (∀ (upper : Element), relation left upper → relation right upper → relation join upper))))) → False

Logical form (Lean):

```lean
def FailsJoinSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (JoinSemilattice relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsJoinSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (JoinSemilattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsJoinSemilattice` TODO

Predicate logic:

  LRA.Order.FailsJoinSemilattice fun left right => left = right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Bool), (fun left right => left = right)x x) ∧ ((∀ (x y : Bool), x = y → y = x → x = y) ∧ (∀ (x y z : Bool), x = y → y = z → (fun left right => left = right)x z))) ∧ (∀ (left right : Bool), Exists fun join => ((fun left right => left = right)left join ∧ ((fun left right => left = right)right join ∧ (∀ (upper : Bool), left = upper → right = upper → (fun left right => left = right)join upper))))) → False

Logical form (Lean):

```lean
theorem BooleanEqualityFailsJoinSemilattice :
    FailsJoinSemilattice (fun left right : Bool => left = right)
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
theorem BooleanEqualityFailsJoinSemilattice :
    FailsJoinSemilattice (fun left right : Bool => left = right) := by
  sorry
end BooleanAntichain

end LRA.Order

namespace LRA.Order

/--
`FailsLattice` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element), LRA.Order.Lattice relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (left right : Element), ((Exists fun join => (relation left join ∧ (relation right join ∧ (∀ (upper : Element), relation left upper → relation right upper → relation join upper)))) ∧ (Exists fun meet => (relation meet left ∧ (relation meet right ∧ (∀ (lower : Element), relation lower left → relation lower right → relation lower meet))))))) → False

Logical form (Lean):

```lean
def FailsLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (Lattice relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (Lattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsLattice` TODO

Predicate logic:

  LRA.Order.FailsLattice fun left right => left = right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Bool), (fun left right => left = right)x x) ∧ ((∀ (x y : Bool), x = y → y = x → x = y) ∧ (∀ (x y z : Bool), x = y → y = z → (fun left right => left = right)x z))) ∧ (∀ (left right : Bool), ((Exists fun join => ((fun left right => left = right)left join ∧ ((fun left right => left = right)right join ∧ (∀ (upper : Bool), left = upper → right = upper → (fun left right => left = right)join upper)))) ∧ (Exists fun meet => ((fun left right => left = right)meet left ∧ ((fun left right => left = right)meet right ∧ (∀ (lower : Bool), lower = left → lower = right → (fun left right => left = right)lower meet))))))) → False

Logical form (Lean):

```lean
theorem BooleanEqualityFailsLattice :
    FailsLattice (fun left right : Bool => left = right)
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
theorem BooleanEqualityFailsLattice :
    FailsLattice (fun left right : Bool => left = right) := by
  sorry
end BooleanAntichain

end LRA.Order

namespace LRA.Order

/--
`FailsMeet` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element) (left right candidate : Element), LRA.Order.Meet relation left right candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (relation candidate left ∧ (relation candidate right ∧ (∀ (lower : Element), relation lower left → relation lower right → relation lower candidate))) → False

Logical form (Lean):

```lean
def FailsMeet
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Meet relation left right candidate)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsMeet
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Meet relation left right candidate)

section NaturalNumbers

/--
`ThreeFailsMeetOfTwoAndThree` TODO

Predicate logic:

  LRA.Order.FailsMeet (fun left right => instLENat.le left right) 2 3 3

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((fun left right => instLENat.le left right) 3 2 ∧ ((fun left right => instLENat.le left right) 3 3 ∧ (∀ (lower : Nat), instLENat.le lower 2 → instLENat.le lower 3 → (fun left right => instLENat.le left right) lower 3))) → False

Logical form (Lean):

```lean
theorem ThreeFailsMeetOfTwoAndThree :
    FailsMeet (fun left right : Nat => left ≤ right) 2 3 3
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
theorem ThreeFailsMeetOfTwoAndThree :
    FailsMeet (fun left right : Nat => left ≤ right) 2 3 3 := by
  sorry
end NaturalNumbers

end LRA.Order

namespace LRA.Order

/--
`FailsMeetSemilattice` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element), LRA.Order.MeetSemilattice relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (left right : Element), Exists fun meet => (relation meet left ∧ (relation meet right ∧ (∀ (lower : Element), relation lower left → relation lower right → relation lower meet))))) → False

Logical form (Lean):

```lean
def FailsMeetSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (MeetSemilattice relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsMeetSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (MeetSemilattice relation)

section BooleanAntichain

/--
`BooleanEqualityFailsMeetSemilattice` TODO

Predicate logic:

  LRA.Order.FailsMeetSemilattice fun left right => left = right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Bool), (fun left right => left = right)x x) ∧ ((∀ (x y : Bool), x = y → y = x → x = y) ∧ (∀ (x y z : Bool), x = y → y = z → (fun left right => left = right)x z))) ∧ (∀ (left right : Bool), Exists fun meet => ((fun left right => left = right)meet left ∧ ((fun left right => left = right)meet right ∧ (∀ (lower : Bool), lower = left → lower = right → (fun left right => left = right)lower meet))))) → False

Logical form (Lean):

```lean
theorem BooleanEqualityFailsMeetSemilattice :
    FailsMeetSemilattice (fun left right : Bool => left = right)
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
theorem BooleanEqualityFailsMeetSemilattice :
    FailsMeetSemilattice (fun left right : Bool => left = right) := by
  sorry
end BooleanAntichain

end LRA.Order

namespace LRA.Order

/--
`FailsLeftTranslationPreservesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Order.LeftTranslationPreservesRelation relation operation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right)) → False

Logical form (Lean):

```lean
def FailsLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (LeftTranslationPreservesRelation relation operation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FailsLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (LeftTranslationPreservesRelation relation operation)

/--
`FailsRightTranslationPreservesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Order.RightTranslationPreservesRelation relation operation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed)) → False

Logical form (Lean):

```lean
def FailsRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (RightTranslationPreservesRelation relation operation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FailsRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (RightTranslationPreservesRelation relation operation)

/--
`NaturalSubtractionForOrderCompatibilityFailure` TODO

Predicate logic:

  def NaturalSubtractionForOrderCompatibilityFailure :
      LRA.Operation.BinaryEndoOperation Nat :=
    fun left right => left - right

Predicate logic (unfolded):

  def NaturalSubtractionForOrderCompatibilityFailure :
      LRA.Operation.BinaryEndoOperation Nat :=
    fun left right => left - right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalSubtractionForOrderCompatibilityFailure :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def NaturalSubtractionForOrderCompatibilityFailure :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

/--
`NaturalSubtractionFailsLeftTranslationPreservesLessEqual` TODO

Predicate logic:

  LRA.Order.FailsLeftTranslationPreservesRelation (fun left right => instLENat.le left right) LRA.Order.NaturalSubtractionForOrderCompatibilityFailure

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (fixed left right : Nat), instLENat.le left right → (fun left right => instLENat.le left right) ({ hSub := fun a b => instSubNat.sub a b }.hSub fixed left) ({ hSub := fun a b => instSubNat.sub a b }.hSub fixed right)) → False

Logical form (Lean):

```lean
theorem NaturalSubtractionFailsLeftTranslationPreservesLessEqual :
    FailsLeftTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityFailure
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
theorem NaturalSubtractionFailsLeftTranslationPreservesLessEqual :
    FailsLeftTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityFailure := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsAntitone` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target) (map : Source → Target), LRA.Order.Antitone sourceRelation targetRelation map → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right : Source), sourceRelation left right → targetRelation (map right) (map left)) → False

Logical form (Lean):

```lean
def FailsAntitone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Antitone sourceRelation targetRelation map)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FailsAntitone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Antitone sourceRelation targetRelation map)

section NaturalNumbers

/--
`NaturalIdentityFailsAntitone` TODO

Predicate logic:

  LRA.Order.FailsAntitone (fun left right => instLENat.le left right) (fun left right => instLENat.le left right) fun value => value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right : Nat), instLENat.le left right → instLENat.le ((fun value => value) right) ((fun value => value) left)) → False

Logical form (Lean):

```lean
theorem NaturalIdentityFailsAntitone :
    FailsAntitone
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      (fun value => value)
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
theorem NaturalIdentityFailsAntitone :
    FailsAntitone
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      (fun value => value) := by
  sorry
end NaturalNumbers

end LRA.Order

namespace LRA.Order

/--
`FailsMonotone` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target) (map : Source → Target), LRA.Order.Monotone sourceRelation targetRelation map → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right : Source), sourceRelation left right → targetRelation (map left) (map right)) → False

Logical form (Lean):

```lean
def FailsMonotone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Monotone sourceRelation targetRelation map)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FailsMonotone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Monotone sourceRelation targetRelation map)

section Integers

/--
`IntegerNegationFailsMonotone` TODO

Predicate logic:

  LRA.Order.FailsMonotone (fun left right => Int.instLEInt.le left right) (fun left right => Int.instLEInt.le left right) fun value => Int.instNegInt.neg value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right : Int), Int.instLEInt.le left right → (fun left right => Int.instLEInt.le left right) ((fun value => Int.instNegInt.neg value) left) ((fun value => Int.instNegInt.neg value) right)) → False

Logical form (Lean):

```lean
theorem IntegerNegationFailsMonotone :
    FailsMonotone
      (fun left right : Int => left ≤ right)
      (fun left right : Int => left ≤ right)
      (fun value => -value)
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
theorem IntegerNegationFailsMonotone :
    FailsMonotone
      (fun left right : Int => left ≤ right)
      (fun left right : Int => left ≤ right)
      (fun value => -value) := by
  sorry
end Integers

end LRA.Order

namespace LRA.Order

/--
`FailsOrderEmbedding` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target) (map : Source → Target), LRA.Order.OrderEmbedding sourceRelation targetRelation map → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (left right : Source), sourceRelation left right → targetRelation (map left) (map right)) ∧ (∀ (left right : Source), targetRelation (map left) (map right) → sourceRelation left right)) → False

Logical form (Lean):

```lean
def FailsOrderEmbedding
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (OrderEmbedding sourceRelation targetRelation map)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FailsOrderEmbedding
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (OrderEmbedding sourceRelation targetRelation map)

/--
`BooleanChainRelation` TODO

Predicate logic:

  ∀ (a a_1 : Bool), Or (a = Bool.false)(a_1 = Bool.true)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (a = Bool.false)(a_1 = Bool.true)

Logical form (Lean):

```lean
def BooleanChainRelation : LRA.Relation.Endorelation Bool :=
  fun left right => left = false \/ right = true
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def BooleanChainRelation : LRA.Relation.Endorelation Bool :=
  fun left right => left = false \/ right = true

/--
`MonotoneBijectionNeedNotHaveMonotoneInverse` TODO

Predicate logic:

  (LRA.Function.Bijective fun value => value ∧ (LRA.Order.Monotone (fun left right => left = right)LRA.Order.BooleanChainRelation fun value => value ∧ (¬ LRA.Order.Monotone LRA.Order.BooleanChainRelation (fun left right => left = right)fun value => value ∧ LRA.Order.FailsOrderEmbedding (fun left right => left = right)LRA.Order.BooleanChainRelation fun value => value)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (y x₁ x₂ : Bool), (fun value => value) x₁ = y → (fun value => value) x₂ = y → x₁ = x₂) ∧ (∀ (y : Bool), Exists fun x => (fun value => value) x = y)) ∧ ((∀ (left right : Bool), left = right → Or ((fun value => value) left = Bool.false)((fun value => value) right = Bool.true)) ∧ (((∀ (left right : Bool), Or (left = Bool.false)(right = Bool.true) → (fun left right => left = right)((fun value => value) left) ((fun value => value) right)) → False) ∧ (((∀ (left right : Bool), left = right → Or ((fun value => value) left = Bool.false)((fun value => value) right = Bool.true)) ∧ (∀ (left right : Bool), Or ((fun value => value) left = Bool.false)((fun value => value) right = Bool.true) → (fun left right => left = right)left right)) → False))))

Logical form (Lean):

```lean
theorem MonotoneBijectionNeedNotHaveMonotoneInverse :
    Function.Bijective (fun value : Bool => value) /\
      Monotone (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) /\
      Not (Monotone BooleanChainRelation
        (fun left right : Bool => left = right) (fun value => value)) /\
      FailsOrderEmbedding
        (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem MonotoneBijectionNeedNotHaveMonotoneInverse :
    Function.Bijective (fun value : Bool => value) /\
      Monotone (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) /\
      Not (Monotone BooleanChainRelation
        (fun left right : Bool => left = right) (fun value => value)) /\
      FailsOrderEmbedding
        (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) := by
  sorry
end LRA.Order

namespace LRA.Order

/--
`FailsOrderIsomorphism` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target) (forward : Source → Target) (inverse : Target → Source), LRA.Order.OrderIsomorphism sourceRelation targetRelation forward inverse → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (source : Source), inverse (forward source) = source) ∧ ((∀ (target : Target), forward (inverse target) = target) ∧ ((∀ (left right : Source), sourceRelation left right → targetRelation (forward left) (forward right)) ∧ (∀ (left right : Source), targetRelation (forward left) (forward right) → sourceRelation left right)))) → False

Logical form (Lean):

```lean
def FailsOrderIsomorphism
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (forward : Source -> Target) (inverse : Target -> Source) : Prop :=
  Not (OrderIsomorphism sourceRelation targetRelation forward inverse)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FailsOrderIsomorphism
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (forward : Source -> Target) (inverse : Target -> Source) : Prop :=
  Not (OrderIsomorphism sourceRelation targetRelation forward inverse)

section Booleans

/--
`BooleanConstantMapsFailOrderIsomorphism` TODO

Predicate logic:

  LRA.Order.FailsOrderIsomorphism (fun left right => Or (left = Bool.false)(right = Bool.true)) (fun left right => Or (left = Bool.false)(right = Bool.true))(fun x => Bool.false) fun x => Bool.false

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (source : Bool), (fun x => Bool.false) ((fun x => Bool.false) source) = source) ∧ ((∀ (target : Bool), (fun x => Bool.false) ((fun x => Bool.false) target) = target) ∧ ((∀ (left right : Bool), (fun left right => Or (left = Bool.false)(right = Bool.true))left right → (fun left right => Or (left = Bool.false)(right = Bool.true))((fun x => Bool.false) left) ((fun x => Bool.false) right)) ∧ (∀ (left right : Bool), (fun left right => Or (left = Bool.false)(right = Bool.true))((fun x => Bool.false) left) ((fun x => Bool.false) right) → (fun left right => Or (left = Bool.false)(right = Bool.true))left right)))) → False

Logical form (Lean):

```lean
theorem BooleanConstantMapsFailOrderIsomorphism :
    FailsOrderIsomorphism
      (fun left right : Bool => left = false \/ right = true)
      (fun left right : Bool => left = false \/ right = true)
      (fun _ => false) (fun _ => false)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem BooleanConstantMapsFailOrderIsomorphism :
    FailsOrderIsomorphism
      (fun left right : Bool => left = false \/ right = true)
      (fun left right : Bool => left = false \/ right = true)
      (fun _ => false) (fun _ => false) := by
  sorry
end Booleans

end LRA.Order

namespace LRA.Order.OrderedSets.LinearOrder

/--
`FailsTotality` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Relation.Endorelation Carrier), LRA.Relation.Total relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x y : Carrier), Or (relation x y) (relation y x)) → False

Logical form (Lean):

```lean
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier) : Prop :=
  Not (LRA.Relation.Total relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier) : Prop :=
  Not (LRA.Relation.Total relation)

/--
`BooleanEqualityPartialOrderFailsTotality` TODO

Predicate logic:

  LRA.Order.OrderedSets.LinearOrder.FailsTotality LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x y : Bool), Or (LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.1 x y) (LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.1 y x)) → False

Logical form (Lean):

```lean
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation
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
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation := by
  sorry
/--
`NaturalDivisibilityIsNotLinearOrder` TODO

Predicate logic:

  LRA.Order.OrderedSets.LinearOrder.FailsTotality fun left right => Nat.instDvd.dvd left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x y : Nat), Or ((fun left right => Nat.instDvd.1 left right) x y) ((fun left right => Nat.instDvd.1 left right) y x)) → False

Logical form (Lean):

```lean
theorem NaturalDivisibilityIsNotLinearOrder :
    FailsTotality (fun left right : Nat => left ∣ right)
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
theorem NaturalDivisibilityIsNotLinearOrder :
    FailsTotality (fun left right : Nat => left ∣ right) := by
  sorry
end LRA.Order.OrderedSets.LinearOrder

namespace LRA.Order.OrderedSets.Preorder

/--
`FailsPreorder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Order.OrderedSets.OrderRelation Carrier), LRA.Order.Preorder relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Carrier), relation x x) ∧ (∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → False

Logical form (Lean):

```lean
def FailsPreorder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.Preorder relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsPreorder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.Preorder relation)

/--
`StrictPartConstructionsFailToAgree` TODO

Predicate logic:

  ∀ {Carrier : Type u} (preorder : LRA.Order.OrderedSets.Preorder.PreorderRelation Carrier), LRA.Order.StrictPart preorder.relation = LRA.Order.OrderedSets.Preorder.StrictPartByNotConverse preorder → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (fun left right => (preorder.1 left right ∧ (left = right → False)) = funleft right => (preorder.1 left right ∧ (preorder.1 right left → False))) → False

Logical form (Lean):

```lean
def StrictPartConstructionsFailToAgree
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Prop :=
  LRA.Order.StrictPart preorder.relation ≠
    StrictPartByNotConverse preorder
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def StrictPartConstructionsFailToAgree
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Prop :=
  LRA.Order.StrictPart preorder.relation ≠
    StrictPartByNotConverse preorder

/--
`ImmediateSuccessorOrEqualRelation` TODO

Predicate logic:

  ∀ (a a_1 : Nat), Or (a = a_1)(a_1 = instHAdd.hAdd a 1)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (a = a_1)(a_1 = { hAdd := fun a b => instAddNat.add a b }.hAdd a 1)

Logical form (Lean):

```lean
def ImmediateSuccessorOrEqualRelation :
    LRA.Relation.Endorelation Nat :=
  fun left right => left = right \/ right = left + 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def ImmediateSuccessorOrEqualRelation :
    LRA.Relation.Endorelation Nat :=
  fun left right => left = right \/ right = left + 1

/--
`ImmediateSuccessorOrEqualFailsPreorder` TODO

Predicate logic:

  (LRA.Relation.Reflexive LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation ∧ (¬ LRA.Relation.Transitive LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation ∧ LRA.Order.OrderedSets.Preorder.FailsPreorder LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), Or (x = x)(x = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)) ∧ (((∀ (x y z : Nat), Or (x = y)(y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1) → Or (y = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1) → Or (x = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)) → False) ∧ (((∀ (x : Nat), Or (x = x)(x = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)) ∧ (∀ (x y z : Nat), Or (x = y)(y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1) → Or (y = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1) → Or (x = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1))) → False)))

Logical form (Lean):

```lean
theorem ImmediateSuccessorOrEqualFailsPreorder :
    LRA.Relation.Reflexive ImmediateSuccessorOrEqualRelation /\
      Not (LRA.Relation.Transitive
        ImmediateSuccessorOrEqualRelation) /\
      FailsPreorder ImmediateSuccessorOrEqualRelation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ImmediateSuccessorOrEqualFailsPreorder :
    LRA.Relation.Reflexive ImmediateSuccessorOrEqualRelation /\
      Not (LRA.Relation.Transitive
        ImmediateSuccessorOrEqualRelation) /\
      FailsPreorder ImmediateSuccessorOrEqualRelation := by
  sorry
/--
`NatStrictOrderFailsPreorder` TODO

Predicate logic:

  (LRA.Relation.Transitive fun left right => instLTNat.lt left right ∧ (¬ LRA.Relation.Reflexive fun left right => instLTNat.lt left right ∧ LRA.Order.OrderedSets.Preorder.FailsPreorder fun left right => instLTNat.lt left right))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x y z : Nat), instLTNat.lt x y → instLTNat.lt y z → (fun left right => instLTNat.lt left right) x z) ∧ (((∀ (x : Nat), (fun left right => instLTNat.lt left right) x x) → False) ∧ (((∀ (x : Nat), (fun left right => instLTNat.lt left right) x x) ∧ (∀ (x y z : Nat), instLTNat.lt x y → instLTNat.lt y z → (fun left right => instLTNat.lt left right) x z)) → False)))

Logical form (Lean):

```lean
theorem NatStrictOrderFailsPreorder :
    LRA.Relation.Transitive (fun left right : Nat => left < right) /\
      Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      FailsPreorder (fun left right : Nat => left < right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem NatStrictOrderFailsPreorder :
    LRA.Relation.Transitive (fun left right : Nat => left < right) /\
      Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      FailsPreorder (fun left right : Nat => left < right) := by
  sorry
/--
`StrictPartConstructionsDifferOnUniversalPreorder` TODO

Predicate logic:

  LRA.Order.OrderedSets.Preorder.StrictPartConstructionsFailToAgree LRA.Order.OrderedSets.Preorder.BooleanUniversalPreorder

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (fun left right => (LRA.Order.OrderedSets.Preorder.BooleanUniversalPreorder.1 left right ∧ (left = right → False)) = funleft right => (LRA.Order.OrderedSets.Preorder.BooleanUniversalPreorder.1 left right ∧ (LRA.Order.OrderedSets.Preorder.BooleanUniversalPreorder.1 right left → False))) → False

Logical form (Lean):

```lean
theorem StrictPartConstructionsDifferOnUniversalPreorder :
    StrictPartConstructionsFailToAgree BooleanUniversalPreorder
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
theorem StrictPartConstructionsDifferOnUniversalPreorder :
    StrictPartConstructionsFailToAgree BooleanUniversalPreorder := by
  sorry
end LRA.Order.OrderedSets.Preorder

namespace LRA.Order.OrderedSets.PartialOrder

/--
`FailsNonStrictPartialOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Order.OrderedSets.OrderRelation Carrier), LRA.Order.PartialOrder relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Carrier), relation x x) ∧ ((∀ (x y : Carrier), relation x y → relation y x → x = y) ∧ (∀ (x y z : Carrier), relation x y → relation y z → relation x z))) → False

Logical form (Lean):

```lean
def FailsNonStrictPartialOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.PartialOrder relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsNonStrictPartialOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.PartialOrder relation)

/--
`FailsTransitivity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Order.OrderedSets.OrderRelation Carrier), LRA.Relation.Transitive relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (x y z : Carrier), relation x y → relation y z → relation x z) → False

Logical form (Lean):

```lean
def FailsTransitivity
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Relation.Transitive relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsTransitivity
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Relation.Transitive relation)

/--
`ImmediateSuccessorOrEqualFailsTransitivity` TODO

Predicate logic:

  (LRA.Relation.Reflexive LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation ∧ (LRA.Relation.Antisymmetric LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation ∧ (LRA.Order.OrderedSets.PartialOrder.FailsTransitivity LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation ∧ LRA.Order.OrderedSets.PartialOrder.FailsNonStrictPartialOrder LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), Or (x = x)(x = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)) ∧ ((∀ (x y : Nat), Or (x = y)(y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1) → Or (y = x)(x = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1) → x = y) ∧ (((∀ (x y z : Nat), Or (x = y)(y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1) → Or (y = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1) → Or (x = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)) → False) ∧ (((∀ (x : Nat), Or (x = x)(x = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)) ∧ ((∀ (x y : Nat), Or (x = y)(y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1) → Or (y = x)(x = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1) → x = y) ∧ (∀ (x y z : Nat), Or (x = y)(y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1) → Or (y = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1) → Or (x = z)(z = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)))) → False))))

Logical form (Lean):

```lean
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    LRA.Relation.Reflexive
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      LRA.Relation.Antisymmetric
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsTransitivity
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsNonStrictPartialOrder
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    LRA.Relation.Reflexive
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      LRA.Relation.Antisymmetric
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsTransitivity
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsNonStrictPartialOrder
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation := by
  sorry
/--
`NatStrictOrderFailsNonStrictPartialOrder` TODO

Predicate logic:

  (¬ LRA.Relation.Reflexive fun left right => instLTNat.lt left right ∧ (LRA.Relation.Antisymmetric fun left right => instLTNat.lt left right ∧ (LRA.Relation.Transitive fun left right => instLTNat.lt left right ∧ LRA.Order.OrderedSets.PartialOrder.FailsNonStrictPartialOrder fun left right => instLTNat.lt left right)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Nat), (fun left right => instLTNat.lt left right) x x) → False) ∧ ((∀ (x y : Nat), instLTNat.lt x y → instLTNat.lt y x → x = y) ∧ ((∀ (x y z : Nat), instLTNat.lt x y → instLTNat.lt y z → (fun left right => instLTNat.lt left right) x z) ∧ (((∀ (x : Nat), (fun left right => instLTNat.lt left right) x x) ∧ ((∀ (x y : Nat), instLTNat.lt x y → instLTNat.lt y x → x = y) ∧ (∀ (x y z : Nat), instLTNat.lt x y → instLTNat.lt y z → (fun left right => instLTNat.lt left right) x z))) → False))))

Logical form (Lean):

```lean
theorem NatStrictOrderFailsNonStrictPartialOrder :
    Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      LRA.Relation.Antisymmetric
        (fun left right : Nat => left < right) /\
      LRA.Relation.Transitive
        (fun left right : Nat => left < right) /\
      FailsNonStrictPartialOrder (fun left right : Nat => left < right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem NatStrictOrderFailsNonStrictPartialOrder :
    Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      LRA.Relation.Antisymmetric
        (fun left right : Nat => left < right) /\
      LRA.Relation.Transitive
        (fun left right : Nat => left < right) /\
      FailsNonStrictPartialOrder (fun left right : Nat => left < right) := by
  sorry
/--
`BooleanUniversalRelationFailsNonStrictPartialOrder` TODO

Predicate logic:

  (LRA.Relation.Reflexive fun x x_1 => True ∧ (¬ LRA.Relation.Antisymmetric fun x x_1 => True ∧ (LRA.Relation.Transitive fun x x_1 => True ∧ LRA.Order.OrderedSets.PartialOrder.FailsNonStrictPartialOrder fun x x_1 => True)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Bool), (fun x x_1 => True) x x) ∧ (((∀ (x y : Bool), True → True → x = y) → False) ∧ ((∀ (x y z : Bool), True → True → (fun x x_1 => True) x z) ∧ (((∀ (x : Bool), (fun x x_1 => True) x x) ∧ ((∀ (x y : Bool), True → True → x = y) ∧ (∀ (x y z : Bool), True → True → (fun x x_1 => True) x z))) → False))))

Logical form (Lean):

```lean
theorem BooleanUniversalRelationFailsNonStrictPartialOrder :
    LRA.Relation.Reflexive (fun _ _ : Bool => True) /\
      Not (LRA.Relation.Antisymmetric
        (fun _ _ : Bool => True)) /\
      LRA.Relation.Transitive (fun _ _ : Bool => True) /\
      FailsNonStrictPartialOrder (fun _ _ : Bool => True)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem BooleanUniversalRelationFailsNonStrictPartialOrder :
    LRA.Relation.Reflexive (fun _ _ : Bool => True) /\
      Not (LRA.Relation.Antisymmetric
        (fun _ _ : Bool => True)) /\
      LRA.Relation.Transitive (fun _ _ : Bool => True) /\
      FailsNonStrictPartialOrder (fun _ _ : Bool => True) := by
  sorry
/--
`IntegerDivisibilityIsPreorderButNotPartialOrder` TODO

Predicate logic:

  (LRA.Order.Preorder fun left right => Int.instDvd.dvd left right ∧ LRA.Order.OrderedSets.PartialOrder.FailsNonStrictPartialOrder fun left right => Int.instDvd.dvd left right)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Int), (fun left right => Int.instDvd.1 left right) x x) ∧ (∀ (x y z : Int), Int.instDvd.1 x y → Int.instDvd.1 y z → (fun left right => Int.instDvd.1 left right) x z)) ∧ (((∀ (x : Int), (fun left right => Int.instDvd.1 left right) x x) ∧ ((∀ (x y : Int), Int.instDvd.1 x y → Int.instDvd.1 y x → x = y) ∧ (∀ (x y z : Int), Int.instDvd.1 x y → Int.instDvd.1 y z → (fun left right => Int.instDvd.1 left right) x z))) → False))

Logical form (Lean):

```lean
theorem IntegerDivisibilityIsPreorderButNotPartialOrder :
    LRA.Order.Preorder (fun left right : Int => left ∣ right) /\
      FailsNonStrictPartialOrder
        (fun left right : Int => left ∣ right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem IntegerDivisibilityIsPreorderButNotPartialOrder :
    LRA.Order.Preorder (fun left right : Int => left ∣ right) /\
      FailsNonStrictPartialOrder
        (fun left right : Int => left ∣ right) := by
  sorry
end LRA.Order.OrderedSets.PartialOrder

namespace LRA.Order.OrderedSets.Poset

/--
`FailsPosetLaws` TODO

Predicate logic:

  ∀ {alpha : Type u} (relation : LRA.Relation.Endorelation alpha), LRA.Order.PartialOrder relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : alpha), relation x x) ∧ ((∀ (x y : alpha), relation x y → relation y x → x = y) ∧ (∀ (x y z : alpha), relation x y → relation y z → relation x z))) → False

Logical form (Lean):

```lean
def FailsPosetLaws {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  Not (LRA.Order.PartialOrder relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsPosetLaws {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  Not (LRA.Order.PartialOrder relation)

/--
`NatStrictOrderFailsPosetLaws` TODO

Predicate logic:

  LRA.Order.OrderedSets.Poset.FailsPosetLaws fun left right => instLTNat.lt left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), (fun left right => instLTNat.lt left right) x x) ∧ ((∀ (x y : Nat), instLTNat.lt x y → instLTNat.lt y x → x = y) ∧ (∀ (x y z : Nat), instLTNat.lt x y → instLTNat.lt y z → (fun left right => instLTNat.lt left right) x z))) → False

Logical form (Lean):

```lean
theorem NatStrictOrderFailsPosetLaws :
    FailsPosetLaws (fun left right : Nat => left < right)
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
theorem NatStrictOrderFailsPosetLaws :
    FailsPosetLaws (fun left right : Nat => left < right) := by
  sorry
end LRA.Order.OrderedSets.Poset

namespace LRA.Order

/--
`FailsStrictLinearOrder` TODO

Predicate logic:

  ∀ {Element : Type u} (relation : LRA.Relation.Endorelation Element), LRA.Order.StrictLinearOrder relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Element), relation x x → False) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z)) ∧ (∀ (x y : Element), Or ((relation x y ∧ ((x = y → False) ∧ (relation y x → False)))) (Or ((x = y ∧ ((relation x y → False) ∧ (relation y x → False)))) ((relation y x ∧ ((relation x y → False) ∧ (x = y → False))))))) → False

Logical form (Lean):

```lean
def FailsStrictLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (StrictLinearOrder relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsStrictLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (StrictLinearOrder relation)

section Booleans

/--
`BooleanEqualityFailsStrictLinearOrder` TODO

Predicate logic:

  LRA.Order.FailsStrictLinearOrder fun left right => left = right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Bool), (fun left right => left = right)x x → False) ∧ (∀ (x y z : Bool), x = y → y = z → (fun left right => left = right)x z)) ∧ (∀ (x y : Bool), Or (((fun left right => left = right)x y ∧ ((x = y → False) ∧ ((fun left right => left = right)y x → False)))) (Or ((x = y ∧ (((fun left right => left = right)x y → False) ∧ ((fun left right => left = right)y x → False)))) (((fun left right => left = right)y x ∧ (((fun left right => left = right)x y → False) ∧ (x = y → False))))))) → False

Logical form (Lean):

```lean
theorem BooleanEqualityFailsStrictLinearOrder :
    FailsStrictLinearOrder (fun left right : Bool => left = right)
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
theorem BooleanEqualityFailsStrictLinearOrder :
    FailsStrictLinearOrder (fun left right : Bool => left = right) := by
  sorry
end Booleans

end LRA.Order

namespace LRA.Order.OrderedSets.StrictOrder

/--
`FailsStrictOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : LRA.Order.OrderedSets.OrderRelation Carrier), LRA.Order.StrictOrder relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Carrier), relation x x → False) ∧ (∀ (x y z : Carrier), relation x y → relation y z → relation x z)) → False

Logical form (Lean):

```lean
def FailsStrictOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.StrictOrder relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsStrictOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.StrictOrder relation)

/--
`NatNonStrictOrderFailsStrictOrder` TODO

Predicate logic:

  (LRA.Relation.Transitive fun left right => instLENat.le left right ∧ (¬ LRA.Relation.Irreflexive fun left right => instLENat.le left right ∧ LRA.Order.OrderedSets.StrictOrder.FailsStrictOrder fun left right => instLENat.le left right))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x y z : Nat), instLENat.le x y → instLENat.le y z → (fun left right => instLENat.le left right) x z) ∧ (((∀ (x : Nat), instLENat.le x x → False) → False) ∧ (((∀ (x : Nat), instLENat.le x x → False) ∧ (∀ (x y z : Nat), instLENat.le x y → instLENat.le y z → (fun left right => instLENat.le left right) x z)) → False)))

Logical form (Lean):

```lean
theorem NatNonStrictOrderFailsStrictOrder :
    LRA.Relation.Transitive (fun left right : Nat => left <= right) /\
      Not (LRA.Relation.Irreflexive
        (fun left right : Nat => left <= right)) /\
      FailsStrictOrder (fun left right : Nat => left <= right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem NatNonStrictOrderFailsStrictOrder :
    LRA.Relation.Transitive (fun left right : Nat => left <= right) /\
      Not (LRA.Relation.Irreflexive
        (fun left right : Nat => left <= right)) /\
      FailsStrictOrder (fun left right : Nat => left <= right) := by
  sorry
/--
`ImmediateSuccessorRelation` TODO

Predicate logic:

  ∀ (a a_1 : Nat), a_1 = instHAdd.hAdd a 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a_1 = { hAdd := fun a b => instAddNat.add a b }.hAdd a 1

Logical form (Lean):

```lean
def ImmediateSuccessorRelation : LRA.Relation.Endorelation Nat :=
  fun left right => right = left + 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ImmediateSuccessorRelation : LRA.Relation.Endorelation Nat :=
  fun left right => right = left + 1

/--
`ImmediateSuccessorFailsStrictOrder` TODO

Predicate logic:

  (LRA.Relation.Irreflexive LRA.Order.OrderedSets.StrictOrder.ImmediateSuccessorRelation ∧ (¬ LRA.Relation.Transitive LRA.Order.OrderedSets.StrictOrder.ImmediateSuccessorRelation ∧ LRA.Order.OrderedSets.StrictOrder.FailsStrictOrder LRA.Order.OrderedSets.StrictOrder.ImmediateSuccessorRelation))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Nat), x = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1 → False) ∧ (((∀ (x y z : Nat), y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1 → z = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1 → z = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1) → False) ∧ (((∀ (x : Nat), x = instHAdd.hAdd x 1 → False) ∧ (∀ (x y z : Nat), y = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1 → z = { hAdd := fun a b => instAddNat.add a b }.hAdd y 1 → z = { hAdd := fun a b => instAddNat.add a b }.hAdd x 1)) → False)))

Logical form (Lean):

```lean
theorem ImmediateSuccessorFailsStrictOrder :
    LRA.Relation.Irreflexive ImmediateSuccessorRelation /\
      Not (LRA.Relation.Transitive ImmediateSuccessorRelation) /\
      FailsStrictOrder ImmediateSuccessorRelation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ImmediateSuccessorFailsStrictOrder :
    LRA.Relation.Irreflexive ImmediateSuccessorRelation /\
      Not (LRA.Relation.Transitive ImmediateSuccessorRelation) /\
      FailsStrictOrder ImmediateSuccessorRelation := by
  sorry
end LRA.Order.OrderedSets.StrictOrder

namespace LRA.Order

/--
`FailsWellOrder` TODO

Predicate logic:

  ∀ {Element : Type u} (SetObject : Type v) [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element), LRA.Order.WellOrder SetObject relation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x → x = y) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) ∧ (∀ (x y : Element), Or (relation x y) (relation y x))) ∧ (∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun least => (inst.1 subset least ∧ (∀ (element : Element), inst.1 subset element → relation least element)))) → False

Logical form (Lean):

```lean
def FailsWellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (WellOrder SetObject relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsWellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (WellOrder SetObject relation)

/--
`IntegersAreNotWellOrdered` TODO

Predicate logic:

  LRA.Order.FailsWellOrder (Set Int) fun left right => Int.instLEInt.le left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((((∀ (x : Int), (fun left right => Int.instLEInt.le left right) x x) ∧ ((∀ (x y : Int), (fun left right => Int.instLEInt.le left right) x y → (fun left right => Int.instLEInt.le left right) y x → x = y) ∧ (∀ (x y z : Int), (fun left right => Int.instLEInt.le left right) x y → (fun left right => Int.instLEInt.le left right) y z → (fun left right => Int.instLEInt.le left right) x z))) ∧ (∀ (x y : Int), Or ((fun left right => Int.instLEInt.le left right) x y) ((fun left right => Int.instLEInt.le left right) y x))) ∧ (∀ (subset : Int → Prop), (Exists fun element => element) ∈ subset → Exists fun least => (least ∈ subset ∧ (∀ (element : Int), element ∈ subset → (fun left right => Int.instLEInt.le left right) least element)))) → False

Logical form (Lean):

```lean
theorem IntegersAreNotWellOrdered :
    FailsWellOrder (Set Int) (fun left right : Int => left ≤ right)
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
theorem IntegersAreNotWellOrdered :
    FailsWellOrder (Set Int) (fun left right : Int => left ≤ right) := by
  sorry
end LRA.Order
