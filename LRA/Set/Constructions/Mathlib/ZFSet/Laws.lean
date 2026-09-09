import Mathlib.Tactic.Tauto
import LRA.Set.Constructions.Mathlib.ZFSet.Instances
import LRA.Set.Interface

namespace LRA.Set.MathlibZFSet

/--
`mem_symmetricDifference` TODO

Predicate logic:

  ∀ {A B z : ZFSet}, SetLike.z ∈ LRA.Set.MathlibZFSet.SymmetricDifference A B ↔ Or ((SetLike.z ∈ A ∧ ¬ SetLike.z ∈ B)) ((SetLike.z ∈ B ∧ ¬ SetLike.z ∈ A))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B z : ZFSet
  Prove
    SetLike.z ∈ LRA.Set.MathlibZFSet.SymmetricDifference A B ↔ Or ((SetLike.z ∈ A ∧ ¬ SetLike.z ∈ B)) ((SetLike.z ∈ B ∧ ¬ SetLike.z ∈ A))

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

  ∀ (A B : ZFSet), LRA.Set.MathlibZFSet.SymmetricDifference A B = ZFZFA ∪ B \ ZFA ∩ B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ZFZFA \ B ∪ ZFB \ A = ZFZFA ∪ B \ ZFA ∩ B

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

  ∀ (A B : ZFSet), LRA.Set.MathlibZFSet.SymmetricDifference A B = LRA.Set.MathlibZFSet.SymmetricDifference B A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ZFZFA \ B ∪ ZFB \ A = ZFZFB \ A ∪ ZFA \ B

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

  ∀ (A B C : ZFSet), LRA.Set.MathlibZFSet.SymmetricDifference (LRA.Set.MathlibZFSet.SymmetricDifference A B) C = LRA.Set.MathlibZFSet.SymmetricDifference A (LRA.Set.MathlibZFSet.SymmetricDifference B C)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ZFZFZFZFA \ B ∪ ZFB \ A \ C ∪ ZFC \ ZFZFA \ B ∪ ZFB \ A = ZFZFA \ ZFZFB \ C ∪ ZFC \ B ∪ ZFZFZFB \ C ∪ ZFC \ B \ A

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

  ∀ (A : ZFSet), LRA.Set.MathlibZFSet.SymmetricDifference A ZFSet.instEmptyCollection.emptyCollection = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ZFZFA \ ZFSet.instEmptyCollection.1 ∪ ZFZFSet.instEmptyCollection.1 \ A = A

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

  ∀ (A : ZFSet), LRA.Set.MathlibZFSet.SymmetricDifference ZFSet.instEmptyCollection.emptyCollection A = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ZFZFZFSet.instEmptyCollection.1 \ A ∪ ZFA \ ZFSet.instEmptyCollection.1 = A

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

  ∀ (A : ZFSet), LRA.Set.MathlibZFSet.SymmetricDifference A A = ZFSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ZFZFA \ A ∪ ZFA \ A = ZFSet.instEmptyCollection.1

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

  ∀ (A B : ZFSet), LRA.Set.MathlibZFSet.SymmetricDifference A B = ZFSet.instEmptyCollection.emptyCollection ↔ A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.MathlibZFSet.SymmetricDifference A B = ZFSet.instEmptyCollection.emptyCollection ↔ A = B

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

  ∀ (A B : ZFSet), ZFSet.instPartialOrder.le (LRA.Set.MathlibZFSet.SymmetricDifference A B) (ZFA ∪ B)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ZFSet.instPartialOrder.toPreorder.1.le (ZFZFA \ B ∪ ZFB \ A) (ZFA ∪ B)

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

  ∀ {family : Nat → ZFSet} {x : ZFSet}, SetLike.x ∈ LRA.Set.MathlibZFSet.CountableUnion family ↔ Exists fun index => SetLike.x ∈ family index

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    family : Nat → ZFSet
    x : ZFSet
  Prove
    SetLike.x ∈ LRA.Set.MathlibZFSet.CountableUnion family ↔ Exists fun index => SetLike.x ∈ family index

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

  ∀ {family : Nat → ZFSet} {x : ZFSet}, SetLike.x ∈ LRA.Set.MathlibZFSet.CountableIntersection family ↔ ∀ (index : Nat), SetLike.x ∈ family index

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    family : Nat → ZFSet
    x : ZFSet
  Prove
    SetLike.x ∈ LRA.Set.MathlibZFSet.CountableIntersection family ↔ ∀ (index : Nat), SetLike.x ∈ family index

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
