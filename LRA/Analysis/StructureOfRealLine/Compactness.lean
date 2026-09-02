
import Mathlib.Data.Real.Basic
import LRA.Analysis.StructureOfRealLine.OpenClosedSets
import LRA.Analysis.StructureOfRealLine.CompactnessAdditions

namespace LRA.Analysis.StructureOfRealLine

/--
`IsOpenCover` TODO

Predicate logic:

  ∀ (𝒰 : Set (Set Real)) (K : Set Real), (∀ (U : Set Real), Set.instMembership.mem 𝒰 U → LRA.Analysis.StructureOfRealLine.IsOpenSet U ∧ Set.instLE.le K (Set.iUnion fun U => Set.iUnion fun h => U))

Predicate logic (unfolded):

  ∀ (𝒰 : (Real → Prop) → Prop) (K : Real → Prop), (∀ (U : Real → Prop), Set.instMembership.1 𝒰 U → ∀ (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) U) ∧ Set.instLE.1 K (Set.instSupSet.1 fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x))

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

  ∀ (𝒱 𝒰 : (Real → Prop) → Prop) (K : Real → Prop), (Set.instLE.1 𝒱 𝒰 ∧ (Finite (Subtype fun x => Set.instMembership.1 𝒱 x) ∧ Set.instLE.1 K (Set.instSupSet.1 fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x)))

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

  ∀ (K : Real → Prop) (𝒰 : (Real → Prop) → Prop), (∀ (U : Real → Prop), Set.instMembership.1 𝒰 U → ∀ (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) U) ∧ Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x))) → Exists fun 𝒱 => (Set.instLE.1 𝒱 𝒰 ∧ (Finite (Subtype fun x => Set.instMembership.1 𝒱 x) ∧ Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun U => Set.iUnion fun h => U) y = x))))

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

  (IsCompactSet K) → IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M

Predicate logic (unfolded):

  ∀ (K : Real → Prop), (∀ (𝒰 : (Real → Prop) → Prop), (∀ (U : Real → Prop), Set.instMembership.1 𝒰 U → ∀ (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.lt (abs (instHSub.hSub x y)) r) U) ∧ Set.instLE.1 K (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U))) → Exists fun 𝒱 => (Set.instLE.1 𝒱 𝒰 ∧ (Finite (Subtype fun x => Set.instMembership.1 𝒱 x) ∧ Set.instLE.1 K (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U))))) → (∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 K) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 K)) ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 K x → Real.instLE.1 (SemilatticeSup.toMax.1 x (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 x)) M))

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

  (a ≤ b) → IsCompactSet (Set.Icc a b)

Predicate logic (unfolded):

  ∀ (a b : Real), Real.instLE.1 a b → ∀ (𝒰 : (Real → Prop) → Prop), (∀ (U : Real → Prop), Set.instMembership.1 𝒰 U → ∀ (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.lt (abs (instHSub.hSub x y)) r) U) ∧ Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U))) → Exists fun 𝒱 => (Set.instLE.1 𝒱 𝒰 ∧ (Finite (Subtype fun x => Set.instMembership.1 𝒱 x) ∧ Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U))))

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

  IsCompactSet K ↔ IsCompactR K

Predicate logic (unfolded):

  ∀ (K : Real → Prop), ∀ (𝒰 : (Real → Prop) → Prop), (∀ (U : Real → Prop), Set.instMembership.1 𝒰 U → ∀ (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.lt (abs (instHSub.hSub x y)) r) U) ∧ Set.instLE.1 K (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U))) → Exists fun 𝒱 => (Set.instLE.1 𝒱 𝒰 ∧ (Finite (Subtype fun x => Set.instMembership.1 𝒱 x) ∧ Set.instLE.1 K (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U)))) ↔ ∀ (ι : Type) (U : ι → Real → Prop), (∀ (i : ι) (x : Real), Set.instMembership.1 (U i) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) r → Set.instMembership.1 (U i) y)) → Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x)) → Exists fun J => Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => Set.iUnion fun h => U i) y = x))

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

  IsClosedSet F ↔ IsClosedR F

Predicate logic (unfolded):

  ∀ (F : Real → Prop), ∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 F) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 F)) ↔ ∀ (x : Real), Set.instMembership.1 (Set.instSDiff.1 (fun _a => True) F) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) r → Set.instMembership.1 (Set.instSDiff.1 (fun _a => True) F) y)

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

  IsCompactSet K ↔ IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M

Predicate logic (unfolded):

  ∀ (K : Real → Prop), ∀ (𝒰 : (Real → Prop) → Prop), (∀ (U : Real → Prop), Set.instMembership.1 𝒰 U → ∀ (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.lt (abs (instHSub.hSub x y)) r) U) ∧ Set.instLE.1 K (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U))) → Exists fun 𝒱 => (Set.instLE.1 𝒱 𝒰 ∧ (Finite (Subtype fun x => Set.instMembership.1 𝒱 x) ∧ Set.instLE.1 K (Set.instSupSet.1 (Set.range fun U => Set.iUnion fun h => U)))) ↔ (∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 K) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 K)) ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 K x → Real.instLE.1 (SemilatticeSup.toMax.1 x (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 x)) M))

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
