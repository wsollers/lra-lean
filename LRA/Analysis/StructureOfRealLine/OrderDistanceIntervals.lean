
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

/--
`dist'` TODO

Predicate logic:

  def dist' (x y : ℝ) : ℝ := |x - y|

Predicate logic (unfolded):

  def dist' (x y : ℝ) : ℝ := |x - y| (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def dist' (x y : ℝ) : ℝ := |x - y|
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
def dist' (x y : ℝ) : ℝ := |x - y|

/--
`IntervalLength` TODO

Predicate logic:

  def IntervalLength (a b : ℝ) (hab : a ≤ b) : ℝ := b - a

Predicate logic (unfolded):

  def IntervalLength (a b : ℝ) (hab : a ≤ b) : ℝ := b - a (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntervalLength (a b : ℝ) (hab : a ≤ b) : ℝ := b - a
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
def IntervalLength (a b : ℝ) (hab : a ≤ b) : ℝ := b - a

/--
`DistanceIsAMetric` TODO

Predicate logic:

  ∀ x y ∈ ℝ, dist' x y ≥ 0 ∧ ∀ x y ∈ ℝ, dist' x y = 0 ↔ x = y ∧ ∀ x y ∈ ℝ, dist' x y = dist' y x ∧ ∀ x y z ∈ ℝ, dist' x z ≤ dist' x y + dist' y z

Predicate logic (unfolded):

  (∀ (x y : Real), Real.instLE.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) ∧ (∀ (x y : Real), SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y)) = Zero.toOfNat0.1 ↔ x = y ∧ (∀ (x y : Real), SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y)) = SemilatticeSup.toMax.1 (instHSub.1 y x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 y x)) ∧ ∀ (x y z : Real), Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 x z) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x z))) (instHAdd.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))) (SemilatticeSup.toMax.1 (instHSub.1 y z) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub y z)))))))

Logical form (Lean):

```lean
theorem DistanceIsAMetric :
    (∀ x y : ℝ, dist' x y ≥ 0) ∧ (∀ x y : ℝ, dist' x y = 0 ↔ x = y) ∧
    (∀ x y : ℝ, dist' x y = dist' y x) ∧
    (∀ x y z : ℝ, dist' x z ≤ dist' x y + dist' y z)
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
theorem DistanceIsAMetric :
    (∀ x y : ℝ, dist' x y ≥ 0) ∧ (∀ x y : ℝ, dist' x y = 0 ↔ x = y) ∧
    (∀ x y : ℝ, dist' x y = dist' y x) ∧
    (∀ x y z : ℝ, dist' x z ≤ dist' x y + dist' y z) := by
  sorry

/--
`RealLineStructuralOrderFacts` TODO

Predicate logic:

  ∀ A ∈ Set ℝ, A.Nonempty → BddAbove A → ∃ s, IsLUB A s

Predicate logic (unfolded):

  ∀ (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 A a → Real.instLE.1 a x) x) → Exists fun s => (Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 A a → Real.instLE.1 a x) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : Real⦄, Set.instMembership.1 (upperBounds A) a → Real.instLE.1 x a) s)

Logical form (Lean):

```lean
theorem RealLineStructuralOrderFacts :
    (∀ A : Set ℝ, A.Nonempty → BddAbove A → ∃ s, IsLUB A s)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem RealLineStructuralOrderFacts :
    (∀ A : Set ℝ, A.Nonempty → BddAbove A → ∃ s, IsLUB A s) := by
  sorry

/--
`MinOfPositiveIsPositive` TODO

Predicate logic:

  min a b > 0

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLT.1 Zero.toOfNat0.1 a ∧ Real.instLT.1 Zero.toOfNat0.1 b) → Real.instLT.1 Zero.toOfNat0.1 (Real.instMin.1 a b)

Logical form (Lean):

```lean
theorem MinOfPositiveIsPositive (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    min a b > 0
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
theorem MinOfPositiveIsPositive (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    min a b > 0 := by
  sorry

/--
`HalfEpsilonIsPositive` TODO

Predicate logic:

  ε / 2 > 0

Predicate logic (unfolded):

  ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Real.instLT.1 Zero.toOfNat0.1 (instHDiv.1 ε instOfNatAtLeastTwo.1)

Logical form (Lean):

```lean
theorem HalfEpsilonIsPositive (ε : ℝ) (hε : ε > 0) : ε / 2 > 0
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
theorem HalfEpsilonIsPositive (ε : ℝ) (hε : ε > 0) : ε / 2 > 0 := by
  sorry

/--
`EpsilonSplitting` TODO

Predicate logic:

  ε / 2 + ε / 2 = ε

Predicate logic (unfolded):

  ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → instHAdd.1 (instHDiv.1 ε instOfNatAtLeastTwo.1) (instHDiv.1 ε instOfNatAtLeastTwo.1) = ε

Logical form (Lean):

```lean
theorem EpsilonSplitting (ε : ℝ) (hε : ε > 0) : ε / 2 + ε / 2 = ε
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
theorem EpsilonSplitting (ε : ℝ) (hε : ε > 0) : ε / 2 + ε / 2 = ε := by
  sorry

/--
`PositiveMinimumBound` TODO

Predicate logic:

  (0 < δ ∧ δ ≤ a ∧ δ ≤ b) → δ ≤ min a b

Predicate logic (unfolded):

  ∀ (δ a b : Real), (Real.instLT.1 Zero.toOfNat0.1 δ ∧ (Real.instLE.1 δ a ∧ Real.instLE.1 δ b)) → Real.instLE.1 δ (Real.instMin.1 a b)

Logical form (Lean):

```lean
theorem PositiveMinimumBound (δ a b : ℝ) (h1 : 0 < δ) (h2 : δ ≤ a) (h3 : δ ≤ b) :
    δ ≤ min a b
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
theorem PositiveMinimumBound (δ a b : ℝ) (h1 : 0 < δ) (h2 : δ ≤ a) (h3 : δ ≤ b) :
    δ ≤ min a b := by
  sorry

/--
`ChoosingSmallerPositive` TODO

Predicate logic:

  ∃ δ, 0 < δ ∧ δ < ε ∧ δ < c

Predicate logic (unfolded):

  ∀ (ε c : Real), (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Real.instLT.1 Zero.toOfNat0.1 c) → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ (Real.instLT.1 δ ε ∧ Real.instLT.1 δ c))

Logical form (Lean):

```lean
theorem ChoosingSmallerPositive (ε c : ℝ) (hε : ε > 0) (hc : c > 0) :
    ∃ δ, 0 < δ ∧ δ < ε ∧ δ < c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem ChoosingSmallerPositive (ε c : ℝ) (hε : ε > 0) (hc : c > 0) :
    ∃ δ, 0 < δ ∧ δ < ε ∧ δ < c := by
  sorry

/--
`AbsIsDistanceToZero` TODO

Predicate logic:

  |x| = dist' x 0

Predicate logic (unfolded):

  ∀ (x : Real), SemilatticeSup.toMax.1 x (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 x) = SemilatticeSup.toMax.1 (instHSub.1 x Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x Zero.toOfNat0.1))

Logical form (Lean):

```lean
theorem AbsIsDistanceToZero (x : ℝ) : |x| = dist' x 0
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
theorem AbsIsDistanceToZero (x : ℝ) : |x| = dist' x 0 := by
  sorry

/--
`IsBoundedSubset` TODO

Predicate logic:

  ∀ (A : Set Real), Exists fun M => (GT.gt M 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (abs x) M)

Predicate logic (unfolded):

  ∀ (A : Real → Prop), Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 x (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 x)) M)

Logical form (Lean):

```lean
def IsBoundedSubset (A : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ A, |x| ≤ M
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
def IsBoundedSubset (A : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ A, |x| ≤ M

/--
`IntervalSetOpsAreOrdinarySetOps` TODO

Predicate logic:

  forall A B : Set ℝ, A ∪ B = B ∪ A

Predicate logic (unfolded):

  ∀ (A B : Real → Prop), Set.instUnion.1 A B = Set.instUnion.1 B A

Logical form (Lean):

```lean
theorem IntervalSetOpsAreOrdinarySetOps :
    forall A B : Set ℝ, A ∪ B = B ∪ A
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
theorem IntervalSetOpsAreOrdinarySetOps :
    forall A B : Set ℝ, A ∪ B = B ∪ A := by
  sorry

end LRA.Analysis.StructureOfRealLine
