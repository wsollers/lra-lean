
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

  ((∀ (x y : Real), GE.ge (LRA.Analysis.StructureOfRealLine.dist' x y) 0) ∧ ((∀ (x y : Real), LRA.Analysis.StructureOfRealLine.dist' x y = 0 ↔ x = y) ∧ ((∀ (x y : Real), LRA.Analysis.StructureOfRealLine.dist' x y = LRA.Analysis.StructureOfRealLine.dist' y x) ∧ (∀ (x y z : Real), Real.instLE.le (LRA.Analysis.StructureOfRealLine.dist' x z) (instHAdd.hAdd (LRA.Analysis.StructureOfRealLine.dist' x y) (LRA.Analysis.StructureOfRealLine.dist' y z))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x y : Real), GE.ge (LRA.Analysis.StructureOfRealLine.dist' x y) 0) ∧ ((∀ (x y : Real), LRA.Analysis.StructureOfRealLine.dist' x y = 0 ↔ x = y) ∧ ((∀ (x y : Real), LRA.Analysis.StructureOfRealLine.dist' x y = LRA.Analysis.StructureOfRealLine.dist' y x) ∧ (∀ (x y z : Real), Real.instLE.le (LRA.Analysis.StructureOfRealLine.dist' x z) (instHAdd.hAdd (LRA.Analysis.StructureOfRealLine.dist' x y) (LRA.Analysis.StructureOfRealLine.dist' y z))))))

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

  ∀ (A : Set Real), (A.Nonempty ∧ BddAbove A) → Exists fun s => IsLUB A s

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => x ∈ A ∧ (Exists fun x => x ∈ fun x => ∀ ⦃a : Real⦄, a ∈ A → Real.instLE.le a x)) → Exists fun s => ((s ∈ fun x => ∀ ⦃a : Real⦄, a ∈ A → Real.instLE.le a x) ∧ (s ∈ fun x => ∀ ⦃a : Real⦄, a ∈ upperBounds A → Real.instLE.le x a))

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

  ∀ (a b : Real), (GT.gt a 0 ∧ GT.gt b 0) → GT.gt (Real.instMin.min a b) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    ha : a > 0
    hb : b > 0
  Prove
    (Real.instLT.lt 0 a ∧ Real.instLT.lt 0 b) → Real.instLT.lt 0 (Real.instMin.1 a b)

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

  ∀ (ε : Real), GT.gt ε 0 → GT.gt (instHDiv.hDiv ε 2) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    ε : ℝ
    hε : ε > 0
  Prove
    Real.instLT.lt 0 ε → Real.instLT.lt 0 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ε 2)

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

  ∀ (ε : Real), GT.gt ε 0 → instHAdd.hAdd (instHDiv.hDiv ε 2) (instHDiv.hDiv ε 2) = ε

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    ε : ℝ
    hε : ε > 0
  Prove
    Real.instLT.lt 0 ε → { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ε 2) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ε 2) = ε

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

  ∀ (δ a b : Real), (Real.instLT.lt 0 δ ∧ (Real.instLE.le δ a ∧ Real.instLE.le δ b)) → Real.instLE.le δ (Real.instMin.min a b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    δ a b : ℝ
  Prove
    (Real.instLT.lt 0 δ ∧ (Real.instLE.le δ a ∧ Real.instLE.le δ b)) → Real.instLE.le δ (Real.instMin.1 a b)

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

  ∀ (ε c : Real), (GT.gt ε 0 ∧ GT.gt c 0) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (Real.instLT.lt δ ε ∧ Real.instLT.lt δ c))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    ε c : ℝ
    hε : ε > 0
    hc : c > 0
  Prove
    (Real.instLT.lt 0 ε ∧ Real.instLT.lt 0 c) → Exists fun δ => (Real.instLT.lt 0 δ ∧ (Real.instLT.lt δ ε ∧ Real.instLT.lt δ c))

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

  ∀ (x : Real), abs x = LRA.Analysis.StructureOfRealLine.dist' x 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : ℝ
  Prove
    abs x = abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x 0)

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

  ∀ (A : Set Real), Exists fun M => (GT.gt M 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs x) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs x) M))

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

  ∀ (A B : Set Real), A ∪ B = B ∪ A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    A ∪ B = B ∪ A

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
