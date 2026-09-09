
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Interval.Set.OrdConnected

namespace LRA.Analysis.Functions

/--
`CenteredOpenInterval` TODO

Predicate logic:

  ∀ (x ε a : Real), Real.lt✝ (abs (instHSub.hSub a x)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.lt✝ (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub a x)) ε

Logical form (Lean):

```lean
def CenteredOpenInterval (x ε : ℝ) : Set ℝ := {y : ℝ | |y - x| < ε}
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
def CenteredOpenInterval (x ε : ℝ) : Set ℝ := {y : ℝ | |y - x| < ε}

/--
`PuncturedCenteredOpenInterval` TODO

Predicate logic:

  ∀ (x ε a : Real), (a ∈ LRA.Analysis.Functions.CenteredOpenInterval x ε ∧ ¬ a ∈ Set.instSingletonSet.singleton x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε ∧ (a ∈ Set.instSingletonSet.1 x → False))

Logical form (Lean):

```lean
def PuncturedCenteredOpenInterval (x ε : ℝ) : Set ℝ :=
  CenteredOpenInterval x ε \ {x}
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
def PuncturedCenteredOpenInterval (x ε : ℝ) : Set ℝ :=
  CenteredOpenInterval x ε \ {x}

/--
`IsClusterPointR` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real) (ε : Real), GT.gt ε 0 → Exists fun y => (y ∈ X \ Set.instSingletonSet.singleton x ∧ Real.instLT.lt (abs (instHSub.hSub y x)) ε)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun y => (y ∈ X \ Set.instSingletonSet.1 x ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)

Logical form (Lean):

```lean
def IsClusterPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X \ {x}, |y - x| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsClusterPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X \ {x}, |y - x| < ε

/--
`ClusterPointSequential` TODO

Predicate logic:

  ∀ (c : Real) (A : Set Real), LRA.Analysis.Functions.IsClusterPointR c A ↔ Exists fun a => ((∀ (n : Nat), a n ∈ A \ Set.instSingletonSet.singleton c) ∧ Filter.Tendsto a Filter.atTop (nhds c))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c : ℝ
    A : Set ℝ
  Prove
    LRA.Analysis.Functions.IsClusterPointR c A ↔ Exists fun a => ((∀ (n : Nat), a n ∈ A \ Set.instSingletonSet.singleton c) ∧ Filter.Tendsto a Filter.atTop (nhds c))

Logical form (Lean):

```lean
theorem ClusterPointSequential (c : ℝ) (A : Set ℝ) :
    IsClusterPointR c A ↔
      ∃ a : ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧
        Filter.Tendsto a Filter.atTop (nhds c)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem ClusterPointSequential (c : ℝ) (A : Set ℝ) :
    IsClusterPointR c A ↔
      ∃ a : ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧
        Filter.Tendsto a Filter.atTop (nhds c) := by
  sorry
/--
`IsAdherentPointR` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real) (ε : Real), GT.gt ε 0 → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs (instHSub.hSub y x)) ε)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)

Logical form (Lean):

```lean
def IsAdherentPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X, |y - x| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsAdherentPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X, |y - x| < ε

/--
`IsIsolatedPointR` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real), (x ∈ X ∧ (Exists fun ε => (GT.gt ε 0 ∧ LRA.Analysis.Functions.CenteredOpenInterval x ε ∩ X = Set.instSingletonSet.singleton x)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (x ∈ X ∧ (Exists fun ε => (Real.instLT.lt 0 ε ∧ fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε ∩ X = Set.instSingletonSet.1 x)))

Logical form (Lean):

```lean
def IsIsolatedPointR (x : ℝ) (X : Set ℝ) : Prop :=
  x ∈ X ∧ ∃ ε > 0, CenteredOpenInterval x ε ∩ X = {x}
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
def IsIsolatedPointR (x : ℝ) (X : Set ℝ) : Prop :=
  x ∈ X ∧ ∃ ε > 0, CenteredOpenInterval x ε ∩ X = {x}

/--
`IsInteriorPointR` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real), Exists fun ε => (GT.gt ε 0 ∧ Set.instLE.le (LRA.Analysis.Functions.CenteredOpenInterval x ε) X)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun ε => (Real.instLT.lt 0 ε ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) X))

Logical form (Lean):

```lean
def IsInteriorPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∃ ε > 0, CenteredOpenInterval x ε ⊆ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IsInteriorPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∃ ε > 0, CenteredOpenInterval x ε ⊆ X

/--
`IsBoundaryPointR` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real) (ε : Real), GT.gt ε 0 → (LRA.Analysis.Functions.CenteredOpenInterval x ε ∩ X ∧ .Nonempty) (LRA.Analysis.Functions.CenteredOpenInterval x ε ∩ Set.instCompl.compl X).Nonempty

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → (Exists fun x_1 => x_1 ∈ fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε ∩ X ∧ Exists fun x_1 => x_1 ∈ fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε ∩ Set.instCompl.1 X)

Logical form (Lean):

```lean
def IsBoundaryPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, (CenteredOpenInterval x ε ∩ X).Nonempty ∧
    (CenteredOpenInterval x ε ∩ Xᶜ).Nonempty
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
def IsBoundaryPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, (CenteredOpenInterval x ε ∩ X).Nonempty ∧
    (CenteredOpenInterval x ε ∩ Xᶜ).Nonempty

/--
`InteriorR` TODO

Predicate logic:

  ∀ (X : Set Real) (a : Real), Exists fun ε => (GT.gt ε 0 ∧ Set.instLE.le (LRA.Analysis.Functions.CenteredOpenInterval a ε) X)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun ε => (Real.instLT.lt 0 ε ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y a)) ε) X))

Logical form (Lean):

```lean
def InteriorR (X : Set ℝ) : Set ℝ := {x : ℝ | IsInteriorPointR x X}
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
def InteriorR (X : Set ℝ) : Set ℝ := {x : ℝ | IsInteriorPointR x X}

/--
`BoundaryR` TODO

Predicate logic:

  ∀ (X : Set Real) (a ε : Real), GT.gt ε 0 → (LRA.Analysis.Functions.CenteredOpenInterval a ε ∩ X ∧ .Nonempty) (LRA.Analysis.Functions.CenteredOpenInterval a ε ∩ Set.instCompl.compl X).Nonempty

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → (Exists fun x => x ∈ fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y a)) ε ∩ X ∧ Exists fun x => x ∈ fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y a)) ε ∩ Set.instCompl.1 X)

Logical form (Lean):

```lean
def BoundaryR (X : Set ℝ) : Set ℝ := {x : ℝ | IsBoundaryPointR x X}
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
def BoundaryR (X : Set ℝ) : Set ℝ := {x : ℝ | IsBoundaryPointR x X}

/--
`ClosureR` TODO

Predicate logic:

  ∀ (X : Set Real) (a ε : Real), GT.gt ε 0 → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs (instHSub.hSub y a)) ε)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y a)) ε)

Logical form (Lean):

```lean
def ClosureR (X : Set ℝ) : Set ℝ := {x : ℝ | IsAdherentPointR x X}
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
def ClosureR (X : Set ℝ) : Set ℝ := {x : ℝ | IsAdherentPointR x X}

/--
`AdherentPointsAreClosurePoints` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real), x ∈ LRA.Analysis.Functions.ClosureR X ↔ LRA.Analysis.Functions.IsAdherentPointR x X

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : ℝ
    X : Set ℝ
  Prove
    x ∈ LRA.Analysis.Functions.ClosureR X ↔ LRA.Analysis.Functions.IsAdherentPointR x X

Logical form (Lean):

```lean
theorem AdherentPointsAreClosurePoints (x : ℝ) (X : Set ℝ) :
    x ∈ ClosureR X ↔ IsAdherentPointR x X
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
theorem AdherentPointsAreClosurePoints (x : ℝ) (X : Set ℝ) :
    x ∈ ClosureR X ↔ IsAdherentPointR x X := by
  sorry
/--
`IsolatedPointsAreNonclusterAdherentPoints` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real), x ∈ X → LRA.Analysis.Functions.IsIsolatedPointR x X ↔ (LRA.Analysis.Functions.IsAdherentPointR x X ∧ ¬ LRA.Analysis.Functions.IsClusterPointR x X)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : ℝ
    X : Set ℝ
  Prove
    x ∈ X → LRA.Analysis.Functions.IsIsolatedPointR x X ↔ (LRA.Analysis.Functions.IsAdherentPointR x X ∧ ¬ LRA.Analysis.Functions.IsClusterPointR x X)

Logical form (Lean):

```lean
theorem IsolatedPointsAreNonclusterAdherentPoints (x : ℝ) (X : Set ℝ)
    (hx : x ∈ X) :
    IsIsolatedPointR x X ↔ IsAdherentPointR x X ∧ ¬ IsClusterPointR x X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem IsolatedPointsAreNonclusterAdherentPoints (x : ℝ) (X : Set ℝ)
    (hx : x ∈ X) :
    IsIsolatedPointR x X ↔ IsAdherentPointR x X ∧ ¬ IsClusterPointR x X := by
  sorry
/--
`InteriorMembershipCharacterization` TODO

Predicate logic:

  ∀ (x : Real) (X : Set Real), x ∈ LRA.Analysis.Functions.InteriorR X ↔ LRA.Analysis.Functions.IsInteriorPointR x X

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : ℝ
    X : Set ℝ
  Prove
    x ∈ LRA.Analysis.Functions.InteriorR X ↔ LRA.Analysis.Functions.IsInteriorPointR x X

Logical form (Lean):

```lean
theorem InteriorMembershipCharacterization (x : ℝ) (X : Set ℝ) :
    x ∈ InteriorR X ↔ IsInteriorPointR x X
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
theorem InteriorMembershipCharacterization (x : ℝ) (X : Set ℝ) :
    x ∈ InteriorR X ↔ IsInteriorPointR x X := by
  sorry
/--
`InteriorIsContainedInSet` TODO

Predicate logic:

  ∀ (X : Set Real), Set.instLE.le (LRA.Analysis.Functions.InteriorR X) X

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X : Set ℝ
  Prove
    { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => Exists fun ε => (Real.instLT.lt 0 ε ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) X))) X

Logical form (Lean):

```lean
theorem InteriorIsContainedInSet (X : Set ℝ) : InteriorR X ⊆ X
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
theorem InteriorIsContainedInSet (X : Set ℝ) : InteriorR X ⊆ X := by
  sorry
/--
`IsClosedR` TODO

Predicate logic:

  ∀ (E : Set Real), LRA.Analysis.Functions.ClosureR E = E

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ E ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) = E

Logical form (Lean):

```lean
def IsClosedR (E : Set ℝ) : Prop := ClosureR E = E
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
def IsClosedR (E : Set ℝ) : Prop := ClosureR E = E

/--
`ClosureIsSmallestClosedSuperset` TODO

Predicate logic:

  ∀ (X : Set Real), (Set.instLE.le X (LRA.Analysis.Functions.ClosureR X) ∧ (LRA.Analysis.Functions.IsClosedR (LRA.Analysis.Functions.ClosureR X) ∧ (∀ (C : Set Real), LRA.Analysis.Functions.IsClosedR C → Set.instLE.le X C → Set.instLE.le (LRA.Analysis.Functions.ClosureR X) C)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X : Set ℝ
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le X fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) ∧ ((fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ setOf fun x => LRA.Analysis.Functions.IsAdherentPointR x X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) = funx => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) ∧ (∀ (C : Real → Prop), fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ C ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) = C → { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le X C → { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) C)))

Logical form (Lean):

```lean
theorem ClosureIsSmallestClosedSuperset (X : Set ℝ) :
    X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧
      ∀ C : Set ℝ, IsClosedR C → X ⊆ C → ClosureR X ⊆ C
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
theorem ClosureIsSmallestClosedSuperset (X : Set ℝ) :
    X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧
      ∀ C : Set ℝ, IsClosedR C → X ⊆ C → ClosureR X ⊆ C := by
  sorry
/--
`BoundaryAsClosureMinusInterior` TODO

Predicate logic:

  ∀ (X : Set Real), LRA.Analysis.Functions.BoundaryR X = LRA.Analysis.Functions.ClosureR X \ LRA.Analysis.Functions.InteriorR X

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X : Set ℝ
  Prove
    fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → (Exists fun x_1 => x_1 ∈ LRA.Analysis.Functions.CenteredOpenInterval x ε ∩ X ∧ Exists fun x_1 => x_1 ∈ LRA.Analysis.Functions.CenteredOpenInterval x ε ∩ Set.instCompl.compl X) = fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) \ funx => Exists fun ε => (Real.instLT.lt 0 ε ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs (instHSub.hSub y x)) ε) X))

Logical form (Lean):

```lean
theorem BoundaryAsClosureMinusInterior (X : Set ℝ) :
    BoundaryR X = ClosureR X \ InteriorR X
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
theorem BoundaryAsClosureMinusInterior (X : Set ℝ) :
    BoundaryR X = ClosureR X \ InteriorR X := by
  sorry
/--
`ClosureElementary` TODO

Predicate logic:

  ∀ (X Y : Set Real), (Set.instLE.le X (LRA.Analysis.Functions.ClosureR X) ∧ (LRA.Analysis.Functions.ClosureR (X ∪ Y) = LRA.Analysis.Functions.ClosureR X ∪ LRA.Analysis.Functions.ClosureR Y ∧ (Set.instLE.le (LRA.Analysis.Functions.ClosureR (X ∩ Y)) (LRA.Analysis.Functions.ClosureR X ∩ LRA.Analysis.Functions.ClosureR Y) ∧ (Set.instLE.le X Y → Set.instLE.le (LRA.Analysis.Functions.ClosureR X) (LRA.Analysis.Functions.ClosureR Y)))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X Y : Set ℝ
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le X fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) ∧ ((fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∪ Y ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) = fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) ∪ funx => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ Y ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∩ Y ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) (fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) ∩ funx => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ Y ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε))) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le X Y → { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ Y ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)))))

Logical form (Lean):

```lean
theorem ClosureElementary (X Y : Set ℝ) :
    X ⊆ ClosureR X ∧
      ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧
      ClosureR (X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧
      (X ⊆ Y → ClosureR X ⊆ ClosureR Y)
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
theorem ClosureElementary (X Y : Set ℝ) :
    X ⊆ ClosureR X ∧
      ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧
      ClosureR (X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧
      (X ⊆ Y → ClosureR X ⊆ ClosureR Y) := by
  sorry
/--
`ClosedIffSeqLimits` TODO

Predicate logic:

  ∀ (X : Set Real), LRA.Analysis.Functions.IsClosedR X ↔ ∀ (a : Nat → Real), (∀ (n : Nat), a n ∈ X) → ∀ (x : Real), Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X : Set ℝ
  Prove
    LRA.Analysis.Functions.IsClosedR X ↔ ∀ (a : Nat → Real), (∀ (n : Nat), a n ∈ X) → ∀ (x : Real), Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X

Logical form (Lean):

```lean
theorem ClosedIffSeqLimits (X : Set ℝ) :
    IsClosedR X ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∀ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem ClosedIffSeqLimits (X : Set ℝ) :
    IsClosedR X ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∀ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X := by
  sorry
/--
`IntervalAllLimitPoints` TODO

Predicate logic:

  ∀ (I : Set Real), (I.OrdConnected ∧ I.Nontrivial) → ∀ (x : Real), x ∈ I → LRA.Analysis.Functions.IsClusterPointR x I

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I : Set ℝ
    hI : I.OrdConnected
    hnontrivial : I.Nontrivial
  Prove
    (Set.OrdConnected I ∧ (Exists fun x => (x ∈ I ∧ (Exists fun y => (y ∈ I ∧ (x = y → False)))))) → ∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ I \ Set.instSingletonSet.1 x ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)

Logical form (Lean):

```lean
theorem IntervalAllLimitPoints (I : Set ℝ) (hI : I.OrdConnected) (hnontrivial : I.Nontrivial) :
    ∀ x ∈ I, IsClusterPointR x I
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
theorem IntervalAllLimitPoints (I : Set ℝ) (hI : I.OrdConnected) (hnontrivial : I.Nontrivial) :
    ∀ x ∈ I, IsClusterPointR x I := by
  sorry
/--
`IsBoundedSetR` TODO

Predicate logic:

  ∀ (X : Set Real), Exists fun M => (GT.gt M 0 ∧ (∀ (x : Real), x ∈ X → Real.instLE.le (abs x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (x : Real), x ∈ X → Real.instLE.le (abs x) M))

Logical form (Lean):

```lean
def IsBoundedSetR (X : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ X, |x| ≤ M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsBoundedSetR (X : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ X, |x| ≤ M

/--
`HeineBorelSubsetsRealLine` TODO

Predicate logic:

  ∀ (X : Set Real), (LRA.Analysis.Functions.IsClosedR X ∧ LRA.Analysis.Functions.IsBoundedSetR X) ↔ ∀ (a : Nat → Real), (∀ (n : Nat), a n ∈ X) → Exists fun φ => (StrictMono φ ∧ (Exists fun L => (L ∈ X ∧ Filter.Tendsto (Function.comp a φ) Filter.atTop (nhds L))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X : Set ℝ
  Prove
    (LRA.Analysis.Functions.IsClosedR X ∧ LRA.Analysis.Functions.IsBoundedSetR X) ↔ ∀ (a : Nat → Real), (∀ (n : Nat), a n ∈ X) → Exists fun φ => (StrictMono φ ∧ (Exists fun L => (L ∈ X ∧ Filter.Tendsto (Function.comp a φ) Filter.atTop (nhds L))))

Logical form (Lean):

```lean
theorem HeineBorelSubsetsRealLine (X : Set ℝ) :
    (IsClosedR X ∧ IsBoundedSetR X) ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∃ φ : ℕ → ℕ, StrictMono φ ∧
          ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem HeineBorelSubsetsRealLine (X : Set ℝ) :
    (IsClosedR X ∧ IsBoundedSetR X) ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∃ φ : ℕ → ℕ, StrictMono φ ∧
          ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L) := by
  sorry
/--
`TrueNear` TODO

Predicate logic:

  ∀ (Q : Real → Prop) (x₀ : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs (instHSub.hSub x x₀)) ∧ Real.instLT.lt (abs (instHSub.hSub x x₀)) δ) → Q x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) δ) → Q x))

Logical form (Lean):

```lean
def TrueNear (Q : ℝ → Prop) (x₀ : ℝ) : Prop :=
  ∃ δ > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < δ → Q x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def TrueNear (Q : ℝ → Prop) (x₀ : ℝ) : Prop :=
  ∃ δ > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < δ → Q x

/--
`TrueNearStableUnderShrinking` TODO

Predicate logic:

  ∀ (Q : Real → Prop) (x₀ : Real), LRA.Analysis.Functions.TrueNear Q x₀ → Exists fun η => (GT.gt η 0 ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs (instHSub.hSub x x₀)) ∧ Real.instLT.lt (abs (instHSub.hSub x x₀)) η) → Q x))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    Q : ℝ → Prop
    x₀ : ℝ
    h : TrueNear Q x₀
  Prove
    (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) δ) → Q x))) → Exists fun η => (Real.instLT.lt 0 η ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) η) → Q x))

Logical form (Lean):

```lean
theorem TrueNearStableUnderShrinking (Q : ℝ → Prop) (x₀ : ℝ)
    (h : TrueNear Q x₀) :
    ∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < η → Q x
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
theorem TrueNearStableUnderShrinking (Q : ℝ → Prop) (x₀ : ℝ)
    (h : TrueNear Q x₀) :
    ∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < η → Q x := by
  sorry
/--
`TrueNearStableUnderConjunction` TODO

Predicate logic:

  ∀ (P Q : Real → Prop) (x₀ : Real), (LRA.Analysis.Functions.TrueNear P x₀ ∧ LRA.Analysis.Functions.TrueNear Q x₀) → LRA.Analysis.Functions.TrueNear (fun x => (P x ∧ Q x)) x₀

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    P Q : ℝ → Prop
    x₀ : ℝ
    hP : TrueNear P x₀
    hQ : TrueNear Q x₀
  Prove
    ((Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) δ) → P x))) ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) δ) → Q x)))) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x x₀)) δ) → (fun x => (P x ∧ Q x)) x))

Logical form (Lean):

```lean
theorem TrueNearStableUnderConjunction (P Q : ℝ → Prop) (x₀ : ℝ)
    (hP : TrueNear P x₀) (hQ : TrueNear Q x₀) :
    TrueNear (fun x => P x ∧ Q x) x₀
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
theorem TrueNearStableUnderConjunction (P Q : ℝ → Prop) (x₀ : ℝ)
    (hP : TrueNear P x₀) (hQ : TrueNear Q x₀) :
    TrueNear (fun x => P x ∧ Q x) x₀ := by
  sorry
/--
`IsOpenR` TODO

Predicate logic:

  ∀ (X : Set Real), LRA.Analysis.Functions.InteriorR X = X

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    fun x => Exists fun ε => (Real.instLT.lt 0 ε ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) X)) = X

Logical form (Lean):

```lean
def IsOpenR (X : Set ℝ) : Prop := InteriorR X = X
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
def IsOpenR (X : Set ℝ) : Prop := InteriorR X = X

/--
`OpenIffComplementClosed` TODO

Predicate logic:

  ∀ (X : Set Real), LRA.Analysis.Functions.IsOpenR X ↔ LRA.Analysis.Functions.IsClosedR (Set.instCompl.compl X)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X : Set ℝ
  Prove
    LRA.Analysis.Functions.IsOpenR X ↔ LRA.Analysis.Functions.IsClosedR (Set.instCompl.compl X)

Logical form (Lean):

```lean
theorem OpenIffComplementClosed (X : Set ℝ) :
    IsOpenR X ↔ IsClosedR Xᶜ
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
theorem OpenIffComplementClosed (X : Set ℝ) :
    IsOpenR X ↔ IsClosedR Xᶜ := by
  sorry
/--
`FiniteSetIsClosed` TODO

Predicate logic:

  ∀ (X : Set Real), X.Finite → ((∀ (x : Real), ¬ LRA.Analysis.Functions.IsClusterPointR x X) ∧ LRA.Analysis.Functions.IsClosedR X)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    X : Set ℝ
    hX : X.Finite
  Prove
    Finite (Subtype fun x => x) ∈ X → ((∀ (x : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X \ Set.instSingletonSet.1 x ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε)) → False) ∧ (fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (y ∈ X ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y x)) ε) = X))

Logical form (Lean):

```lean
theorem FiniteSetIsClosed (X : Set ℝ) (hX : X.Finite) :
    (∀ x : ℝ, ¬ IsClusterPointR x X) ∧ IsClosedR X
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
theorem FiniteSetIsClosed (X : Set ℝ) (hX : X.Finite) :
    (∀ x : ℝ, ¬ IsClusterPointR x X) ∧ IsClosedR X := by
  sorry
end LRA.Analysis.Functions
