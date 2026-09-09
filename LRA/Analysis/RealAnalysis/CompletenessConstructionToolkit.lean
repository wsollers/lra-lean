
import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.RealAnalysis

/--
`EpsCharSup` TODO

Predicate logic:

  ∀ (S : Set Real) (s : Real), (S.Nonempty ∧ (BddAbove S ∧ IsLUB S s)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun x => (x ∈ S ∧ GT.gt x (instHSub.hSub s ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    S : Set ℝ
    s : ℝ
    hne : S.Nonempty
    hbdd : BddAbove S
  Prove
    (Exists fun x => x ∈ S ∧ ((Exists fun x => x ∈ fun x => ∀ ⦃a : Real⦄, a ∈ S → Real.instLE.le a x) ∧ ((s ∈ fun x => ∀ ⦃a : Real⦄, a ∈ S → Real.instLE.le a x) ∧ (s ∈ fun x => ∀ ⦃a : Real⦄, a ∈ upperBounds S → Real.instLE.le x a)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun x => (x ∈ S ∧ Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub s ε) x)

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

  ∀ (S : Set Real) (s : Real), (S.Nonempty ∧ (BddAbove S ∧ IsLUB S s)) → Exists fun x => ((∀ (n : Nat), x n ∈ S) ∧ (StrictMono x ∧ Filter.Tendsto x Filter.atTop (nhds s)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    S : Set ℝ
    s : ℝ
    hne : S.Nonempty
    hbdd : BddAbove S
  Prove
    (Exists fun x => x ∈ S ∧ ((Exists fun x => x ∈ fun x => ∀ ⦃a : Real⦄, a ∈ S → Real.instLE.le a x) ∧ ((s ∈ fun x => ∀ ⦃a : Real⦄, a ∈ S → Real.instLE.le a x) ∧ (s ∈ fun x => ∀ ⦃a : Real⦄, a ∈ upperBounds S → Real.instLE.le x a)))) → Exists fun x => ((∀ (n : Nat), x n ∈ S) ∧ ((∀ ⦃a b : Nat⦄, Nat.instPreorder.2.lt a b → Real.instPreorder.2.lt (x a) (x b)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => setOf fun x_2 => x x_2 ∈ x_1 ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds s)))

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

  ∀ (S : Set Real), (S.Nonempty ∧ (BddAbove S ∧ BddBelow S)) → ((Exists fun x => ((∀ (n : Nat), x n ∈ S) ∧ (Monotone x ∧ Filter.Tendsto x Filter.atTop (nhds (Real.instSupSet.sSup S))))) ∧ (Exists fun y => ((∀ (n : Nat), y n ∈ S) ∧ (Antitone y ∧ Filter.Tendsto y Filter.atTop (nhds (Real.instInfSet.sInf S))))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    S : Set ℝ
    hne : S.Nonempty
    hbdd_above : BddAbove S
    hbdd_below : BddBelow S
  Prove
    (Exists fun x => x ∈ S ∧ ((Exists fun x => x ∈ fun x => ∀ ⦃a : Real⦄, a ∈ S → Real.instLE.le a x) ∧ (Exists fun x => x ∈ fun x => ∀ ⦃a : Real⦄, a ∈ S → Real.instLE.le x a))) → ((Exists fun x => ((∀ (n : Nat), x n ∈ S) ∧ ((∀ ⦃a b : Nat⦄, Nat.instPreorder.1.le a b → Real.instPreorder.1.le (x a) (x b)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => setOf fun x_2 => x x_2 ∈ x_1 ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (Real.instSupSet.1 S))))) ∧ (Exists fun y => ((∀ (n : Nat), y n ∈ S) ∧ ((∀ ⦃a b : Nat⦄, Nat.instPreorder.1.le a b → Real.instPreorder.1.le (y b) (y a)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => y x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (Real.instInfSet.1 S))))))

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
