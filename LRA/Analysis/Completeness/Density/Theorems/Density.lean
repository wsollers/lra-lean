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

  ∀ {S : Type u_1} [inst : Preorder S] {D D' : Set S}, (Set.instLE.le D D' ∧ LRA.Analysis.Completeness.IsOrderDenseSubset D) → LRA.Analysis.Completeness.IsOrderDenseSubset D'

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    D D' : Set S
    subsetHypothesis : D ⊆ D'
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : S⦄, a ∈ s₁ → a ∈ s₂}.le D D') ∧ (∀ (x y : S), inst.2.lt x y → Exists fun d => (d ∈ D ∧ ((fun x1 x2 => inst.2.lt x1 x2) x d ∧ (fun x1 x2 => inst.2.lt x1 x2) d y)))) → ∀ (x y : S), inst.2.lt x y → Exists fun d => (d ∈ D' ∧ ((fun x1 x2 => inst.2.lt x1 x2) x d ∧ (fun x1 x2 => inst.2.lt x1 x2) d y))

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

  ∀ {S : Type u_1} [inst : Preorder S] {D : Set S} (E : Set S), LRA.Analysis.Completeness.IsOrderDenseSubset D → LRA.Analysis.Completeness.IsOrderDenseSubset (D ∪ E)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    D : Set S
    E : Set S
  Prove
    (∀ (x y : S), inst.2.lt x y → Exists fun d => (d ∈ D ∧ ((fun x1 x2 => inst.2.lt x1 x2) x d ∧ (fun x1 x2 => inst.2.lt x1 x2) d y))) → ∀ (x y : S), inst.2.lt x y → Exists fun d => (d ∈ D ∪ E ∧ ((fun x1 x2 => inst.2.lt x1 x2) x d ∧ (fun x1 x2 => inst.2.lt x1 x2) d y))

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

  ∀ {S : Type u_1} [inst : Preorder S], LRA.Analysis.Completeness.IsOrderDenseSubset Set.univ ↔ LRA.Order.DenseOrderLaw S

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    (none)
  Prove
    LRA.Analysis.Completeness.IsOrderDenseSubset Set.univ ↔ LRA.Order.DenseOrderLaw S

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

  ∀ {a b : Real}, Real.instLT.lt a b → Exists fun q => (Real.instLT.lt a q.cast ∧ Real.instLT.lt q.cast b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLT.lt a b → Exists fun q => (Real.instLT.lt a (Real.instRatCast.1 q) ∧ Real.instLT.lt (Real.instRatCast.1 q) b)

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

  ∀ {a b : Real}, Real.instLT.lt a b → Exists fun s => (¬ LRA.Analysis.Completeness.IsRational s ∧ (Real.instLT.lt a s ∧ Real.instLT.lt s b))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLT.lt a b → Exists fun s => ((s ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x → False) ∧ (Real.instLT.lt a s ∧ Real.instLT.lt s b))

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

  ∀ {r s : Rat}, Rat.instLT.lt r s → Exists fun x => (¬ LRA.Analysis.Completeness.IsRational x ∧ (Real.instLT.lt r.cast x ∧ Real.instLT.lt x s.cast))

Predicate logic (unfolded):

  Ambient
    (ℚ)
  Objects
    r s : ℚ
  Prove
    Rat.instLT.lt r s → Exists fun x => ((x ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x → False) ∧ (Real.instLT.lt (Real.instRatCast.1 r) x ∧ Real.instLT.lt x (Real.instRatCast.1 s)))

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

  ∀ {x y : Real}, (¬ LRA.Analysis.Completeness.IsRational x ∧ (¬ LRA.Analysis.Completeness.IsRational y ∧ Real.instLT.lt x y)) → Exists fun q => (Real.instLT.lt x q.cast ∧ Real.instLT.lt q.cast y)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : ℝ
    leftIrrationalHypothesis : ¬ IsRational x
    rightIrrationalHypothesis : ¬ IsRational y
  Prove
    ((x ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x → False) ∧ ((y ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x → False) ∧ Real.instLT.lt x y)) → Exists fun q => (Real.instLT.lt x (Real.instRatCast.1 q) ∧ Real.instLT.lt (Real.instRatCast.1 q) y)

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

  ∀ {ε : Real}, GT.gt ε 0 → Exists fun η => (¬ LRA.Analysis.Completeness.IsRational η ∧ (Real.instLT.lt 0 η ∧ Real.instLT.lt η ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    ε : ℝ
    positiveToleranceHypothesis : ε > 0
  Prove
    Real.instLT.lt 0 ε → Exists fun η => ((η ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x → False) ∧ (Real.instLT.lt 0 η ∧ Real.instLT.lt η ε))

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

  ∀ {a b : Real}, Real.instLT.lt a b → Exists fun c => (Real.instLT.lt a c ∧ Real.instLT.lt c b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLT.lt a b → Exists fun c => (Real.instLT.lt a c ∧ Real.instLT.lt c b)

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

  ∀ (a : Real), ¬ Exists fun m => (Real.instLT.lt a m ∧ (∀ (x : Real), Real.instLT.lt a x → Real.instLE.le m x))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    (Exists fun m => (Real.instLT.lt a m ∧ (∀ (x : Real), Real.instLT.lt a x → Real.instLE.le m x))) → False

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

  ∀ (a : Real), ¬ Exists fun m => (Real.instLT.lt m a ∧ (∀ (x : Real), Real.instLT.lt x a → Real.instLE.le x m))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    (Exists fun m => (Real.instLT.lt m a ∧ (∀ (x : Real), Real.instLT.lt x a → Real.instLE.le x m))) → False

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

  ∀ {a b : Real}, Real.instLT.lt a b → ((Exists fun q => (Real.instLT.lt a q.cast ∧ Real.instLT.lt q.cast b)) ∧ (Exists fun s => (¬ LRA.Analysis.Completeness.IsRational s ∧ (Real.instLT.lt a s ∧ Real.instLT.lt s b))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLT.lt a b → ((Exists fun q => (Real.instLT.lt a (Real.instRatCast.1 q) ∧ Real.instLT.lt (Real.instRatCast.1 q) b)) ∧ (Exists fun s => ((s ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x → False) ∧ (Real.instLT.lt a s ∧ Real.instLT.lt s b))))

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

  ∀ {a b : Real}, Real.instLT.lt a b → ((setOf fun q => (Real.instLT.lt a q.cast ∧ Real.instLT.lt q.cast b)) ∧ .Infinite) (setOf fun s => (¬ LRA.Analysis.Completeness.IsRational s ∧ (Real.instLT.lt a s ∧ Real.instLT.lt s b))).Infinite

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLT.lt a b → ((Finite (Subtype fun x => x) ∈ fun q => (Real.instLT.lt a q.cast ∧ Real.instLT.lt q.cast b) → False) ∧ (Finite (Subtype fun x => x) ∈ fun s => (¬ LRA.Analysis.Completeness.IsRational s ∧ (Real.instLT.lt a s ∧ Real.instLT.lt s b)) → False))

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
