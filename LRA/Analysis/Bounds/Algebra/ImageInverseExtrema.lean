import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`IncreasingImagePreservesSuprema` TODO

Predicate logic:

  ∀ {I A : Set Real}, (Set.instLE.le A I ∧ A.Nonempty) → ∀ {s : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ s ∈ I) → ∀ {f : Real → Real}, (MonotoneOn f I ∧ ContinuousWithinAt f I s) → LRA.Analysis.Bounds.IsSupremum (f s) (Set.image f A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I A : Set ℝ
    setContainedInDomain : A ⊆ I
    nonemptyHypothesis : A.Nonempty
    s : ℝ
    f : ℝ → ℝ
    monotoneHypothesis : MonotoneOn f I
    continuityHypothesis : ContinuousWithinAt f I s
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le A I) ∧ Exists fun x => x ∈ A) → ∀ {s : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ s ∈ I) → ∀ {f : Real → Real}, ((∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f a) (f b)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin s I(Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f s))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le x (f s)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (f s) u))

Logical form (Lean):

```lean
theorem IncreasingImagePreservesSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsSupremum (f s) (f '' A)
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
theorem IncreasingImagePreservesSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsSupremum (f s) (f '' A) := by
  sorry
/--
`IncreasingImagePreservesInfima` TODO

Predicate logic:

  ∀ {I A : Set Real}, (Set.instLE.le A I ∧ A.Nonempty) → ∀ {i : Real}, (LRA.Analysis.Bounds.IsInfimum i A ∧ i ∈ I) → ∀ {f : Real → Real}, (MonotoneOn f I ∧ ContinuousWithinAt f I i) → LRA.Analysis.Bounds.IsInfimum (f i) (Set.image f A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I A : Set ℝ
    setContainedInDomain : A ⊆ I
    nonemptyHypothesis : A.Nonempty
    i : ℝ
    f : ℝ → ℝ
    monotoneHypothesis : MonotoneOn f I
    continuityHypothesis : ContinuousWithinAt f I i
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le A I) ∧ Exists fun x => x ∈ A) → ∀ {i : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) ∧ i ∈ I) → ∀ {f : Real → Real}, ((∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f a) (f b)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin i I(Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f i))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le (f i) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (f i)))

Logical form (Lean):

```lean
theorem IncreasingImagePreservesInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsInfimum (f i) (f '' A)
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
theorem IncreasingImagePreservesInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsInfimum (f i) (f '' A) := by
  sorry
/--
`DecreasingImageSendsInfimaToSuprema` TODO

Predicate logic:

  ∀ {I A : Set Real}, (Set.instLE.le A I ∧ A.Nonempty) → ∀ {i : Real}, (LRA.Analysis.Bounds.IsInfimum i A ∧ i ∈ I) → ∀ {f : Real → Real}, (AntitoneOn f I ∧ ContinuousWithinAt f I i) → LRA.Analysis.Bounds.IsSupremum (f i) (Set.image f A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I A : Set ℝ
    setContainedInDomain : A ⊆ I
    nonemptyHypothesis : A.Nonempty
    i : ℝ
    f : ℝ → ℝ
    antitoneHypothesis : AntitoneOn f I
    continuityHypothesis : ContinuousWithinAt f I i
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le A I) ∧ Exists fun x => x ∈ A) → ∀ {i : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) ∧ i ∈ I) → ∀ {f : Real → Real}, ((∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f b) (f a)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin i I(Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f i))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le x (f i)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (f i) u))

Logical form (Lean):

```lean
theorem DecreasingImageSendsInfimaToSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsSupremum (f i) (f '' A)
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
theorem DecreasingImageSendsInfimaToSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsSupremum (f i) (f '' A) := by
  sorry
/--
`DecreasingImageSendsSupremaToInfima` TODO

Predicate logic:

  ∀ {I A : Set Real}, (Set.instLE.le A I ∧ A.Nonempty) → ∀ {s : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ s ∈ I) → ∀ {f : Real → Real}, (AntitoneOn f I ∧ ContinuousWithinAt f I s) → LRA.Analysis.Bounds.IsInfimum (f s) (Set.image f A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I A : Set ℝ
    setContainedInDomain : A ⊆ I
    nonemptyHypothesis : A.Nonempty
    s : ℝ
    f : ℝ → ℝ
    antitoneHypothesis : AntitoneOn f I
    continuityHypothesis : ContinuousWithinAt f I s
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le A I) ∧ Exists fun x => x ∈ A) → ∀ {s : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ s ∈ I) → ∀ {f : Real → Real}, ((∀ ⦃a : Real⦄, a ∈ I → ∀ ⦃b : Real⦄, b ∈ I → Real.instPreorder.1.le a b → Real.instPreorder.1.le (f b) (f a)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin s I(Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f s))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le (f s) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ f a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (f s)))

Logical form (Lean):

```lean
theorem DecreasingImageSendsSupremaToInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsInfimum (f s) (f '' A)
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
theorem DecreasingImageSendsSupremaToInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsInfimum (f s) (f '' A) := by
  sorry
/--
`IncreasingInversePreservesSuprema` TODO

Predicate logic:

  ∀ {I J B : Set Real} {f g : Real → Real}, (Set.BijOn f I J ∧ (Set.InvOn g f I J ∧ (Set.instLE.le B J ∧ B.Nonempty))) → ∀ {u : Real}, (LRA.Analysis.Bounds.IsSupremum u B ∧ (u ∈ J ∧ (MonotoneOn g J ∧ ContinuousWithinAt g J u))) → LRA.Analysis.Bounds.IsSupremum (g u) (Set.image g B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I J B : Set ℝ
    f g : ℝ → ℝ
    bijectionHypothesis : Set.BijOn f I J
    inverseHypothesis : Set.InvOn g f I J
    setContainedInCodomain : B ⊆ J
    nonemptyHypothesis : B.Nonempty
    u : ℝ
    inverseMonotoneHypothesis : MonotoneOn g J
    inverseContinuityHypothesis : ContinuousWithinAt g J u
  Prove
    (((∀ ⦃x : Real⦄, x ∈ I → f x ∈ J) ∧ ((∀ ⦃x₁ : Real⦄, x₁ ∈ I → ∀ ⦃x₂ : Real⦄, x₂ ∈ I → f x₁ = f x₂ → x₁ = x₂) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le J fun x => Exists fun a => (a ∈ I ∧ f a = x)))) ∧ (((∀ ⦃x : Real⦄, x ∈ I → g (f x) = x) ∧ (∀ ⦃x : Real⦄, x ∈ J → f (g x) = x)) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le B J) ∧ Exists fun x => x ∈ B))) → ∀ {u : Real}, (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) ∧ (∀ (u_1 : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u_1) → Real.instPreorder.1.le u u_1)) ∧ (u ∈ J ∧ ((∀ ⦃a : Real⦄, a ∈ J → ∀ ⦃b : Real⦄, b ∈ J → Real.instPreorder.1.le a b → Real.instPreorder.1.le (g a) (g b)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin u J(Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g u))))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le x (g u)) ∧ (∀ (u_1 : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le x u_1) → Real.instPreorder.1.le (g u) u_1))

Logical form (Lean):

```lean
theorem IncreasingInversePreservesSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsSupremum (g u) (g '' B)
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
theorem IncreasingInversePreservesSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsSupremum (g u) (g '' B) := by
  sorry
/--
`IncreasingInversePreservesInfima` TODO

Predicate logic:

  ∀ {I J B : Set Real} {f g : Real → Real}, (Set.BijOn f I J ∧ (Set.InvOn g f I J ∧ (Set.instLE.le B J ∧ B.Nonempty))) → ∀ {v : Real}, (LRA.Analysis.Bounds.IsInfimum v B ∧ (v ∈ J ∧ (MonotoneOn g J ∧ ContinuousWithinAt g J v))) → LRA.Analysis.Bounds.IsInfimum (g v) (Set.image g B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I J B : Set ℝ
    f g : ℝ → ℝ
    bijectionHypothesis : Set.BijOn f I J
    inverseHypothesis : Set.InvOn g f I J
    setContainedInCodomain : B ⊆ J
    nonemptyHypothesis : B.Nonempty
    v : ℝ
    inverseMonotoneHypothesis : MonotoneOn g J
    inverseContinuityHypothesis : ContinuousWithinAt g J v
  Prove
    (((∀ ⦃x : Real⦄, x ∈ I → f x ∈ J) ∧ ((∀ ⦃x₁ : Real⦄, x₁ ∈ I → ∀ ⦃x₂ : Real⦄, x₂ ∈ I → f x₁ = f x₂ → x₁ = x₂) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le J fun x => Exists fun a => (a ∈ I ∧ f a = x)))) ∧ (((∀ ⦃x : Real⦄, x ∈ I → g (f x) = x) ∧ (∀ ⦃x : Real⦄, x ∈ J → f (g x) = x)) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le B J) ∧ Exists fun x => x ∈ B))) → ∀ {v : Real}, (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le v x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l v)) ∧ (v ∈ J ∧ ((∀ ⦃a : Real⦄, a ∈ J → ∀ ⦃b : Real⦄, b ∈ J → Real.instPreorder.1.le a b → Real.instPreorder.1.le (g a) (g b)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin v J(Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g v))))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le (g v) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (g v)))

Logical form (Lean):

```lean
theorem IncreasingInversePreservesInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsInfimum (g v) (g '' B)
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
theorem IncreasingInversePreservesInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsInfimum (g v) (g '' B) := by
  sorry
/--
`DecreasingInverseSendsInfimaToSuprema` TODO

Predicate logic:

  ∀ {I J B : Set Real} {f g : Real → Real}, (Set.BijOn f I J ∧ (Set.InvOn g f I J ∧ (Set.instLE.le B J ∧ B.Nonempty))) → ∀ {v : Real}, (LRA.Analysis.Bounds.IsInfimum v B ∧ (v ∈ J ∧ (AntitoneOn g J ∧ ContinuousWithinAt g J v))) → LRA.Analysis.Bounds.IsSupremum (g v) (Set.image g B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I J B : Set ℝ
    f g : ℝ → ℝ
    bijectionHypothesis : Set.BijOn f I J
    inverseHypothesis : Set.InvOn g f I J
    setContainedInCodomain : B ⊆ J
    nonemptyHypothesis : B.Nonempty
    v : ℝ
    inverseAntitoneHypothesis : AntitoneOn g J
    inverseContinuityHypothesis : ContinuousWithinAt g J v
  Prove
    (((∀ ⦃x : Real⦄, x ∈ I → f x ∈ J) ∧ ((∀ ⦃x₁ : Real⦄, x₁ ∈ I → ∀ ⦃x₂ : Real⦄, x₂ ∈ I → f x₁ = f x₂ → x₁ = x₂) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le J fun x => Exists fun a => (a ∈ I ∧ f a = x)))) ∧ (((∀ ⦃x : Real⦄, x ∈ I → g (f x) = x) ∧ (∀ ⦃x : Real⦄, x ∈ J → f (g x) = x)) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le B J) ∧ Exists fun x => x ∈ B))) → ∀ {v : Real}, (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le v x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l v)) ∧ (v ∈ J ∧ ((∀ ⦃a : Real⦄, a ∈ J → ∀ ⦃b : Real⦄, b ∈ J → Real.instPreorder.1.le a b → Real.instPreorder.1.le (g b) (g a)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin v J(Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g v))))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le x (g v)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (g v) u))

Logical form (Lean):

```lean
theorem DecreasingInverseSendsInfimaToSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsSupremum (g v) (g '' B)
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
theorem DecreasingInverseSendsInfimaToSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsSupremum (g v) (g '' B) := by
  sorry
/--
`DecreasingInverseSendsSupremaToInfima` TODO

Predicate logic:

  ∀ {I J B : Set Real} {f g : Real → Real}, (Set.BijOn f I J ∧ (Set.InvOn g f I J ∧ (Set.instLE.le B J ∧ B.Nonempty))) → ∀ {u : Real}, (LRA.Analysis.Bounds.IsSupremum u B ∧ (u ∈ J ∧ (AntitoneOn g J ∧ ContinuousWithinAt g J u))) → LRA.Analysis.Bounds.IsInfimum (g u) (Set.image g B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I J B : Set ℝ
    f g : ℝ → ℝ
    bijectionHypothesis : Set.BijOn f I J
    inverseHypothesis : Set.InvOn g f I J
    setContainedInCodomain : B ⊆ J
    nonemptyHypothesis : B.Nonempty
    u : ℝ
    inverseAntitoneHypothesis : AntitoneOn g J
    inverseContinuityHypothesis : ContinuousWithinAt g J u
  Prove
    (((∀ ⦃x : Real⦄, x ∈ I → f x ∈ J) ∧ ((∀ ⦃x₁ : Real⦄, x₁ ∈ I → ∀ ⦃x₂ : Real⦄, x₂ ∈ I → f x₁ = f x₂ → x₁ = x₂) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le J fun x => Exists fun a => (a ∈ I ∧ f a = x)))) ∧ (((∀ ⦃x : Real⦄, x ∈ I → g (f x) = x) ∧ (∀ ⦃x : Real⦄, x ∈ J → f (g x) = x)) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le B J) ∧ Exists fun x => x ∈ B))) → ∀ {u : Real}, (((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) ∧ (∀ (u_1 : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u_1) → Real.instPreorder.1.le u u_1)) ∧ (u ∈ J ∧ ((∀ ⦃a : Real⦄, a ∈ J → ∀ ⦃b : Real⦄, b ∈ J → Real.instPreorder.1.le a b → Real.instPreorder.1.le (g b) (g a)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin u J(Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g u))))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le (g u) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ B ∧ g a = x) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (g u)))

Logical form (Lean):

```lean
theorem DecreasingInverseSendsSupremaToInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsInfimum (g u) (g '' B)
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
theorem DecreasingInverseSendsSupremaToInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsInfimum (g u) (g '' B) := by
  sorry
end LRA.Analysis.Bounds.Algebra
