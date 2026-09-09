import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.Analysis.MetricSpace

/--
`diameterSet` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (S : Set X) (a : Real), Exists fun x => (x ∈ S ∧ (Exists fun y => (y ∈ S ∧ a = inst.dist x y)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => (x ∈ S ∧ (Exists fun y => (y ∈ S ∧ a = inst.toDist.1 x y)))

Logical form (Lean):

```lean
def diameterSet
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Set Real :=
  { r : Real | ∃ x : X, x ∈ S ∧ ∃ y : X, y ∈ S ∧ r = dist x y }
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
def diameterSet
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Set Real :=
  { r : Real | ∃ x : X, x ∈ S ∧ ∃ y : X, y ∈ S ∧ r = dist x y }

/--
`diameter` TODO

Predicate logic:

  noncomputable def diameter
      {X : Type u}
      [MetricSpace X]
      (S : Set X) : Real :=
    sSup (diameterSet S)

Predicate logic (unfolded):

  noncomputable def diameter
      {X : Type u}
      [MetricSpace X]
      (S : Set X) : Real :=
    sSup (diameterSet S) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def diameter
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Real :=
  sSup (diameterSet S)
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
noncomputable def diameter
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Real :=
  sSup (diameterSet S)

/--
`diameterSet_mono` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] {A B : Set X}, Set.instLE.le A B → Set.instLE.le (LRA.Analysis.MetricSpace.diameterSet A) (LRA.Analysis.MetricSpace.diameterSet B)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    A B : Set X
    set_inclusion : A ⊆ B
  Prove
    { le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le A B → { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun r => Exists fun x => (x ∈ A ∧ (Exists fun y => (y ∈ A ∧ r = inst.toDist.1 x y)))) fun r => Exists fun x => (x ∈ B ∧ (Exists fun y => (y ∈ B ∧ r = inst.toDist.1 x y)))

Logical form (Lean):

```lean
theorem diameterSet_mono
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B) :
    diameterSet A ⊆ diameterSet B
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
theorem diameterSet_mono
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B) :
    diameterSet A ⊆ diameterSet B := by
  sorry
/--
`diameter_monotone_under_inclusion` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] {A B : Set X}, (Set.instLE.le A B ∧ (LRA.Analysis.MetricSpace.diameterSet A ∧ .Nonempty)(BddAbove (LRA.Analysis.MetricSpace.diameterSet B))) → Real.instLE.le (LRA.Analysis.MetricSpace.diameter A) (LRA.Analysis.MetricSpace.diameter B)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    A B : Set X
    set_inclusion : A ⊆ B
    A_diameterSet_nonempty : (diameterSet A).Nonempty
    B_diameterSet_bddAbove : BddAbove (diameterSet B)
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le A B) ∧ ((Exists fun x => x ∈ fun r => Exists fun x => (x ∈ A ∧ (Exists fun y => (y ∈ A ∧ r = inst.toDist.1 x y)))) ∧ (Exists fun x => x ∈ fun x => ∀ ⦃a : Real⦄, a ∈ LRA.Analysis.MetricSpace.diameterSet B → Real.instLE.le a x))) → Real.instLE.le (Real.instSupSet.1 fun r => Exists fun x => (x ∈ A ∧ (Exists fun y => (y ∈ A ∧ r = inst.toDist.1 x y)))) (Real.instSupSet.1 fun r => Exists fun x => (x ∈ B ∧ (Exists fun y => (y ∈ B ∧ r = inst.toDist.1 x y))))

Logical form (Lean):

```lean
theorem diameter_monotone_under_inclusion
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B)
    (A_diameterSet_nonempty : (diameterSet A).Nonempty)
    (B_diameterSet_bddAbove : BddAbove (diameterSet B)) :
    diameter A ≤ diameter B
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
theorem diameter_monotone_under_inclusion
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B)
    (A_diameterSet_nonempty : (diameterSet A).Nonempty)
    (B_diameterSet_bddAbove : BddAbove (diameterSet B)) :
    diameter A ≤ diameter B := by
  sorry
end LRA.Analysis.MetricSpace
