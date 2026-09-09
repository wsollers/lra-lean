
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.StructureOfRealLine

/--
`IsOpenR` TODO

Predicate logic:

  ∀ (U : Set Real) (x : Real), x ∈ U → Exists fun r => (GT.gt r 0 ∧ (∀ (y : Real), Real.instLT.lt (abs (instHSub.hSub x y)) r → y ∈ U))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ U → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (y : Real), Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r → y ∈ U))

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

  ∀ (F : Set Real) (x : Real), x ∈ Set.univ \ F → Exists fun r => (GT.gt r 0 ∧ (∀ (y : Real), Real.instLT.lt (abs (instHSub.hSub x y)) r → y ∈ Set.univ \ F))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ fun _a => True \ F → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (y : Real), Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r → y ∈ fun _a => True \ F))

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

  ∀ (K : Set Real) (ι : Type) (U : ι → Set Real), ((∀ (i : ι), LRA.Analysis.StructureOfRealLine.IsOpenR (U i)) ∧ Set.instLE.le K (Set.iUnion fun i => U i)) → Exists fun J => Set.instLE.le K (Set.iUnion fun i => Set.iUnion fun h => U i)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (i : ι) (x : Real), x ∈ U i → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (y : Real), Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r → y ∈ U i))) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun i => U i) y = x))) → Exists fun J => { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun i => iSup fun h => U i) y = x)

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

  ∀ (F K : Set Real), (Set.instLE.le F K ∧ (LRA.Analysis.StructureOfRealLine.IsClosedR F ∧ LRA.Analysis.StructureOfRealLine.IsCompactR K)) → LRA.Analysis.StructureOfRealLine.IsCompactR F

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    F K : Set ℝ
    hFK : F ⊆ K
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le F K) ∧ ((∀ (x : Real), x ∈ fun _a => True \ F → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (y : Real), Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r → y ∈ fun _a => True \ F))) ∧ (∀ (ι : Type) (U : ι → Real → Prop), (∀ (i : ι) (x : Real), x ∈ U i → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (y : Real), Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r → y ∈ U i))) → { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun i => U i) y = x) → Exists fun J => { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le K (Set.instSupSet.1 fun x => Exists fun y => (fun i => Set.iUnion fun h => U i) y = x)))) → ∀ (ι : Type) (U : ι → Real → Prop), ((∀ (i : ι) (x : Real), x ∈ U i → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (y : Real), Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) r → y ∈ U i))) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le F (Set.instSupSet.1 fun x => Exists fun y => (fun i => U i) y = x))) → Exists fun J => { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le F (Set.instSupSet.1 fun x => Exists fun y => (fun i => Set.iUnion fun h => U i) y = x)

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

  ∀ (K : Set Real) (x : Nat → Real), (∀ (n : Nat), x n ∈ K) → Exists fun φ => (StrictMono φ ∧ (Exists fun L => (L ∈ K ∧ Filter.Tendsto (Function.comp x φ) Filter.atTop (nhds L))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (n : Nat), x n ∈ K) → Exists fun φ => ((∀ ⦃a b : Nat⦄, Nat.instPreorder.2.lt a b → Nat.instPreorder.2.lt (φ a) (φ b)) ∧ (Exists fun L => (L ∈ K ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => setOf fun x_2 => Function.comp x φ x_2 ∈ x_1 ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))))

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

  ∀ (K : Set Real), LRA.Analysis.StructureOfRealLine.IsSeqCompactR K ↔ LRA.Analysis.StructureOfRealLine.IsCompactR K

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    K : Set ℝ
  Prove
    LRA.Analysis.StructureOfRealLine.IsSeqCompactR K ↔ LRA.Analysis.StructureOfRealLine.IsCompactR K

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
