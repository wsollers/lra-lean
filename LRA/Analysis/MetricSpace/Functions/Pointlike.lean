import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.NNReal.Basic
import Mathlib.Tactic

namespace LRA.Analysis.MetricSpace

universe u

variable {X : Type u} [MetricSpace X]

/--
`pointFunction` TODO

Predicate logic:

  def pointFunction (z : X) : X → NNReal :=
  fun x => NNReal.mk (dist z x) dist_nonneg

Predicate logic (unfolded):

  def pointFunction (z : X) : X → NNReal :=
  fun x => NNReal.mk (dist z x) dist_nonneg (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def pointFunction (z : X) : X → NNReal :=
  fun x => NNReal.mk (dist z x) dist_nonneg
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def pointFunction (z : X) : X → NNReal :=
  fun x => NNReal.mk (dist z x) dist_nonneg

/--
`coe_pointFunction` TODO

Predicate logic:

  (∀ z x ∈ X), pointFunction z x ∈ NNReal ∈ Real = dist z x

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (z x : X), LRA.Analysis.MetricSpace.pointFunction z x = .1(inst.toDist.1 z x)

Logical form (Lean):

```lean
theorem coe_pointFunction (z x : X) :
    ((pointFunction z x : NNReal) : Real) = dist z x
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
@[simp]

theorem coe_pointFunction (z x : X) :
    ((pointFunction z x : NNReal) : Real) = dist z x := by
  sorry
/--
`pointFunction_self` TODO

Predicate logic:

  (∀ z ∈ X), pointFunction z z = 0

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (z : X), ⟨inst.toDist.1 z z, ⋯⟩ = Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem pointFunction_self (z : X) :
    pointFunction z z = 0
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
@[simp]

theorem pointFunction_self (z : X) :
    pointFunction z z = 0 := by
  sorry
/--
`pointFunctions` TODO

Predicate logic:

  ∀ (X : Type u) [inst : MetricSpace X] (a : X → NNReal), Exists fun y => LRA.Analysis.MetricSpace.pointFunction y = a

Predicate logic (unfolded):

  ∀ (X : Type u) [inst : MetricSpace X] (a : X → NNReal), Exists fun y => fun x => ⟨inst.toDist.1 y x, ⋯⟩ = a

Logical form (Lean):

```lean
def pointFunctions (X : Type u) [MetricSpace X] : Set (X → NNReal) :=
  Set.range (pointFunction (X := X))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def pointFunctions (X : Type u) [MetricSpace X] : Set (X → NNReal) :=
  Set.range (pointFunction (X := X))

/--
`Pointlike` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (u : X → NNReal) (a b : X), (Real.instLE.le (instHSub.hSub (u a).toReal (u b).toReal) (inst.dist a b) ∧ Real.instLE.le (inst.dist a b) (instHAdd.hAdd (u a).toReal (u b).toReal))

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (u : X → NNReal) (a b : X), (Real.instLE.1 (instHSub.1 (u a).1 (u b).1) (inst.toDist.1 a b) ∧ Real.instLE.1 (inst.toDist.1 a b) (instHAdd.1 (u a).1 (u b).1))

Logical form (Lean):

```lean
def Pointlike (u : X → NNReal) : Prop :=
  ∀ a b : X,
    (u a : Real) - (u b : Real) ≤ dist a b ∧
      dist a b ≤ (u a : Real) + (u b : Real)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def Pointlike (u : X → NNReal) : Prop :=
  ∀ a b : X,
    (u a : Real) - (u b : Real) ≤ dist a b ∧
      dist a b ≤ (u a : Real) + (u b : Real)

/--
`pointFunction_mem_pointFunctions` TODO

Predicate logic:

  (∀ z ∈ X), pointFunction z ∈ pointFunctions X

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (z : X), Set.instMembership.1 (fun x => Exists fun y => fun x => ⟨inst.dist y x, ⋯⟩ = x)fun x => ⟨inst.toDist.1 z x, ⋯⟩

Logical form (Lean):

```lean
theorem pointFunction_mem_pointFunctions (z : X) :
    pointFunction z ∈ pointFunctions X
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
theorem pointFunction_mem_pointFunctions (z : X) :
    pointFunction z ∈ pointFunctions X := by
  sorry
/--
`point_functions_identify_points` TODO

Predicate logic:

  Function.Bijective fun z ∈ X => ⟨pointFunction z, pointFunction_mem_pointFunctions z⟩ ∈ {u : X → NNReal // u ∈ pointFunctions X}

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X], (∀ ⦃a₁ a₂ : X⦄, (fun z => ⟨fun x => ⟨inst.toDist.1 z x, ⋯⟩, ⋯⟩) a₁ = (fun z => ⟨fun x => ⟨inst.toDist.1 z x, ⋯⟩, ⋯⟩) a₂ → a₁ = a₂ ∧ ∀ (b : Subtype fun u => Set.instMembership.1 (fun x => Exists fun y => LRA.Analysis.MetricSpace.pointFunction y = x)u), Exists fun a => (fun z => ⟨fun x => ⟨inst.toDist.1 z x, ⋯⟩, ⋯⟩) a = b)

Logical form (Lean):

```lean
theorem point_functions_identify_points :
    Function.Bijective
      (fun z : X => (⟨pointFunction z, pointFunction_mem_pointFunctions z⟩ :
        {u : X → NNReal // u ∈ pointFunctions X}))
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
theorem point_functions_identify_points :
    Function.Bijective
      (fun z : X => (⟨pointFunction z, pointFunction_mem_pointFunctions z⟩ :
        {u : X → NNReal // u ∈ pointFunctions X})) := by
  sorry
/--
`point_function_inequalities` TODO

Predicate logic:

  (∀ z ∈ X), ∀ a b ∈ X, pointFunction z b ∈ Real - pointFunction z a ∈ Real ≤ dist a b ∧ dist a b ≤ pointFunction z b ∈ Real + pointFunction z a ∈ Real ∧ pointFunction z z = 0

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (z : X), (∀ (a b : X), (Real.instLE.1 (instHSub.1 (LRA.Analysis.MetricSpace.pointFunction z b).1 (LRA.Analysis.MetricSpace.pointFunction z a).1) (inst.toDist.1 a b) ∧ Real.instLE.1 (inst.toDist.1 a b) (instHAdd.1 (LRA.Analysis.MetricSpace.pointFunction z b).1 (LRA.Analysis.MetricSpace.pointFunction z a).1)) ∧ ⟨inst.toDist.1 z z, ⋯⟩ = Zero.toOfNat0.1)

Logical form (Lean):

```lean
theorem point_function_inequalities
    (z : X) :
    (∀ a b : X,
      (pointFunction z b : Real) - (pointFunction z a : Real) ≤ dist a b ∧
        dist a b ≤ (pointFunction z b : Real) + (pointFunction z a : Real)) ∧
      pointFunction z z = 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem point_function_inequalities
    (z : X) :
    (∀ a b : X,
      (pointFunction z b : Real) - (pointFunction z a : Real) ≤ dist a b ∧
        dist a b ≤ (pointFunction z b : Real) + (pointFunction z a : Real)) ∧
      pointFunction z z = 0 := by
  sorry
/--
`pointFunction_pointlike` TODO

Predicate logic:

  (∀ z ∈ X), Pointlike (pointFunction z)

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (z a b : X), (Real.instLE.1 (instHSub.1 (LRA.Analysis.MetricSpace.pointFunction z a).1 (LRA.Analysis.MetricSpace.pointFunction z b).1) (inst.toDist.1 a b) ∧ Real.instLE.1 (inst.toDist.1 a b) (instHAdd.1 (LRA.Analysis.MetricSpace.pointFunction z a).1 (LRA.Analysis.MetricSpace.pointFunction z b).1))

Logical form (Lean):

```lean
theorem pointFunction_pointlike (z : X) :
    Pointlike (pointFunction z)
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
theorem pointFunction_pointlike (z : X) :
    Pointlike (pointFunction z) := by
  sorry
/--
`pointlike_eq_pointFunction_of_zero` TODO

Predicate logic:

  (u w = 0) → u = pointFunction w

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] {u : X → NNReal}, (∀ (a b : X), (Real.instLE.1 (instHSub.1 (u a).1 (u b).1) (inst.toDist.1 a b) ∧ Real.instLE.1 (inst.toDist.1 a b) (instHAdd.1 (u a).1 (u b).1))) → ∀ {w : X}, u w = Zero.toOfNat0.1 → u = funx => ⟨inst.toDist.1 w x, ⋯⟩

Logical form (Lean):

```lean
theorem pointlike_eq_pointFunction_of_zero
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w : X}
    (zero_at_w : u w = 0) :
    u = pointFunction w
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
theorem pointlike_eq_pointFunction_of_zero
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w : X}
    (zero_at_w : u w = 0) :
    u = pointFunction w := by
  sorry
/--
`pointlike_zero_point_function` TODO

Predicate logic:

  (X → NNReal) → u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (u : X → NNReal), Set.instMembership.1 (fun x => Exists fun y => fun x => ⟨inst.dist y x, ⋯⟩ = x)u ↔ (∀ (a b : X), (Real.instLE.1 (instHSub.1 (u a).1 (u b).1) (inst.toDist.1 a b) ∧ Real.instLE.1 (inst.toDist.1 a b) (instHAdd.1 (u a).1 (u b).1)) ∧ Set.instMembership.1 (fun x => Exists fun y => u y = x)Zero.toOfNat0.1)

Logical form (Lean):

```lean
theorem pointlike_zero_point_function
    (u : X → NNReal) :
    u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem pointlike_zero_point_function
    (u : X → NNReal) :
    u ∈ pointFunctions X ↔ Pointlike u ∧ 0 ∈ Set.range u := by
  sorry
/--
`pointlike_zero_unique` TODO

Predicate logic:

  (u w₁ = 0 ∧ u w₂ = 0) → w₁ = w₂

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] {u : X → NNReal}, (∀ (a b : X), (Real.instLE.1 (instHSub.1 (u a).1 (u b).1) (inst.toDist.1 a b) ∧ Real.instLE.1 (inst.toDist.1 a b) (instHAdd.1 (u a).1 (u b).1))) → ∀ {w₁ w₂ : X}, (u w₁ = Zero.toOfNat0.1 ∧ u w₂ = Zero.toOfNat0.1) → w₁ = w₂

Logical form (Lean):

```lean
theorem pointlike_zero_unique
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w₁ w₂ : X}
    (zero_at_w₁ : u w₁ = 0)
    (zero_at_w₂ : u w₂ = 0) :
    w₁ = w₂
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
theorem pointlike_zero_unique
    {u : X → NNReal}
    (u_pointlike : Pointlike u)
    {w₁ w₂ : X}
    (zero_at_w₁ : u w₁ = 0)
    (zero_at_w₂ : u w₂ = 0) :
    w₁ = w₂ := by
  sorry
end LRA.Analysis.MetricSpace
