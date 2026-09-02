import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.Analysis.MetricSpace

/--
`diameterSet` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (S : Set X) (a : Real), Exists fun x => (Set.instMembership.mem S x ∧ Exists fun y => (Set.instMembership.mem S y ∧ a = inst.dist x y))

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (S : X → Prop) (a : Real), Exists fun x => (Set.instMembership.1 S x ∧ Exists fun y => (Set.instMembership.1 S y ∧ a = inst.toDist.1 x y))

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

  diameterSet A ⊆ diameterSet B

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] {A B : X → Prop}, Set.instLE.1 A B → Set.instLE.1 (fun r => Exists fun x => (Set.instMembership.1 A x ∧ Exists fun y => (Set.instMembership.1 A y ∧ r = inst.toDist.1 x y))) fun r => Exists fun x => (Set.instMembership.1 B x ∧ Exists fun y => (Set.instMembership.1 B y ∧ r = inst.toDist.1 x y))

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

  diameter A ≤ diameter B

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] {A B : X → Prop}, (Set.instLE.1 A B ∧ (Exists fun x => Set.instMembership.1 (fun r => Exists fun x => (Set.instMembership.1 A x ∧ Exists fun y => (Set.instMembership.1 A y ∧ r = inst.toDist.1 x y))) x ∧ Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (LRA.Analysis.MetricSpace.diameterSet B) a → Real.instLE.1 a x) x)) → Real.instLE.1 (Real.instSupSet.1 fun r => Exists fun x => (Set.instMembership.1 A x ∧ Exists fun y => (Set.instMembership.1 A y ∧ r = inst.toDist.1 x y))) (Real.instSupSet.1 fun r => Exists fun x => (Set.instMembership.1 B x ∧ Exists fun y => (Set.instMembership.1 B y ∧ r = inst.toDist.1 x y)))

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
