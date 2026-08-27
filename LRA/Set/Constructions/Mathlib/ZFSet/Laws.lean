import Mathlib.Tactic.Tauto
import LRA.Set.Constructions.Mathlib.ZFSet.Instances
import LRA.Set.Interface

namespace LRA.Set.MathlibZFSet

/--
`mem_symmetricDifference` TODO

Predicate logic:

  z ∈ SymmetricDifference A B ↔ (z ∈ A ∧ z ∉ B) ∨ (z ∈ B ∧ z ∉ A)

Predicate logic (unfolded):

  ∀ {A B z : ZFSet}, SetLike.instMembership.1 (ZFSet.instUnion.1 (ZFSet.instSDiff.1 A B) (ZFSet.instSDiff.1 B A)) z ↔ Or ((SetLike.instMembership.1 A z ∧ SetLike.instMembership.1 B z → False)) ((SetLike.instMembership.1 B z ∧ SetLike.instMembership.1 A z → False))

Logical form (Lean):

```lean
theorem mem_symmetricDifference {A B z : ZFSet} :
    z ∈ SymmetricDifference A B ↔ (z ∈ A ∧ z ∉ B) ∨ (z ∈ B ∧ z ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
theorem mem_symmetricDifference {A B z : ZFSet} :
    z ∈ SymmetricDifference A B ↔ (z ∈ A ∧ z ∉ B) ∨ (z ∈ B ∧ z ∉ A) := by
  sorry

/--
`symmetricDifference_eq_union_sdiff_inter` TODO

Predicate logic:

  ∀ A B : ZFSet, SymmetricDifference A B = (A ∪ B) \ (A ∩ B)

Predicate logic (unfolded):

  ∀ (A B : ZFSet), ZFSet.instUnion.1 (ZFSet.instSDiff.1 A B) (ZFSet.instSDiff.1 B A) = ZFSet.instSDiff.1 (ZFSet.instUnion.1 A B) (ZFSet.instInter.1 A B)

Logical form (Lean):

```lean
theorem symmetricDifference_eq_union_sdiff_inter :
    ∀ A B : ZFSet,
      SymmetricDifference A B = (A ∪ B) \ (A ∩ B)
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
theorem symmetricDifference_eq_union_sdiff_inter :
    ∀ A B : ZFSet,
      SymmetricDifference A B = (A ∪ B) \ (A ∩ B) := by
  sorry

/--
`symmetricDifference_comm` TODO

Predicate logic:

  ∀ A B : ZFSet, SymmetricDifference A B = SymmetricDifference B A

Predicate logic (unfolded):

  ∀ (A B : ZFSet), ZFSet.instUnion.1 (ZFSet.instSDiff.1 A B) (ZFSet.instSDiff.1 B A) = ZFSet.instUnion.1 (ZFSet.instSDiff.1 B A) (ZFSet.instSDiff.1 A B)

Logical form (Lean):

```lean
theorem symmetricDifference_comm :
    ∀ A B : ZFSet,
      SymmetricDifference A B = SymmetricDifference B A
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
theorem symmetricDifference_comm :
    ∀ A B : ZFSet,
      SymmetricDifference A B = SymmetricDifference B A := by
  sorry

/--
`symmetricDifference_assoc` TODO

Predicate logic:

  ∀ A B C : ZFSet, SymmetricDifference (SymmetricDifference A B) C = SymmetricDifference A (SymmetricDifference B C)

Predicate logic (unfolded):

  ∀ (A B C : ZFSet), ZFSet.instUnion.1 (ZFSet.instSDiff.1 (ZFSet.instUnion.1 (ZFSet.instSDiff.1 A B) (ZFSet.instSDiff.1 B A)) C) (ZFSet.instSDiff.1 C (ZFSet.instUnion.1 (ZFSet.instSDiff.1 A B) (ZFSet.instSDiff.1 B A))) = ZFSet.instUnion.1 (ZFSet.instSDiff.1 A (ZFSet.instUnion.1 (ZFSet.instSDiff.1 B C) (ZFSet.instSDiff.1 C B))) (ZFSet.instSDiff.1 (ZFSet.instUnion.1 (ZFSet.instSDiff.1 B C) (ZFSet.instSDiff.1 C B)) A)

Logical form (Lean):

```lean
theorem symmetricDifference_assoc :
    ∀ A B C : ZFSet,
      SymmetricDifference (SymmetricDifference A B) C =
        SymmetricDifference A (SymmetricDifference B C)
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
theorem symmetricDifference_assoc :
    ∀ A B C : ZFSet,
      SymmetricDifference (SymmetricDifference A B) C =
        SymmetricDifference A (SymmetricDifference B C) := by
  sorry

/--
`symmetricDifference_empty` TODO

Predicate logic:

  ∀ A : ZFSet, SymmetricDifference A ∅ ∈ ZFSet = A

Predicate logic (unfolded):

  ∀ (A : ZFSet), ZFSet.instUnion.1 (ZFSet.instSDiff.1 A ZFSet.instEmptyCollection.1) (ZFSet.instSDiff.1 ZFSet.instEmptyCollection.1 A) = A

Logical form (Lean):

```lean
theorem symmetricDifference_empty :
    ∀ A : ZFSet, SymmetricDifference A (∅ : ZFSet) = A
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
theorem symmetricDifference_empty :
    ∀ A : ZFSet, SymmetricDifference A (∅ : ZFSet) = A := by
  sorry

/--
`empty_symmetricDifference` TODO

Predicate logic:

  ∀ A : ZFSet, SymmetricDifference ∅ ∈ ZFSet A = A

Predicate logic (unfolded):

  ∀ (A : ZFSet), ZFSet.instUnion.1 (ZFSet.instSDiff.1 ZFSet.instEmptyCollection.1 A) (ZFSet.instSDiff.1 A ZFSet.instEmptyCollection.1) = A

Logical form (Lean):

```lean
theorem empty_symmetricDifference :
    ∀ A : ZFSet, SymmetricDifference (∅ : ZFSet) A = A
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
theorem empty_symmetricDifference :
    ∀ A : ZFSet, SymmetricDifference (∅ : ZFSet) A = A := by
  sorry

/--
`symmetricDifference_self` TODO

Predicate logic:

  ∀ A : ZFSet, SymmetricDifference A A = ∅ ∈ ZFSet

Predicate logic (unfolded):

  ∀ (A : ZFSet), ZFSet.instUnion.1 (ZFSet.instSDiff.1 A A) (ZFSet.instSDiff.1 A A) = ZFSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem symmetricDifference_self :
    ∀ A : ZFSet, SymmetricDifference A A = (∅ : ZFSet)
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
theorem symmetricDifference_self :
    ∀ A : ZFSet, SymmetricDifference A A = (∅ : ZFSet) := by
  sorry

/--
`symmetricDifference_eq_empty_iff` TODO

Predicate logic:

  ∀ A B : ZFSet, SymmetricDifference A B = ∅ ∈ ZFSet ↔ A = B

Predicate logic (unfolded):

  ∀ (A B : ZFSet), ZFSet.instUnion.1 (ZFSet.instSDiff.1 A B) (ZFSet.instSDiff.1 B A) = ZFSet.instEmptyCollection.1 ↔ A = B

Logical form (Lean):

```lean
theorem symmetricDifference_eq_empty_iff :
    ∀ A B : ZFSet, SymmetricDifference A B = (∅ : ZFSet) ↔ A = B
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
theorem symmetricDifference_eq_empty_iff :
    ∀ A B : ZFSet, SymmetricDifference A B = (∅ : ZFSet) ↔ A = B := by
  sorry

/--
`symmetricDifference_subset_union` TODO

Predicate logic:

  ∀ A B : ZFSet, SymmetricDifference A B ⊆ A ∪ B

Predicate logic (unfolded):

  ∀ (A B : ZFSet), ZFSet.instPartialOrder.toLE.1 (ZFSet.instUnion.1 (ZFSet.instSDiff.1 A B) (ZFSet.instSDiff.1 B A)) (ZFSet.instUnion.1 A B)

Logical form (Lean):

```lean
theorem symmetricDifference_subset_union :
    ∀ A B : ZFSet, SymmetricDifference A B ⊆ A ∪ B
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
theorem symmetricDifference_subset_union :
    ∀ A B : ZFSet, SymmetricDifference A B ⊆ A ∪ B := by
  sorry

/--
`mem_countableUnion` TODO

Predicate logic:

  x ∈ CountableUnion family ↔ ∃ index, x ∈ family index

Predicate logic (unfolded):

  ∀ {family : Nat → ZFSet} {x : ZFSet}, SetLike.instMembership.1 (Quot.lift (fun x => Quot.mk PSet.setoid.1 (PSet.mk ((x_1 : x.Type) × (x.Func x_1).Type) fun x_1 => PSet.sUnion.match_1 x (fun x => PSet) x_1 fun x_2 y => (x.Func x_2).Func y)) ⋯ (Quotient.mk PSet.setoid (PSet.mk (Shrink Nat) (Function.comp Quotient.out (Function.comp family (EquivLike.toFunLike.coe (equivShrink Nat).symm)))))) x ↔ Exists fun index => SetLike.instMembership.1 (family index) x

Logical form (Lean):

```lean
theorem mem_countableUnion {family : Nat → ZFSet} {x : ZFSet} :
    x ∈ CountableUnion family ↔ ∃ index, x ∈ family index
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem mem_countableUnion {family : Nat → ZFSet} {x : ZFSet} :
    x ∈ CountableUnion family ↔ ∃ index, x ∈ family index := by
  sorry

/--
`mem_countableIntersection` TODO

Predicate logic:

  x ∈ CountableIntersection family ↔ ∀ index, x ∈ family index

Predicate logic (unfolded):

  ∀ {family : Nat → ZFSet} {x : ZFSet}, SetLike.instMembership.1 (Quot.lift (fun x => Quot.mk PSet.setoid.r (PSet.sep (fun y => (fun y => ∀ (z : ZFSet), SetLike.instMembership.mem (ZFSet.range family) z → SetLike.instMembership.mem z y) (ZFSet.mk y)) x)) ⋯ (ZFSet.range family).sUnion) x ↔ ∀ (index : Nat), SetLike.instMembership.1 (family index) x

Logical form (Lean):

```lean
theorem mem_countableIntersection {family : Nat → ZFSet} {x : ZFSet} :
    x ∈ CountableIntersection family ↔ ∀ index, x ∈ family index
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
theorem mem_countableIntersection {family : Nat → ZFSet} {x : ZFSet} :
    x ∈ CountableIntersection family ↔ ∀ index, x ∈ family index := by
  sorry

end LRA.Set.MathlibZFSet
