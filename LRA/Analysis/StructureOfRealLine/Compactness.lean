
import Mathlib.Data.Real.Basic
import LRA.Analysis.StructureOfRealLine.OpenClosedSets
import LRA.Analysis.StructureOfRealLine.CompactnessAdditions

namespace LRA.Analysis.StructureOfRealLine

/--
`IsOpenCover` TODO

Predicate logic:

  ∀ (𝒰 : Set (Set Real)) (K : Set Real), ((∀ (U : Set Real), U ∈ 𝒰 → LRA.Analysis.StructureOfRealLine.IsOpenSet U) ∧ Set.instLE.le K (Set.iUnion fun U => Set.iUnion fun h => U))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (U : Real → Prop), U ∈ 𝒰 → ∀ (x : Real), x ∈ U → Exists fun r => (Real.instLT.lt 0 r ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r) U))) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun U => iSup fun h => U) y = x)))

Logical form (Lean):

```lean
def IsOpenCover (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  (∀ U ∈ 𝒰, IsOpenSet U) ∧ K ⊆ ⋃ U ∈ 𝒰, U
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
def IsOpenCover (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  (∀ U ∈ 𝒰, IsOpenSet U) ∧ K ⊆ ⋃ U ∈ 𝒰, U

/--
`IsFiniteSubcover` TODO

Predicate logic:

  ∀ (𝒱 𝒰 : Set (Set Real)) (K : Set Real), (Set.instLE.le 𝒱 𝒰 ∧ (𝒱.Finite ∧ Set.instLE.le K (Set.iUnion fun U => Set.iUnion fun h => U)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real → Prop⦄, a ∈ s₁ → a ∈ s₂}.le 𝒱 𝒰) ∧ (Finite (Subtype fun x => x) ∈ 𝒱 ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun U => iSup fun h => U) y = x))))

Logical form (Lean):

```lean
def IsFiniteSubcover (𝒱 : Set (Set ℝ)) (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  𝒱 ⊆ 𝒰 ∧ 𝒱.Finite ∧ K ⊆ ⋃ U ∈ 𝒱, U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsFiniteSubcover (𝒱 : Set (Set ℝ)) (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  𝒱 ⊆ 𝒰 ∧ 𝒱.Finite ∧ K ⊆ ⋃ U ∈ 𝒱, U

/--
`IsCompactSet` TODO

Predicate logic:

  ∀ (K : Set Real) (𝒰 : Set (Set Real)), LRA.Analysis.StructureOfRealLine.IsOpenCover 𝒰 K → Exists fun 𝒱 => LRA.Analysis.StructureOfRealLine.IsFiniteSubcover 𝒱 𝒰 K

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (U : Real → Prop), U ∈ 𝒰 → ∀ (x : Real), x ∈ U → Exists fun r => (Real.instLT.lt 0 r ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r) U))) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x))) → Exists fun 𝒱 => (({ le := fun s₁ s₂ => ∀ ⦃a : Real → Prop⦄, a ∈ s₁ → a ∈ s₂}.le 𝒱 𝒰) ∧ (Finite (Subtype fun x => x) ∈ 𝒱 ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x))))

Logical form (Lean):

```lean
def IsCompactSet (K : Set ℝ) : Prop :=
  ∀ 𝒰 : Set (Set ℝ), IsOpenCover 𝒰 K → ∃ 𝒱, IsFiniteSubcover 𝒱 𝒰 K
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
def IsCompactSet (K : Set ℝ) : Prop :=
  ∀ 𝒰 : Set (Set ℝ), IsOpenCover 𝒰 K → ∃ 𝒱, IsFiniteSubcover 𝒱 𝒰 K

/--
`CompactImpliesClosedBounded` TODO

Predicate logic:

  ∀ (K : Set Real), LRA.Analysis.StructureOfRealLine.IsCompactSet K → (LRA.Analysis.StructureOfRealLine.IsClosedSet K ∧ (Exists fun M => (GT.gt M 0 ∧ (∀ (x : Real), x ∈ K → Real.instLE.le (abs x) M))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    K : Set ℝ
  Prove
    (∀ (𝒰 : (Real → Prop) → Prop), ((∀ (U : Real → Prop), U ∈ 𝒰 → ∀ (x : Real), x ∈ U → Exists fun r => (Real.instLT.lt 0 r ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r) U))) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x)))) → Exists fun 𝒱 => (({ le := fun s₁ s₂ => ∀ ⦃a : Real → Prop⦄, a ∈ s₁ → a ∈ s₂}.le 𝒱 𝒰) ∧ (Finite (Subtype fun x => x) ∈ 𝒱 ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x)))))) → ((∀ (x : Real), x ∈ Set.instCompl.1 K → Exists fun r => (Real.instLT.lt 0 r ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r) (Set.instCompl.1 K)))) ∧ (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (x : Real), x ∈ K → Real.instLE.le (abs x) M))))

Logical form (Lean):

```lean
theorem CompactImpliesClosedBounded (K : Set ℝ) (hK : IsCompactSet K) :
    IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M
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
theorem CompactImpliesClosedBounded (K : Set ℝ) (hK : IsCompactSet K) :
    IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M := by
  sorry
/--
`ClosedBoundedIntervalCompact` TODO

Predicate logic:

  ∀ (a b : Real), Real.instLE.le a b → LRA.Analysis.StructureOfRealLine.IsCompactSet (Set.Icc a b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLE.le a b → ∀ (𝒰 : (Real → Prop) → Prop), ((∀ (U : Real → Prop), U ∈ 𝒰 → ∀ (x : Real), x ∈ U → Exists fun r => (Real.instLT.lt 0 r ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r) U))) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b)) (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x)))) → Exists fun 𝒱 => (({ le := fun s₁ s₂ => ∀ ⦃a : Real → Prop⦄, a ∈ s₁ → a ∈ s₂}.le 𝒱 𝒰) ∧ (Finite (Subtype fun x => x) ∈ 𝒱 ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b)) (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x)))))

Logical form (Lean):

```lean
theorem ClosedBoundedIntervalCompact (a b : ℝ) (hab : a ≤ b) :
    IsCompactSet (Set.Icc a b)
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
theorem ClosedBoundedIntervalCompact (a b : ℝ) (hab : a ≤ b) :
    IsCompactSet (Set.Icc a b) := by
  sorry
/--
`IsCompactSetIffIsCompactR` TODO

Predicate logic:

  ∀ (K : Set Real), LRA.Analysis.StructureOfRealLine.IsCompactSet K ↔ LRA.Analysis.StructureOfRealLine.IsCompactR K

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    K : Set ℝ
  Prove
    LRA.Analysis.StructureOfRealLine.IsCompactSet K ↔ LRA.Analysis.StructureOfRealLine.IsCompactR K

Logical form (Lean):

```lean
theorem IsCompactSetIffIsCompactR (K : Set ℝ) : IsCompactSet K ↔ IsCompactR K
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
theorem IsCompactSetIffIsCompactR (K : Set ℝ) : IsCompactSet K ↔ IsCompactR K := by
  sorry
/--
`IsClosedSetIffIsClosedR` TODO

Predicate logic:

  ∀ (F : Set Real), LRA.Analysis.StructureOfRealLine.IsClosedSet F ↔ LRA.Analysis.StructureOfRealLine.IsClosedR F

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    F : Set ℝ
  Prove
    LRA.Analysis.StructureOfRealLine.IsClosedSet F ↔ LRA.Analysis.StructureOfRealLine.IsClosedR F

Logical form (Lean):

```lean
theorem IsClosedSetIffIsClosedR (F : Set ℝ) : IsClosedSet F ↔ IsClosedR F
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
theorem IsClosedSetIffIsClosedR (F : Set ℝ) : IsClosedSet F ↔ IsClosedR F := by
  sorry
/--
`HeineBorel` TODO

Predicate logic:

  ∀ (K : Set Real), LRA.Analysis.StructureOfRealLine.IsCompactSet K ↔ (LRA.Analysis.StructureOfRealLine.IsClosedSet K ∧ (Exists fun M => (GT.gt M 0 ∧ (∀ (x : Real), x ∈ K → Real.instLE.le (abs x) M))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    K : Set ℝ
  Prove
    LRA.Analysis.StructureOfRealLine.IsCompactSet K ↔ (LRA.Analysis.StructureOfRealLine.IsClosedSet K ∧ (Exists fun M => (GT.gt M 0 ∧ (∀ (x : Real), x ∈ K → Real.instLE.le (abs x) M))))

Logical form (Lean):

```lean
theorem HeineBorel (K : Set ℝ) :
    IsCompactSet K ↔ IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M
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
theorem HeineBorel (K : Set ℝ) :
    IsCompactSet K ↔ IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M := by
  sorry
end LRA.Analysis.StructureOfRealLine
