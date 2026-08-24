import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic
import LRA.Analysis.Completeness.Density.Definition
import LRA.Order.Density

namespace LRA.Analysis.Completeness

/--
`IsOrderDenseSubsetMonotone` TODO

Predicate logic:

  (IsOrderDenseSubset D) → IsOrderDenseSubset D'

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {D D' : S → Prop}, (Set.instLE.1 D D' ∧ ∀ (x y : S), inst.toLT.1 x y → Exists fun d => (Set.instMembership.1 D d ∧ ((fun x1 x2 => inst.toLT.1 x1 x2) x d ∧ (fun x1 x2 => inst.toLT.1 x1 x2) d y))) → ∀ (x y : S), inst.toLT.1 x y → Exists fun d => (Set.instMembership.1 D' d ∧ ((fun x1 x2 => inst.toLT.1 x1 x2) x d ∧ (fun x1 x2 => inst.toLT.1 x1 x2) d y))

Logical form (Lean):

```lean
theorem IsOrderDenseSubsetMonotone {S : Type*} [Preorder S] {D D' : Set S}
    (subsetHypothesis : D ⊆ D')
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset D'
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
theorem IsOrderDenseSubsetMonotone {S : Type*} [Preorder S] {D D' : Set S}
    (subsetHypothesis : D ⊆ D')
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset D' := by
  sorry

/--
`IsOrderDenseSubsetUnion` TODO

Predicate logic:

  (IsOrderDenseSubset D) → IsOrderDenseSubset (D ∪ E)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {D : S → Prop} (E : S → Prop), (∀ (x y : S), inst.toLT.1 x y → Exists fun d => (Set.instMembership.1 D d ∧ ((fun x1 x2 => inst.toLT.1 x1 x2) x d ∧ (fun x1 x2 => inst.toLT.1 x1 x2) d y))) → ∀ (x y : S), inst.toLT.1 x y → Exists fun d => (Set.instMembership.1 (Set.instUnion.1 D E) d ∧ ((fun x1 x2 => inst.toLT.1 x1 x2) x d ∧ (fun x1 x2 => inst.toLT.1 x1 x2) d y))

Logical form (Lean):

```lean
theorem IsOrderDenseSubsetUnion {S : Type*} [Preorder S] {D : Set S} (E : Set S)
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset (D ∪ E)
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
theorem IsOrderDenseSubsetUnion {S : Type*} [Preorder S] {D : Set S} (E : Set S)
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset (D ∪ E) := by
  sorry

/--
`IsOrderDenseSubsetUnivIffDenseOrderLaw` TODO

Predicate logic:

  IsOrderDenseSubset Set.univ ∈ Set S ↔ LRA.Order.DenseOrderLaw S

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S], ∀ (x y : S), inst.toLT.1 x y → Exists fun d => (Set.instMembership.1 (fun _a => True) d ∧ ((fun x1 x2 => inst.toLT.1 x1 x2) x d ∧ (fun x1 x2 => inst.toLT.1 x1 x2) d y)) ↔ LRA.Order.DenseOrderLaw S

Logical form (Lean):

```lean
theorem IsOrderDenseSubsetUnivIffDenseOrderLaw {S : Type*} [Preorder S] :
    IsOrderDenseSubset (Set.univ : Set S) ↔ LRA.Order.DenseOrderLaw S
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
theorem IsOrderDenseSubsetUnivIffDenseOrderLaw {S : Type*} [Preorder S] :
    IsOrderDenseSubset (Set.univ : Set S) ↔ LRA.Order.DenseOrderLaw S := by
  sorry

/--
`DensityOfRationalsInReals` TODO

Predicate logic:

  (a < b) → ∃ q ∈ ℚ, a < q ∈ ℝ ∧ q ∈ ℝ < b

Predicate logic (unfolded):

  ∀ {a b : Real}, Real.instLT.1 a b → Exists fun q => (Real.instLT.1 a (Real.instRatCast.1 q) ∧ Real.instLT.1 (Real.instRatCast.1 q) b)

Logical form (Lean):

```lean
theorem DensityOfRationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem DensityOfRationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b := by
  sorry

/--
`DensityOfIrrationalsInReals` TODO

Predicate logic:

  (a < b) → ∃ s ∈ ℝ, ¬ IsRational s ∧ a < s ∧ s < b

Predicate logic (unfolded):

  ∀ {a b : Real}, Real.instLT.1 a b → Exists fun s => (Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)s → False ∧ (Real.instLT.1 a s ∧ Real.instLT.1 s b))

Logical form (Lean):

```lean
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b := by
  sorry

/--
`IrrationalBetweenAnyTwoRationals` TODO

Predicate logic:

  (r < s) → ∃ x ∈ ℝ, ¬ IsRational x ∧ r ∈ ℝ < x ∧ x < s ∈ ℝ

Predicate logic (unfolded):

  ∀ {r s : Rat}, Rat.instLT.1 r s → Exists fun x => (Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)x → False ∧ (Real.instLT.1 (Real.instRatCast.1 r) x ∧ Real.instLT.1 x (Real.instRatCast.1 s)))

Logical form (Lean):

```lean
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRational x ∧ (r : ℝ) < x ∧ x < (s : ℝ)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRational x ∧ (r : ℝ) < x ∧ x < (s : ℝ) := by
  sorry

/--
`RationalBetweenAnyTwoIrrationals` TODO

Predicate logic:

  (x < y) → ∃ q ∈ ℚ, x < q ∈ ℝ ∧ q ∈ ℝ < y

Predicate logic (unfolded):

  ∀ {x y : Real}, (Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)x → False ∧ (Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)y → False ∧ Real.instLT.1 x y)) → Exists fun q => (Real.instLT.1 x (Real.instRatCast.1 q) ∧ Real.instLT.1 (Real.instRatCast.1 q) y)

Logical form (Lean):

```lean
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRational x)
    (rightIrrationalHypothesis : ¬ IsRational y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRational x)
    (rightIrrationalHypothesis : ¬ IsRational y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y := by
  sorry

/--
`SmallIrrationalPositiveNumber` TODO

Predicate logic:

  ∃ η ∈ ℝ, ¬ IsRational η ∧ 0 < η ∧ η < ε

Predicate logic (unfolded):

  ∀ {ε : Real}, Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun η => (Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)η → False ∧ (Real.instLT.1 Zero.toOfNat0.1 η ∧ Real.instLT.1 η ε))

Logical form (Lean):

```lean
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRational η ∧ 0 < η ∧ η < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRational η ∧ 0 < η ∧ η < ε := by
  sorry

/--
`NoAdjacentRealNumbers` TODO

Predicate logic:

  (a < b) → ∃ c ∈ ℝ, a < c ∧ c < b

Predicate logic (unfolded):

  ∀ {a b : Real}, Real.instLT.1 a b → Exists fun c => (Real.instLT.1 a c ∧ Real.instLT.1 c b)

Logical form (Lean):

```lean
theorem NoAdjacentRealNumbers {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ c : ℝ, a < c ∧ c < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem NoAdjacentRealNumbers {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ c : ℝ, a < c ∧ c < b := by
  sorry

/--
`NoImmediateSuccessorsInReals` TODO

Predicate logic:

  ¬ ∃ m ∈ ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x

Predicate logic (unfolded):

  ∀ (a : Real), (Exists fun m => (Real.instLT.1 a m ∧ ∀ (x : Real), Real.instLT.1 a x → Real.instLE.1 m x)) → False

Logical form (Lean):

```lean
theorem NoImmediateSuccessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem NoImmediateSuccessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x := by
  sorry

/--
`NoImmediatePredecessorsInReals` TODO

Predicate logic:

  ¬ ∃ m ∈ ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m

Predicate logic (unfolded):

  ∀ (a : Real), (Exists fun m => (Real.instLT.1 m a ∧ ∀ (x : Real), Real.instLT.1 x a → Real.instLE.1 x m)) → False

Logical form (Lean):

```lean
theorem NoImmediatePredecessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem NoImmediatePredecessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m := by
  sorry

/--
`EveryOpenIntervalContainsRationalAndIrrational` TODO

Predicate logic:

  (a < b) → ∃ q ∈ ℚ, a < q ∈ ℝ ∧ q ∈ ℝ < b ∧ ∃ s ∈ ℝ, ¬ IsRational s ∧ a < s ∧ s < b

Predicate logic (unfolded):

  ∀ {a b : Real}, Real.instLT.1 a b → (Exists fun q => (Real.instLT.1 a (Real.instRatCast.1 q) ∧ Real.instLT.1 (Real.instRatCast.1 q) b) ∧ Exists fun s => (Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)s → False ∧ (Real.instLT.1 a s ∧ Real.instLT.1 s b)))

Logical form (Lean):

```lean
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b := by
  sorry

/--
`InfinitelyManyRationalsAndIrrationalsInOpenInterval` TODO

Predicate logic:

  (a < b) → {q : ℚ | a < q ∈ ℝ ∧ q ∈ ℝ < b}.Infinite ∧ {s : ℝ | ¬ IsRational s ∧ a < s ∧ s < b}.Infinite

Predicate logic (unfolded):

  ∀ {a b : Real}, Real.instLT.1 a b → (Finite (Subtype fun x => Set.instMembership.1 (fun q => (Real.instLT.lt a q.cast ∧ Real.instLT.lt q.cast b)) x) → False ∧ Finite (Subtype fun x => Set.instMembership.1 (fun s => (¬ LRA.Analysis.Completeness.IsRational s ∧ (Real.instLT.lt a s ∧ Real.instLT.lt s b))) x) → False)

Logical form (Lean):

```lean
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRational s ∧ a < s ∧ s < b}.Infinite
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
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRational s ∧ a < s ∧ s < b}.Infinite := by
  sorry

end LRA.Analysis.Completeness
