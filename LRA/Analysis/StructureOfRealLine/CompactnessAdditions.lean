
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.StructureOfRealLine

/--
`IsOpenR` TODO

Predicate logic:

  ∀ (U : Set Real) (x : Real), Set.instMembership.mem U x → Exists fun r => (GT.gt r 0 ∧ ∀ (y : Real), Real.instLT.lt (abs (instHSub.hSub x y)) r → Set.instMembership.mem U y)

Predicate logic (unfolded):

  ∀ (U : Real → Prop) (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) r → Set.instMembership.1 U y)

Logical form (Lean):

```lean
def IsOpenR (U : Set ℝ) : Prop :=
  ∀ x ∈ U, ∃ r > 0, ∀ y : ℝ, |x - y| < r → y ∈ U
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
def IsOpenR (U : Set ℝ) : Prop :=
  ∀ x ∈ U, ∃ r > 0, ∀ y : ℝ, |x - y| < r → y ∈ U

/--
`IsClosedR` TODO

Predicate logic:

  ∀ (F : Set Real) (x : Real), Set.instMembership.mem (Set.instSDiff.sdiff Set.univ F) x → Exists fun r => (GT.gt r 0 ∧ ∀ (y : Real), Real.instLT.lt (abs (instHSub.hSub x y)) r → Set.instMembership.mem (Set.instSDiff.sdiff Set.univ F) y)

Predicate logic (unfolded):

  ∀ (F : Real → Prop) (x : Real), Set.instMembership.1 (Set.instSDiff.1 (fun _a => True) F) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) r → Set.instMembership.1 (Set.instSDiff.1 (fun _a => True) F) y)

Logical form (Lean):

```lean
def IsClosedR (F : Set ℝ) : Prop :=
  IsOpenR (Set.univ \ F)
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
def IsClosedR (F : Set ℝ) : Prop :=
  IsOpenR (Set.univ \ F)

/--
`IsCompactR` TODO

Predicate logic:

  ∀ (K : Set Real) (ι : Type) (U : ι → Set Real), (∀ (i : ι), LRA.Analysis.StructureOfRealLine.IsOpenR (U i) ∧ Set.instLE.le K (Set.iUnion fun i => U i)) → Exists fun J => Set.instLE.le K (Set.iUnion fun i => Set.iUnion fun h => U i)

Predicate logic (unfolded):

  ∀ (K : Real → Prop) (ι : Type) (U : ι → Real → Prop), (∀ (i : ι) (x : Real), Set.instMembership.1 (U i) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) r → Set.instMembership.1 (U i) y) ∧ Set.instLE.1 K (Set.instSupSet.1 fun x => Exists fun y => (fun i => U i) y = x)) → Exists fun J => Set.instLE.1 K (Set.instSupSet.1 fun x => Exists fun y => (fun i => Set.iUnion fun h => U i) y = x)

Logical form (Lean):

```lean
def IsCompactR (K : Set ℝ) : Prop :=
  ∀ (ι : Type) (U : ι → Set ℝ),
    (∀ i, IsOpenR (U i)) → K ⊆ ⋃ i, U i →
    ∃ J : Finset ι, K ⊆ ⋃ i ∈ J, U i
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
def IsCompactR (K : Set ℝ) : Prop :=
  ∀ (ι : Type) (U : ι → Set ℝ),
    (∀ i, IsOpenR (U i)) → K ⊆ ⋃ i, U i →
    ∃ J : Finset ι, K ⊆ ⋃ i ∈ J, U i

/--
`ClosedSubsetOfCompactIsCompact` TODO

Predicate logic:

  (IsClosedR F ∧ IsCompactR K) → IsCompactR F

Predicate logic (unfolded):

  ∀ (F K : Real → Prop), (Set.instLE.1 F K ∧ (∀ (x : Real), Set.instMembership.1 (Set.instSDiff.1 (fun _a => True) F) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) r → Set.instMembership.1 (Set.instSDiff.1 (fun _a => True) F) y) ∧ ∀ (ι : Type) (U : ι → Real → Prop), (∀ (i : ι) (x : Real), Set.instMembership.1 (U i) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) r → Set.instMembership.1 (U i) y)) → Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x)) → Exists fun J => Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => Set.iUnion fun h => U i) y = x)))) → ∀ (ι : Type) (U : ι → Real → Prop), (∀ (i : ι) (x : Real), Set.instMembership.1 (U i) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) r → Set.instMembership.1 (U i) y) ∧ Set.instLE.1 F (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x))) → Exists fun J => Set.instLE.1 F (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => Set.iUnion fun h => U i) y = x))

Logical form (Lean):

```lean
theorem ClosedSubsetOfCompactIsCompact
    (F K : Set ℝ) (hFK : F ⊆ K) (hF : IsClosedR F) (hK : IsCompactR K) :
    IsCompactR F
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
theorem ClosedSubsetOfCompactIsCompact
    (F K : Set ℝ) (hFK : F ⊆ K) (hF : IsClosedR F) (hK : IsCompactR K) :
    IsCompactR F := by
  sorry
/--
`IsSeqCompactR` TODO

Predicate logic:

  ∀ (K : Set Real) (x : Nat → Real), (∀ (n : Nat), Set.instMembership.mem K (x n)) → Exists fun φ => (StrictMono φ ∧ Exists fun L => (Set.instMembership.mem K L ∧ Filter.Tendsto (Function.comp x φ) Filter.atTop (nhds L)))

Predicate logic (unfolded):

  ∀ (K : Real → Prop) (x : Nat → Real), (∀ (n : Nat), Set.instMembership.1 K (x n)) → Exists fun φ => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (φ a) (φ b) ∧ Exists fun L => (Set.instMembership.1 K L ∧ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage (Function.comp x φ) x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)))

Logical form (Lean):

```lean
def IsSeqCompactR (K : Set ℝ) : Prop :=
  ∀ x : ℕ → ℝ, (∀ n, x n ∈ K) →
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L ∈ K, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)
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
def IsSeqCompactR (K : Set ℝ) : Prop :=
  ∀ x : ℕ → ℝ, (∀ n, x n ∈ K) →
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L ∈ K, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)

/--
`SequentialCompactnessIffOpenCoverCompactness` TODO

Predicate logic:

  IsSeqCompactR K ↔ IsCompactR K

Predicate logic (unfolded):

  ∀ (K : Real → Prop), ∀ (x : Nat → Real), (∀ (n : Nat), Set.instMembership.1 K (x n)) → Exists fun φ => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (φ a) (φ b) ∧ Exists fun L => (Set.instMembership.1 K L ∧ Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.mem Filter.atTop.sets (Set.preimage (Function.comp x φ) x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) ↔ ∀ (ι : Type) (U : ι → Real → Prop), (∀ (i : ι) (x : Real), Set.instMembership.1 (U i) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (y : Real), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) r → Set.instMembership.1 (U i) y)) → Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x)) → Exists fun J => Set.instLE.1 K (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => Set.iUnion fun h => U i) y = x))

Logical form (Lean):

```lean
theorem SequentialCompactnessIffOpenCoverCompactness (K : Set ℝ) :
    IsSeqCompactR K ↔ IsCompactR K
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
theorem SequentialCompactnessIffOpenCoverCompactness (K : Set ℝ) :
    IsSeqCompactR K ↔ IsCompactR K := by
  sorry
end LRA.Analysis.StructureOfRealLine
