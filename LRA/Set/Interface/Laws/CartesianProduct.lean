
import LRA.Set.Interface.Definitions.CartesianProduct
import LRA.Set.Interface.Definitions.RelationSets
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Pairing

namespace LRA.Set

universe u v

section CartesianProductLaws

variable {Left Right Pair : Type u}
variable {DomainObject RangeObject RelationObject : Type v}
variable [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [Membership Pair RelationObject]
variable [SeparationLaws Pair RelationObject]
variable [PairingLaws Left Right Pair]

/--
`RelatesCartesianProductOf` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject ∀ a ∈ Left ∀ b ∈ Right), Relates (CartesianProductOf left right ambientPairs) a b ↔ OrderedPair a b ∈ Pair ∈ ambientPairs ∧ a ∈ left ∧ b ∈ right

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (left : DomainObject) (right : RangeObject) (ambientPairs : RelationObject) (a : Left) (b : Right), inst_4.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) (inst.1 a b) ↔ (inst_4.1 ambientPairs (inst.1 a b) ∧ (inst_2.1 left a ∧ inst_3.1 right b))

Logical form (Lean):

```lean
theorem RelatesCartesianProductOf
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (a : Left) (b : Right) :
    Relates (CartesianProductOf left right ambientPairs) a b ↔
      (OrderedPair a b : Pair) ∈ ambientPairs ∧ a ∈ left ∧ b ∈ right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem RelatesCartesianProductOf
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (a : Left) (b : Right) :
    Relates (CartesianProductOf left right ambientPairs) a b ↔
      (OrderedPair a b : Pair) ∈ ambientPairs ∧ a ∈ left ∧ b ∈ right := by
  sorry

/--
`CartesianProductOfIsPairwise` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject), IsPairwise Left Right (CartesianProductOf left right ambientPairs)

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ (left : DomainObject) (right : RangeObject) (ambientPairs : RelationObject) (member : Pair), inst_4.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) member → Exists fun input => Exists fun output => member = inst.1 input output

Logical form (Lean):

```lean
theorem CartesianProductOfIsPairwise
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    IsPairwise Left Right (CartesianProductOf left right ambientPairs)
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
theorem CartesianProductOfIsPairwise
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    IsPairwise Left Right (CartesianProductOf left right ambientPairs) := by
  sorry

variable [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
variable [EmptyCollection DomainObject] [HasSubset DomainObject]
variable [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
variable [EmptyCollection RangeObject] [HasSubset RangeObject]
variable [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
variable [EmptyCollection RelationObject] [HasSubset RelationObject]
variable [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
variable [MembershipLaws Pair RelationObject]

/--
`CartesianProductOfSubsetAmbient` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf left right ambientPairs ⊆ ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left : DomainObject) (right : RangeObject) (ambientPairs : RelationObject), inst_19.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) ambientPairs

Logical form (Lean):

```lean
theorem CartesianProductOfSubsetAmbient
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left right ambientPairs ⊆ ambientPairs
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
theorem CartesianProductOfSubsetAmbient
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left right ambientPairs ⊆ ambientPairs := by
  sorry

/--
`CartesianProductOfMonotoneLeft` TODO

Predicate logic:

  (∀ smaller larger ∈ DomainObject ∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf smaller right ambientPairs ⊆ CartesianProductOf larger right ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (smaller larger : DomainObject) (right : RangeObject) (ambientPairs : RelationObject), inst_9.1 smaller larger → inst_19.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 smaller a ∧ inst_3.1 right b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 larger a ∧ inst_3.1 right b)))

Logical form (Lean):

```lean
theorem CartesianProductOfMonotoneLeft
    (smaller larger : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf smaller right ambientPairs ⊆
      CartesianProductOf larger right ambientPairs
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
theorem CartesianProductOfMonotoneLeft
    (smaller larger : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf smaller right ambientPairs ⊆
      CartesianProductOf larger right ambientPairs := by
  sorry

/--
`CartesianProductOfMonotoneRight` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ smaller larger ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf left smaller ambientPairs ⊆ CartesianProductOf left larger ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left : DomainObject) (smaller larger : RangeObject) (ambientPairs : RelationObject), inst_14.1 smaller larger → inst_19.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 smaller b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 larger b)))

Logical form (Lean):

```lean
theorem CartesianProductOfMonotoneRight
    (left : DomainObject) (smaller larger : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf left smaller ambientPairs ⊆
      CartesianProductOf left larger ambientPairs
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
theorem CartesianProductOfMonotoneRight
    (left : DomainObject) (smaller larger : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf left smaller ambientPairs ⊆
      CartesianProductOf left larger ambientPairs := by
  sorry

/--
`CartesianProductOfEmptyLeft` TODO

Predicate logic:

  (∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf ∅ ∈ DomainObject right ambientPairs = ∅ ∈ RelationObject

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (right : RangeObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 inst_8.1 a ∧ inst_3.1 right b)) = inst_18.1

Logical form (Lean):

```lean
theorem CartesianProductOfEmptyLeft
    (right : RangeObject) (ambientPairs : RelationObject) :
    CartesianProductOf (∅ : DomainObject) right ambientPairs =
      (∅ : RelationObject)
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
theorem CartesianProductOfEmptyLeft
    (right : RangeObject) (ambientPairs : RelationObject) :
    CartesianProductOf (∅ : DomainObject) right ambientPairs =
      (∅ : RelationObject) := by
  sorry

/--
`CartesianProductOfEmptyRight` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf left ∅ ∈ RangeObject ambientPairs = ∅ ∈ RelationObject

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left : DomainObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 inst_13.1 b)) = inst_18.1

Logical form (Lean):

```lean
theorem CartesianProductOfEmptyRight
    (left : DomainObject) (ambientPairs : RelationObject) :
    CartesianProductOf left (∅ : RangeObject) ambientPairs =
      (∅ : RelationObject)
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
theorem CartesianProductOfEmptyRight
    (left : DomainObject) (ambientPairs : RelationObject) :
    CartesianProductOf left (∅ : RangeObject) ambientPairs =
      (∅ : RelationObject) := by
  sorry

/--
`CartesianProductOfUnionLeft` TODO

Predicate logic:

  (∀ left left' ∈ DomainObject ∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf (left ∪ left') right ambientPairs = CartesianProductOf left right ambientPairs ∪ CartesianProductOf left' right ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left left' : DomainObject) (right : RangeObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 (inst_5.1 left left') a ∧ inst_3.1 right b)) = inst_15.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left' a ∧ inst_3.1 right b)))

Logical form (Lean):

```lean
theorem CartesianProductOfUnionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∪ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left' right ambientPairs
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
theorem CartesianProductOfUnionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∪ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left' right ambientPairs := by
  sorry

/--
`CartesianProductOfUnionRight` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ right right' ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf left (right ∪ right') ambientPairs = CartesianProductOf left right ambientPairs ∪ CartesianProductOf left right' ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left : DomainObject) (right right' : RangeObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 (inst_10.1 right right') b)) = inst_15.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right' b)))

Logical form (Lean):

```lean
theorem CartesianProductOfUnionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∪ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left right' ambientPairs
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
theorem CartesianProductOfUnionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∪ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left right' ambientPairs := by
  sorry

/--
`CartesianProductOfIntersectionLeft` TODO

Predicate logic:

  (∀ left left' ∈ DomainObject ∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf (left ∩ left') right ambientPairs = CartesianProductOf left right ambientPairs ∩ CartesianProductOf left' right ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left left' : DomainObject) (right : RangeObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 (inst_6.1 left left') a ∧ inst_3.1 right b)) = inst_16.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left' a ∧ inst_3.1 right b)))

Logical form (Lean):

```lean
theorem CartesianProductOfIntersectionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∩ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left' right ambientPairs
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
theorem CartesianProductOfIntersectionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∩ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left' right ambientPairs := by
  sorry

/--
`CartesianProductOfIntersectionRight` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ right right' ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf left (right ∩ right') ambientPairs = CartesianProductOf left right ambientPairs ∩ CartesianProductOf left right' ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left : DomainObject) (right right' : RangeObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 (inst_11.1 right right') b)) = inst_16.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right' b)))

Logical form (Lean):

```lean
theorem CartesianProductOfIntersectionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∩ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left right' ambientPairs
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
theorem CartesianProductOfIntersectionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∩ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left right' ambientPairs := by
  sorry

/--
`IntersectionOfCartesianProducts` TODO

Predicate logic:

  (∀ leftFirst leftSecond ∈ DomainObject ∀ rightFirst rightSecond ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf leftFirst rightFirst ambientPairs ∩ CartesianProductOf leftSecond rightSecond ambientPairs = CartesianProductOf (leftFirst ∩ leftSecond) (rightFirst ∩ rightSecond) ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (leftFirst leftSecond : DomainObject) (rightFirst rightSecond : RangeObject) (ambientPairs : RelationObject), inst_16.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 leftFirst a ∧ inst_3.1 rightFirst b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 leftSecond a ∧ inst_3.1 rightSecond b))) = inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 (inst_6.1 leftFirst leftSecond) a ∧ inst_3.1 (inst_11.1 rightFirst rightSecond) b))

Logical form (Lean):

```lean
theorem IntersectionOfCartesianProducts
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf leftFirst rightFirst ambientPairs ∩
        CartesianProductOf leftSecond rightSecond ambientPairs =
      CartesianProductOf
        (leftFirst ∩ leftSecond) (rightFirst ∩ rightSecond) ambientPairs
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
theorem IntersectionOfCartesianProducts
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf leftFirst rightFirst ambientPairs ∩
        CartesianProductOf leftSecond rightSecond ambientPairs =
      CartesianProductOf
        (leftFirst ∩ leftSecond) (rightFirst ∩ rightSecond) ambientPairs := by
  sorry

/--
`CartesianProductOfDifferenceLeft` TODO

Predicate logic:

  (∀ left left' ∈ DomainObject ∀ right ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf (left \ left') right ambientPairs = CartesianProductOf left right ambientPairs \ CartesianProductOf left' right ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left left' : DomainObject) (right : RangeObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 (inst_7.1 left left') a ∧ inst_3.1 right b)) = inst_17.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left' a ∧ inst_3.1 right b)))

Logical form (Lean):

```lean
theorem CartesianProductOfDifferenceLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left \ left') right ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left' right ambientPairs
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
theorem CartesianProductOfDifferenceLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left \ left') right ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left' right ambientPairs := by
  sorry

/--
`CartesianProductOfDifferenceRight` TODO

Predicate logic:

  (∀ left ∈ DomainObject ∀ right right' ∈ RangeObject ∀ ambientPairs ∈ RelationObject), CartesianProductOf left (right \ right') ambientPairs = CartesianProductOf left right ambientPairs \ CartesianProductOf left right' ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (left : DomainObject) (right right' : RangeObject) (ambientPairs : RelationObject), inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 (inst_12.1 right right') b)) = inst_17.1 (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right b))) (inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 left a ∧ inst_3.1 right' b)))

Logical form (Lean):

```lean
theorem CartesianProductOfDifferenceRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right \ right') ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left right' ambientPairs
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
theorem CartesianProductOfDifferenceRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right \ right') ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left right' ambientPairs := by
  sorry

/--
`CartesianProductOfCongr` TODO

Predicate logic:

  (∀ leftFirst leftSecond ∈ DomainObject ∀ rightFirst rightSecond ∈ RangeObject ∀ ambientPairs ∈ RelationObject), (∀ a : Left, a ∈ leftFirst ↔ a ∈ leftSecond ∧ ∀ b : Right, b ∈ rightFirst ↔ b ∈ rightSecond) → CartesianProductOf leftFirst rightFirst ambientPairs = CartesianProductOf leftSecond rightSecond ambientPairs

Predicate logic (unfolded):

  ∀ {Left Right Pair : Type u} {DomainObject RangeObject RelationObject : Type v} [inst : LRA.Set.HasPairing Left Right Pair] [inst_1 : LRA.Set.HasSeparation Pair RelationObject] [inst_2 : Membership Left DomainObject] [inst_3 : Membership Right RangeObject] [inst_4 : Membership Pair RelationObject], (LRA.Set.SeparationLaws Pair RelationObject ∧ LRA.Set.PairingLaws Left Right Pair) → ∀ [inst_5 : Union DomainObject] [inst_6 : Inter DomainObject] [inst_7 : SDiff DomainObject] [inst_8 : EmptyCollection DomainObject] [inst_9 : HasSubset DomainObject] [inst_10 : Union RangeObject] [inst_11 : Inter RangeObject] [inst_12 : SDiff RangeObject] [inst_13 : EmptyCollection RangeObject] [inst_14 : HasSubset RangeObject] [inst_15 : Union RelationObject] [inst_16 : Inter RelationObject] [inst_17 : SDiff RelationObject] [inst_18 : EmptyCollection RelationObject] [inst_19 : HasSubset RelationObject], (LRA.Set.MembershipLaws Left DomainObject ∧ (LRA.Set.MembershipLaws Right RangeObject ∧ LRA.Set.MembershipLaws Pair RelationObject)) → ∀ (leftFirst leftSecond : DomainObject) (rightFirst rightSecond : RangeObject) (ambientPairs : RelationObject), (∀ (a : Left), inst_2.1 leftFirst a ↔ inst_2.1 leftSecond a ∧ ∀ (b : Right), inst_3.1 rightFirst b ↔ inst_3.1 rightSecond b) → inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 leftFirst a ∧ inst_3.1 rightFirst b)) = inst_1.1 ambientPairs fun member => Exists fun a => Exists fun b => (member = inst.1 a b ∧ (inst_2.1 leftSecond a ∧ inst_3.1 rightSecond b))

Logical form (Lean):

```lean
theorem CartesianProductOfCongr
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject)
    (sameLeft : ∀ a : Left, a ∈ leftFirst ↔ a ∈ leftSecond)
    (sameRight : ∀ b : Right, b ∈ rightFirst ↔ b ∈ rightSecond) :
    CartesianProductOf leftFirst rightFirst ambientPairs =
      CartesianProductOf leftSecond rightSecond ambientPairs
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
theorem CartesianProductOfCongr
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject)
    (sameLeft : ∀ a : Left, a ∈ leftFirst ↔ a ∈ leftSecond)
    (sameRight : ∀ b : Right, b ∈ rightFirst ↔ b ∈ rightSecond) :
    CartesianProductOf leftFirst rightFirst ambientPairs =
      CartesianProductOf leftSecond rightSecond ambientPairs := by
  sorry

end CartesianProductLaws

end LRA.Set
