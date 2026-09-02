
import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.RealAnalysis

/--
`EpsCharSup` TODO

Predicate logic:

  (∀ hne ∈ S.Nonempty), (IsLUB S s) → ∀ ε > 0, ∃ x ∈ S, x > s - ε

Predicate logic (unfolded):

  ∀ (S : Real → Prop) (s : Real), (Exists fun x => Set.instMembership.1 S x ∧ (Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 S a → Real.instLE.1 a x) x ∧ (Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 S a → Real.instLE.1 a x) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (upperBounds S) a → Real.instLE.1 x a) s))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun x => (Set.instMembership.1 S x ∧ Real.instLT.1 (instHSub.1 s ε) x)

Logical form (Lean):

```lean
theorem EpsCharSup (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∀ ε > 0, ∃ x ∈ S, x > s - ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem EpsCharSup (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∀ ε > 0, ∃ x ∈ S, x > s - ε := by
  sorry
/--
`InductiveSelection` TODO

Predicate logic:

  (∀ hne ∈ S.Nonempty), (IsLUB S s) → ∃ x ∈ ℕ → ℝ, (∀ n, x n ∈ S) ∧ StrictMono x ∧ Filter.Tendsto x Filter.atTop (nhds s)

Predicate logic (unfolded):

  ∀ (S : Real → Prop) (s : Real), (Exists fun x => Set.instMembership.1 S x ∧ (Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 S a → Real.instLE.1 a x) x ∧ (Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 S a → Real.instLE.1 a x) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (upperBounds S) a → Real.instLE.1 x a) s))) → Exists fun x => (∀ (n : Nat), Set.instMembership.1 S (x n) ∧ (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Real.instPreorder.toLT.1 (x a) (x b) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds s)))

Logical form (Lean):

```lean
theorem InductiveSelection (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ StrictMono x ∧
      Filter.Tendsto x Filter.atTop (nhds s)
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
theorem InductiveSelection (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ StrictMono x ∧
      Filter.Tendsto x Filter.atTop (nhds s) := by
  sorry
/--
`MonotoneApproxBounds` TODO

Predicate logic:

  (∀ hne ∈ S.Nonempty), ∃ x ∈ ℕ → ℝ, (∀ n, x n ∈ S ∧ Monotone x ∧ Filter.Tendsto x Filter.atTop (nhds (sSup S))) ∧ ∃ y ∈ ℕ → ℝ, (∀ n, y n ∈ S ∧ Antitone y ∧ Filter.Tendsto y Filter.atTop (nhds (sInf S)))

Predicate logic (unfolded):

  ∀ (S : Real → Prop), (Exists fun x => Set.instMembership.1 S x ∧ (Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 S a → Real.instLE.1 a x) x ∧ Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 S a → Real.instLE.1 x a) x)) → (Exists fun x => (∀ (n : Nat), Set.instMembership.1 S (x n) ∧ (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (x a) (x b) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage x x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (Real.instSupSet.1 S)))) ∧ Exists fun y => (∀ (n : Nat), Set.instMembership.1 S (y n) ∧ (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (y b) (y a) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage y x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (Real.instInfSet.1 S)))))

Logical form (Lean):

```lean
theorem MonotoneApproxBounds (S : Set ℝ) (hne : S.Nonempty)
    (hbdd_above : BddAbove S) (hbdd_below : BddBelow S) :
    (∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ Monotone x ∧
      Filter.Tendsto x Filter.atTop (nhds (sSup S))) ∧
    (∃ y : ℕ → ℝ, (∀ n, y n ∈ S) ∧ Antitone y ∧
      Filter.Tendsto y Filter.atTop (nhds (sInf S)))
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
theorem MonotoneApproxBounds (S : Set ℝ) (hne : S.Nonempty)
    (hbdd_above : BddAbove S) (hbdd_below : BddBelow S) :
    (∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ Monotone x ∧
      Filter.Tendsto x Filter.atTop (nhds (sSup S))) ∧
    (∃ y : ℕ → ℝ, (∀ n, y n ∈ S) ∧ Antitone y ∧
      Filter.Tendsto y Filter.atTop (nhds (sInf S))) := by
  sorry
end LRA.Analysis.RealAnalysis
