import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.Analysis.MetricSpace

/--
`distanceSet` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) (S : Set X) (a : Real), Exists fun a_1 => (Set.instMembership.mem S a_1 ∧ (fun y => inst.dist x y) a_1 = a)

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) (S : X → Prop) (a : Real), Exists fun a_1 => (Set.instMembership.1 S a_1 ∧ (fun y => inst.toDist.1 x y) a_1 = a)

Logical form (Lean):

```lean
def distanceSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Set Real :=
  (fun y : X => dist x y) '' S
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
def distanceSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Set Real :=
  (fun y : X => dist x y) '' S

/--
`distanceToSet` TODO

Predicate logic:

  noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S)

Predicate logic (unfolded):

  noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S)
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
noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S)

/--
`distanceSet_nonempty` TODO

Predicate logic:

  (∀ x ∈ X ∀ set_nonempty ∈ S.Nonempty), (distanceSet x S).Nonempty

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) {S : X → Prop}, (Exists fun x => Set.instMembership.1 S x) → Exists fun x_1 => Set.instMembership.1 (fun x_2 => Exists fun a => (Set.instMembership.1 S a ∧ (fun y => inst.toDist.1 x y) a = x_2)) x_1

Logical form (Lean):

```lean
theorem distanceSet_nonempty
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    (distanceSet x S).Nonempty
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
theorem distanceSet_nonempty
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    (distanceSet x S).Nonempty := by
  sorry

/--
`distanceSet_bddBelow` TODO

Predicate logic:

  (∀ x ∈ X), BddBelow (distanceSet x S)

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) (S : X → Prop), Exists fun x_1 => Set.instMembership.1 (fun x_2 => ∀ ⦃a : Real⦄, Set.instMembership.1 (LRA.Analysis.MetricSpace.distanceSet x S) a → Real.instLE.1 x_2 a) x_1

Logical form (Lean):

```lean
theorem distanceSet_bddBelow
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) :
    BddBelow (distanceSet x S)
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
theorem distanceSet_bddBelow
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) :
    BddBelow (distanceSet x S) := by
  sorry

/--
`distanceToSet_isGLB` TODO

Predicate logic:

  (∀ x ∈ X ∀ set_nonempty ∈ S.Nonempty), IsGLB (distanceSet x S) (distanceToSet x S)

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) {S : X → Prop}, (Exists fun x => Set.instMembership.1 S x) → (Set.instMembership.1 (fun x_1 => ∀ ⦃a : Real⦄, Set.instMembership.1 (LRA.Analysis.MetricSpace.distanceSet x S) a → Real.instLE.1 x_1 a) (Real.instInfSet.1 (Set.image (fun y => inst.dist x y) S)) ∧ Set.instMembership.1 (fun x_1 => ∀ ⦃a : Real⦄, Set.instMembership.1 (lowerBounds (LRA.Analysis.MetricSpace.distanceSet x S)) a → Real.instLE.1 a x_1) (Real.instInfSet.1 (Set.image (fun y => inst.dist x y) S)))

Logical form (Lean):

```lean
theorem distanceToSet_isGLB
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    IsGLB (distanceSet x S) (distanceToSet x S)
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
theorem distanceToSet_isGLB
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    IsGLB (distanceSet x S) (distanceToSet x S) := by
  sorry

/--
`distanceToSet_le_distance_to_point_of_mem` TODO

Predicate logic:

  (∀ x ∈ X), (a ∈ A) → distanceToSet x A ≤ dist x a

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) {A : X → Prop} {a : X}, Set.instMembership.1 A a → Real.instLE.1 (Real.instInfSet.1 fun x_1 => Exists fun a => (Set.instMembership.mem A a ∧ (fun y => inst.dist x y) a = x_1)) (inst.toDist.1 x a)

Logical form (Lean):

```lean
theorem distanceToSet_le_distance_to_point_of_mem
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {A : Set X}
    {a : X}
    (point_in_set : a ∈ A) :
    distanceToSet x A ≤ dist x a
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
theorem distanceToSet_le_distance_to_point_of_mem
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {A : Set X}
    {a : X}
    (point_in_set : a ∈ A) :
    distanceToSet x A ≤ dist x a := by
  sorry

/--
`distanceToSet_eq_zero_of_mem` TODO

Predicate logic:

  (x ∈ A) → distanceToSet x A = 0

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] {A : X → Prop} {x : X}, Set.instMembership.1 A x → Real.instInfSet.1 fun x_1 => Exists fun a => (Set.instMembership.1 A a ∧ (fun y => inst.toDist.1 x y) a = x_1) = Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem distanceToSet_eq_zero_of_mem
    {X : Type u}
    [MetricSpace X]
    {A : Set X}
    {x : X}
    (point_in_set : x ∈ A) :
    distanceToSet x A = 0
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
theorem distanceToSet_eq_zero_of_mem
    {X : Type u}
    [MetricSpace X]
    {A : Set X}
    {x : X}
    (point_in_set : x ∈ A) :
    distanceToSet x A = 0 := by
  sorry

end LRA.Analysis.MetricSpace
