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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsSupremum s A ∧ s ∈ I) → IsSupremum (f s) (f '' A)

Predicate logic (unfolded):

  ∀ {I A : Real → Prop}, (Set.instLE.1 A I ∧ Exists fun x => Set.instMembership.1 A x) → ∀ {s : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ Set.instMembership.1 I s) → ∀ {f : Real → Real}, (∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin s I).sets (Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f s))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 x (f s) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (f s) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsInfimum i A ∧ i ∈ I) → IsInfimum (f i) (f '' A)

Predicate logic (unfolded):

  ∀ {I A : Real → Prop}, (Set.instLE.1 A I ∧ Exists fun x => Set.instMembership.1 A x) → ∀ {i : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Set.instMembership.1 I i) → ∀ {f : Real → Real}, (∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin i I).sets (Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f i))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 (f i) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (f i))

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsInfimum i A ∧ i ∈ I) → IsSupremum (f i) (f '' A)

Predicate logic (unfolded):

  ∀ {I A : Real → Prop}, (Set.instLE.1 A I ∧ Exists fun x => Set.instMembership.1 A x) → ∀ {i : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Set.instMembership.1 I i) → ∀ {f : Real → Real}, (∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f b) (f a) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin i I).sets (Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f i))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 x (f i) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (f i) u)

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

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsSupremum s A ∧ s ∈ I) → IsInfimum (f s) (f '' A)

Predicate logic (unfolded):

  ∀ {I A : Real → Prop}, (Set.instLE.1 A I ∧ Exists fun x => Set.instMembership.1 A x) → ∀ {s : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ Set.instMembership.1 I s) → ∀ {f : Real → Real}, (∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f b) (f a) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin s I).sets (Set.preimage f x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f s))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 (f s) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (f s))

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

  (∀ nonemptyHypothesis ∈ B.Nonempty), (IsSupremum u B ∧ u ∈ J) → IsSupremum (g u) (g '' B)

Predicate logic (unfolded):

  ∀ {I J B : Real → Prop} {f g : Real → Real}, ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → Set.instMembership.1 J (f x) ∧ (∀ ⦃x₁ : Real⦄, Set.instMembership.1 I x₁ → ∀ ⦃x₂ : Real⦄, Set.instMembership.1 I x₂ → f x₁ = f x₂ → x₁ = x₂ ∧ Set.instLE.1 J fun x => Exists fun a => (Set.instMembership.1 I a ∧ f a = x))) ∧ ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → g (f x) = x ∧ ∀ ⦃x : Real⦄, Set.instMembership.1 J x → f (g x) = x) ∧ (Set.instLE.1 B J ∧ Exists fun x => Set.instMembership.1 B x))) → ∀ {u : Real}, ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u ∧ ∀ (u_1 : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u_1) → Real.instPreorder.toLE.1 u u_1) ∧ (Set.instMembership.1 J u ∧ (∀ ⦃a : Real⦄, Set.instMembership.1 J a → ∀ ⦃b : Real⦄, Set.instMembership.1 J b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (g a) (g b) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin u J).sets (Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g u))))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 x (g u) ∧ ∀ (u_1 : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 x u_1) → Real.instPreorder.toLE.1 (g u) u_1)

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

  (∀ nonemptyHypothesis ∈ B.Nonempty), (IsInfimum v B ∧ v ∈ J) → IsInfimum (g v) (g '' B)

Predicate logic (unfolded):

  ∀ {I J B : Real → Prop} {f g : Real → Real}, ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → Set.instMembership.1 J (f x) ∧ (∀ ⦃x₁ : Real⦄, Set.instMembership.1 I x₁ → ∀ ⦃x₂ : Real⦄, Set.instMembership.1 I x₂ → f x₁ = f x₂ → x₁ = x₂ ∧ Set.instLE.1 J fun x => Exists fun a => (Set.instMembership.1 I a ∧ f a = x))) ∧ ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → g (f x) = x ∧ ∀ ⦃x : Real⦄, Set.instMembership.1 J x → f (g x) = x) ∧ (Set.instLE.1 B J ∧ Exists fun x => Set.instMembership.1 B x))) → ∀ {v : Real}, ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 v x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l v) ∧ (Set.instMembership.1 J v ∧ (∀ ⦃a : Real⦄, Set.instMembership.1 J a → ∀ ⦃b : Real⦄, Set.instMembership.1 J b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (g a) (g b) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin v J).sets (Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g v))))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 (g v) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (g v))

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

  (∀ nonemptyHypothesis ∈ B.Nonempty), (IsInfimum v B ∧ v ∈ J) → IsSupremum (g v) (g '' B)

Predicate logic (unfolded):

  ∀ {I J B : Real → Prop} {f g : Real → Real}, ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → Set.instMembership.1 J (f x) ∧ (∀ ⦃x₁ : Real⦄, Set.instMembership.1 I x₁ → ∀ ⦃x₂ : Real⦄, Set.instMembership.1 I x₂ → f x₁ = f x₂ → x₁ = x₂ ∧ Set.instLE.1 J fun x => Exists fun a => (Set.instMembership.1 I a ∧ f a = x))) ∧ ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → g (f x) = x ∧ ∀ ⦃x : Real⦄, Set.instMembership.1 J x → f (g x) = x) ∧ (Set.instLE.1 B J ∧ Exists fun x => Set.instMembership.1 B x))) → ∀ {v : Real}, ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 v x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l v) ∧ (Set.instMembership.1 J v ∧ (∀ ⦃a : Real⦄, Set.instMembership.1 J a → ∀ ⦃b : Real⦄, Set.instMembership.1 J b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (g b) (g a) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin v J).sets (Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g v))))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 x (g v) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (g v) u)

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

  (∀ nonemptyHypothesis ∈ B.Nonempty), (IsSupremum u B ∧ u ∈ J) → IsInfimum (g u) (g '' B)

Predicate logic (unfolded):

  ∀ {I J B : Real → Prop} {f g : Real → Real}, ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → Set.instMembership.1 J (f x) ∧ (∀ ⦃x₁ : Real⦄, Set.instMembership.1 I x₁ → ∀ ⦃x₂ : Real⦄, Set.instMembership.1 I x₂ → f x₁ = f x₂ → x₁ = x₂ ∧ Set.instLE.1 J fun x => Exists fun a => (Set.instMembership.1 I a ∧ f a = x))) ∧ ((∀ ⦃x : Real⦄, Set.instMembership.1 I x → g (f x) = x ∧ ∀ ⦃x : Real⦄, Set.instMembership.1 J x → f (g x) = x) ∧ (Set.instLE.1 B J ∧ Exists fun x => Set.instMembership.1 B x))) → ∀ {u : Real}, ((∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u ∧ ∀ (u_1 : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u_1) → Real.instPreorder.toLE.1 u u_1) ∧ (Set.instMembership.1 J u ∧ (∀ ⦃a : Real⦄, Set.instMembership.1 J a → ∀ ⦃b : Real⦄, Set.instMembership.1 J b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (g b) (g a) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin u J).sets (Set.preimage g x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (g u))))) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 (g u) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 B a ∧ g a = x)) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (g u))

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
