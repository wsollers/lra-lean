
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

  ∀ (x ε a : Real), Real.lt✝ (SemilatticeSup.toMax.1 (instHSub.1 a x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 a x))) ε

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

  ∀ (x ε a : Real), (Set.instMembership.mem (LRA.Analysis.Functions.CenteredOpenInterval x ε) a ∧ ¬ Set.instMembership.mem (Set.instSingletonSet.singleton x) a)

Predicate logic (unfolded):

  ∀ (x ε a : Real), (Set.instMembership.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) a ∧ Set.instMembership.1 (Set.instSingletonSet.1 x) a → False)

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

  ∀ (x : Real) (X : Set Real) (ε : Real), GT.gt ε 0 → Exists fun y => (Set.instMembership.mem (Set.instSDiff.sdiff X (Set.instSingletonSet.singleton x)) y ∧ Real.instLT.lt (abs (instHSub.hSub y x)) ε)

Predicate logic (unfolded):

  ∀ (x : Real) (X : Real → Prop) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 (Set.instSDiff.1 X (Set.instSingletonSet.1 x)) y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y x))) ε)

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

  IsClusterPointR c A ↔ ∃ a ∈ ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧ Filter.Tendsto a Filter.atTop (nhds c)

Predicate logic (unfolded):

  ∀ (c : Real) (A : Real → Prop), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 (Set.instSDiff.1 A (Set.instSingletonSet.1 c)) y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y c))) ε) ↔ Exists fun a => (∀ (n : Nat), Set.instMembership.1 (Set.instSDiff.1 A (Set.instSingletonSet.1 c)) (a n) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds c))

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

  ∀ (x : Real) (X : Set Real) (ε : Real), GT.gt ε 0 → Exists fun y => (Set.instMembership.mem X y ∧ Real.instLT.lt (abs (instHSub.hSub y x)) ε)

Predicate logic (unfolded):

  ∀ (x : Real) (X : Real → Prop) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y x))) ε)

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

  ∀ (x : Real) (X : Set Real), (Set.instMembership.mem X x ∧ Exists fun ε => (GT.gt ε 0 ∧ Set.instInter.inter (LRA.Analysis.Functions.CenteredOpenInterval x ε) X = Set.instSingletonSet.singleton x))

Predicate logic (unfolded):

  ∀ (x : Real) (X : Real → Prop), (Set.instMembership.1 X x ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Set.instInter.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) X = Set.instSingletonSet.1 x))

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

  ∀ (x : Real) (X : Real → Prop), Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) X)

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

  ∀ (x : Real) (X : Set Real) (ε : Real), GT.gt ε 0 → (Set.instInter.inter (LRA.Analysis.Functions.CenteredOpenInterval x ε) X ∧ .Nonempty) (Set.instInter.inter (LRA.Analysis.Functions.CenteredOpenInterval x ε) (Set.instCompl.compl X)).Nonempty

Predicate logic (unfolded):

  ∀ (x : Real) (X : Real → Prop) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → (Exists fun x_1 => Set.instMembership.1 (Set.instInter.1 (fun y => Real.instLT.1 (abs (instHSub.hSub y x)) ε) X) x_1 ∧ Exists fun x_1 => Set.instMembership.1 (Set.instInter.1 (fun y => Real.instLT.1 (abs (instHSub.hSub y x)) ε) (Set.instCompl.1 X)) x_1)

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

  ∀ (X : Real → Prop) (a : Real), Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub y a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y a))) ε) X)

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

  ∀ (X : Set Real) (a ε : Real), GT.gt ε 0 → (Set.instInter.inter (LRA.Analysis.Functions.CenteredOpenInterval a ε) X ∧ .Nonempty) (Set.instInter.inter (LRA.Analysis.Functions.CenteredOpenInterval a ε) (Set.instCompl.compl X)).Nonempty

Predicate logic (unfolded):

  ∀ (X : Real → Prop) (a ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → (Exists fun x => Set.instMembership.1 (Set.instInter.1 (fun y => Real.instLT.1 (abs (instHSub.hSub y a)) ε) X) x ∧ Exists fun x => Set.instMembership.1 (Set.instInter.1 (fun y => Real.instLT.1 (abs (instHSub.hSub y a)) ε) (Set.instCompl.1 X)) x)

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

  ∀ (X : Set Real) (a ε : Real), GT.gt ε 0 → Exists fun y => (Set.instMembership.mem X y ∧ Real.instLT.lt (abs (instHSub.hSub y a)) ε)

Predicate logic (unfolded):

  ∀ (X : Real → Prop) (a ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y a))) ε)

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

  x ∈ ClosureR X ↔ IsAdherentPointR x X

Predicate logic (unfolded):

  ∀ (x : Real) (X : Real → Prop), Set.instMembership.1 (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε)) x ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y x))) ε)

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

  (x ∈ X) → IsIsolatedPointR x X ↔ IsAdherentPointR x X ∧ ¬ IsClusterPointR x X

Predicate logic (unfolded):

  ∀ (x : Real) (X : Real → Prop), Set.instMembership.1 X x → (Set.instMembership.1 X x ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Set.instInter.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) X = Set.instSingletonSet.1 x)) ↔ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y x))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 (Set.instSDiff.1 X (Set.instSingletonSet.1 x)) y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub y x))) ε)) → False)

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

  x ∈ InteriorR X ↔ IsInteriorPointR x X

Predicate logic (unfolded):

  ∀ (x : Real) (X : Real → Prop), Set.instMembership.1 (fun x => Exists fun ε => (Real.instLT.1 0 ε ∧ Set.instLE.1 (setOf fun y => Real.instLT.lt (abs (instHSub.hSub y x)) ε) X)) x ↔ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) X)

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

  InteriorR X ⊆ X

Predicate logic (unfolded):

  ∀ (X : Real → Prop), Set.instLE.1 (fun x => Exists fun ε => (Real.instLT.1 0 ε ∧ Set.instLE.1 (setOf fun y => Real.instLT.lt (abs (instHSub.hSub y x)) ε) X)) X

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

  ∀ (E : Real → Prop), fun x => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 E y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = E

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

  X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧ ∀ C : Set ℝ, IsClosedR C → X ⊆ C → ClosureR X ⊆ C

Predicate logic (unfolded):

  ∀ (X : Real → Prop), (Set.instLE.1 X fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) ∧ (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 (setOf fun x => LRA.Analysis.Functions.IsAdherentPointR x X) y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = funx => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) ∧ ∀ (C : Real → Prop), fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 C y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = C → Set.instLE.1 X C → Set.instLE.1 (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε)) C))

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

  BoundaryR X = ClosureR X \ InteriorR X

Predicate logic (unfolded):

  ∀ (X : Real → Prop), fun x => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → (Exists fun x_1 => Set.instMembership.1 (Set.instInter.1 (LRA.Analysis.Functions.CenteredOpenInterval x ε) X) x_1 ∧ Exists fun x_1 => Set.instMembership.1 (Set.instInter.1 (LRA.Analysis.Functions.CenteredOpenInterval x ε) (Set.instCompl.compl X)) x_1) = Set.instSDiff.1 (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε)) fun x => Exists fun ε => (Real.instLT.1 0 ε ∧ Set.instLE.1 (setOf fun y => Real.instLT.lt (abs (instHSub.hSub y x)) ε) X)

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

  X ⊆ ClosureR X ∧ ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧ ClosureR (X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧ (X ⊆ Y → ClosureR X ⊆ ClosureR Y)

Predicate logic (unfolded):

  ∀ (X Y : Real → Prop), (Set.instLE.1 X fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) ∧ (fun x => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 (Set.instUnion.1 X Y) y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = Set.instUnion.1 (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε)) fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 Y y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) ∧ (Set.instLE.1 (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 (Set.instInter.1 X Y) y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε)) (Set.instInter.1 (fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (abs (instHSub.hSub y x)) ε)) fun x => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun y => (Set.instMembership.1 Y y ∧ Real.instLT.1 (abs (instHSub.hSub y x)) ε)) ∧ Set.instLE.1 X Y → Set.instLE.1 (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε)) fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 Y y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε))))

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

  IsClosedR X ↔ ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) → ∀ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X

Predicate logic (unfolded):

  ∀ (X : Real → Prop), fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = X ↔ ∀ (a : Nat → Real), (∀ (n : Nat), Set.instMembership.1 X (a n)) → ∀ (x : Real), Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x) → Set.instMembership.1 X x

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

  (∀ hI ∈ I.OrdConnected ∀ hnontrivial ∈ I.Nontrivial), ∀ x ∈ I, IsClusterPointR x I

Predicate logic (unfolded):

  ∀ (I : Real → Prop), (Set.OrdConnected I ∧ Exists fun x => (Set.instMembership.1 I x ∧ Exists fun y => (Set.instMembership.1 I y ∧ x = y → False))) → ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 (Set.instSDiff.1 I (Set.instSingletonSet.1 x)) y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y x))) ε)

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

  ∀ (X : Set Real), Exists fun M => (GT.gt M 0 ∧ ∀ (x : Real), Set.instMembership.mem X x → Real.instLE.le (abs x) M)

Predicate logic (unfolded):

  ∀ (X : Real → Prop), Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 X x → Real.instLE.1 (SemilatticeSup.toMax.1 x (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 x)) M)

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

  (IsClosedR X ∧ IsBoundedSetR X) ↔ ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) → ∃ φ ∈ ℕ → ℕ, StrictMono φ ∧ ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L)

Predicate logic (unfolded):

  ∀ (X : Real → Prop), (fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = X ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 X x → Real.instLE.1 (SemilatticeSup.toMax.1 x (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 x)) M)) ↔ ∀ (a : Nat → Real), (∀ (n : Nat), Set.instMembership.1 X (a n)) → Exists fun φ => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (φ a) (φ b) ∧ Exists fun L => (Set.instMembership.1 X L ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage (Function.comp a φ) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)))

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

  ∀ (Q : Real → Prop) (x₀ : Real), Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), (Real.instLT.lt 0 (abs (instHSub.hSub x x₀)) ∧ Real.instLT.lt (abs (instHSub.hSub x x₀)) δ) → Q x)

Predicate logic (unfolded):

  ∀ (Q : Real → Prop) (x₀ : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) δ) → Q x)

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

  (ℝ → Prop) → ∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < η → Q x

Predicate logic (unfolded):

  ∀ (Q : Real → Prop) (x₀ : Real), (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) δ) → Q x)) → Exists fun η => (Real.instLT.1 Zero.toOfNat0.1 η ∧ ∀ (x : Real), (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) η) → Q x)

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

  TrueNear (fun x => P x ∧ Q x) x₀

Predicate logic (unfolded):

  ∀ (P Q : Real → Prop) (x₀ : Real), (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) δ) → P x) ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) δ) → Q x)) → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x x₀) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x x₀))) δ) → (fun x => (P x ∧ Q x)) x)

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

  ∀ (X : Real → Prop), fun x => Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Set.instLE.1 (fun y => Real.instLT.lt (abs (instHSub.hSub y x)) ε) X) = X

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

  IsOpenR X ↔ IsClosedR Xᶜ

Predicate logic (unfolded):

  ∀ (X : Real → Prop), fun x => Exists fun ε => (Real.instLT.1 0 ε ∧ Set.instLE.1 (setOf fun y => Real.instLT.lt (abs (instHSub.hSub y x)) ε) X) = X ↔ fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 (Set.instCompl.1 X) y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = Set.instCompl.1 X

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

  (∀ hX ∈ X.Finite), ∀ x ∈ ℝ, ¬ IsClusterPointR x X ∧ IsClosedR X

Predicate logic (unfolded):

  ∀ (X : Real → Prop), Finite (Subtype fun x => Set.instMembership.1 X x) → (∀ (x : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun y => (Set.instMembership.1 (Set.instSDiff.1 X (Set.instSingletonSet.1 x)) y ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub y x))) ε)) → False ∧ fun x => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun y => (Set.instMembership.1 X y ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y x))) ε) = X)

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
