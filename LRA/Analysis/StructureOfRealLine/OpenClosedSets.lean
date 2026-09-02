
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

/--
`OpenBall` TODO

Predicate logic:

  ∀ (x r a : Real), Real.lt✝ (abs (instHSub.hSub x a)) r

Predicate logic (unfolded):

  ∀ (x r a : Real), Real.lt✝ (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) r

Logical form (Lean):

```lean
def OpenBall (x r : ℝ) : Set ℝ := {y | |x - y| < r}
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
def OpenBall (x r : ℝ) : Set ℝ := {y | |x - y| < r}

/--
`IsNeighborhood` TODO

Predicate logic:

  ∀ (N : Set Real) (x : Real), Exists fun r => (GT.gt r 0 ∧ Set.instLE.le (LRA.Analysis.StructureOfRealLine.OpenBall x r) N)

Predicate logic (unfolded):

  ∀ (N : Real → Prop) (x : Real), Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) N)

Logical form (Lean):

```lean
def IsNeighborhood (N : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ N
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
def IsNeighborhood (N : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ N

/--
`IsOpenSet` TODO

Predicate logic:

  ∀ (U : Set Real) (x : Real), Set.instMembership.mem U x → Exists fun r => (GT.gt r 0 ∧ Set.instLE.le (LRA.Analysis.StructureOfRealLine.OpenBall x r) U)

Predicate logic (unfolded):

  ∀ (U : Real → Prop) (x : Real), Set.instMembership.1 U x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) U)

Logical form (Lean):

```lean
def IsOpenSet (U : Set ℝ) : Prop := ∀ x ∈ U, ∃ r > 0, OpenBall x r ⊆ U
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
def IsOpenSet (U : Set ℝ) : Prop := ∀ x ∈ U, ∃ r > 0, OpenBall x r ⊆ U

/--
`OpenIntervalIsOpen` TODO

Predicate logic:

  (a < b) → IsOpenSet (Set.Ioo a b)

Predicate logic (unfolded):

  ∀ (a b : Real), Real.instLT.1 a b → ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b))

Logical form (Lean):

```lean
theorem OpenIntervalIsOpen (a b : ℝ) (hab : a < b) : IsOpenSet (Set.Ioo a b)
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
theorem OpenIntervalIsOpen (a b : ℝ) (hab : a < b) : IsOpenSet (Set.Ioo a b) := by
  sorry
/--
`OpenSetClosureOperations` TODO

Predicate logic:

  IsOpenSet ∅ ∈ Set ℝ ∧ IsOpenSet Set.univ ∈ Set ℝ ∧ (∀ ι ∈ Type U ∈ ι → Set ℝ, (∀ i, IsOpenSet (U i)) → IsOpenSet (⋃ i, U i)) ∧ (∀ n ∈ ℕ U ∈ Fin n → Set ℝ, (∀ i, IsOpenSet (U i)) → IsOpenSet (⋂ i, U i))

Predicate logic (unfolded):

  (∀ (x : Real), Set.instMembership.1 Set.instEmptyCollection.1 x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) Set.instEmptyCollection.1) ∧ (∀ (x : Real), Set.instMembership.1 (fun _a => True) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) fun _a => True) ∧ (∀ (ι : Type) (U : ι → Real → Prop), (∀ (i : ι) (x : Real), Set.instMembership.1 (U i) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) (U i))) → ∀ (x : Real), Set.instMembership.1 (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x))x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x))) ∧ ∀ (n : Nat) (U : Fin n → Real → Prop), (∀ (i : Fin n) (x : Real), Set.instMembership.1 (U i) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) (U i))) → ∀ (x : Real), Set.instMembership.1 (Set.instInfSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x))x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) (Set.instInfSet.1 (setOf fun x => Exists fun y => (fun i => U i) y = x))))))

Logical form (Lean):

```lean
theorem OpenSetClosureOperations :
    IsOpenSet (∅ : Set ℝ) ∧ IsOpenSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (U : ι → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋃ i, U i)) ∧
    (∀ (n : ℕ) (U : Fin n → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋂ i, U i))
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
theorem OpenSetClosureOperations :
    IsOpenSet (∅ : Set ℝ) ∧ IsOpenSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (U : ι → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋃ i, U i)) ∧
    (∀ (n : ℕ) (U : Fin n → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋂ i, U i)) := by
  sorry
/--
`IsClosedSet` TODO

Predicate logic:

  ∀ (F : Set Real) (x : Real), Set.instMembership.mem (Set.instCompl.compl F) x → Exists fun r => (GT.gt r 0 ∧ Set.instLE.le (LRA.Analysis.StructureOfRealLine.OpenBall x r) (Set.instCompl.compl F))

Predicate logic (unfolded):

  ∀ (F : Real → Prop) (x : Real), Set.instMembership.1 (Set.instCompl.1 F) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) (Set.instCompl.1 F))

Logical form (Lean):

```lean
def IsClosedSet (F : Set ℝ) : Prop := IsOpenSet Fᶜ
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
def IsClosedSet (F : Set ℝ) : Prop := IsOpenSet Fᶜ

/--
`ClosedIffContainsLimitPoints` TODO

Predicate logic:

  IsClosedSet F ↔ ∀ x : ℝ, (∀ r > 0, (OpenBall x r \ {x}) ∩ F ≠ ∅) → x ∈ F

Predicate logic (unfolded):

  ∀ (F : Real → Prop), ∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 F) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 F)) ↔ ∀ (x : Real), (∀ (r : Real), Real.instLT.1 Zero.toOfNat0.1 r → Set.instInter.1 (Set.instSDiff.1 (fun y => Real.instLT.lt (abs (instHSub.hSub x y)) r) (Set.instSingletonSet.1 x)) F = Set.instEmptyCollection.1 → False) → Set.instMembership.1 F x

Logical form (Lean):

```lean
theorem ClosedIffContainsLimitPoints (F : Set ℝ) :
    IsClosedSet F ↔ ∀ x : ℝ, (∀ r > 0, (OpenBall x r \ {x}) ∩ F ≠ ∅) → x ∈ F
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
theorem ClosedIffContainsLimitPoints (F : Set ℝ) :
    IsClosedSet F ↔ ∀ x : ℝ, (∀ r > 0, (OpenBall x r \ {x}) ∩ F ≠ ∅) → x ∈ F := by
  sorry
/--
`IsInteriorPoint` TODO

Predicate logic:

  ∀ (A : Set Real) (x : Real), Exists fun r => (GT.gt r 0 ∧ Set.instLE.le (LRA.Analysis.StructureOfRealLine.OpenBall x r) A)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (x : Real), Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) A)

Logical form (Lean):

```lean
def IsInteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ A
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
def IsInteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ A

/--
`IsExteriorPoint` TODO

Predicate logic:

  ∀ (A : Set Real) (x : Real), Exists fun r => (GT.gt r 0 ∧ Set.instLE.le (LRA.Analysis.StructureOfRealLine.OpenBall x r) (Set.instCompl.compl A))

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (x : Real), Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) (Set.instCompl.1 A))

Logical form (Lean):

```lean
def IsExteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ Aᶜ
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
def IsExteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ Aᶜ

/--
`IsBoundaryPoint` TODO

Predicate logic:

  ∀ (A : Set Real) (x : Real), (∀ (r : Real), GT.gt r 0 → Ne (Set.instInter.inter (LRA.Analysis.StructureOfRealLine.OpenBall x r) A) Set.instEmptyCollection.emptyCollection ∧ ∀ (r : Real), GT.gt r 0 → Ne (Set.instInter.inter (LRA.Analysis.StructureOfRealLine.OpenBall x r) (Set.instCompl.compl A)) Set.instEmptyCollection.emptyCollection)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (x : Real), (∀ (r : Real), Real.instLT.1 Zero.toOfNat0.1 r → Set.instInter.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) A = Set.instEmptyCollection.1 → False ∧ ∀ (r : Real), Real.instLT.1 Zero.toOfNat0.1 r → Set.instInter.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 A) = Set.instEmptyCollection.1 → False)

Logical form (Lean):

```lean
def IsBoundaryPoint (A : Set ℝ) (x : ℝ) : Prop :=
  (∀ r > 0, OpenBall x r ∩ A ≠ ∅) ∧ (∀ r > 0, OpenBall x r ∩ Aᶜ ≠ ∅)
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
def IsBoundaryPoint (A : Set ℝ) (x : ℝ) : Prop :=
  (∀ r > 0, OpenBall x r ∩ A ≠ ∅) ∧ (∀ r > 0, OpenBall x r ∩ Aᶜ ≠ ∅)

/--
`Interior'` TODO

Predicate logic:

  ∀ (A : Set Real) (a : Real), Exists fun r => (GT.gt r 0 ∧ Set.instLE.le (LRA.Analysis.StructureOfRealLine.OpenBall a r) A)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (a : Real), Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub a y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub a y))) r) A)

Logical form (Lean):

```lean
def Interior' (A : Set ℝ) : Set ℝ := {x | IsInteriorPoint A x}
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
def Interior' (A : Set ℝ) : Set ℝ := {x | IsInteriorPoint A x}

/--
`IsLimitPoint` TODO

Predicate logic:

  ∀ (A : Set Real) (x r : Real), GT.gt r 0 → Exists fun a => (Set.instMembership.mem A a ∧ (Real.instLT.lt 0 (abs (instHSub.hSub a x)) ∧ Real.instLT.lt (abs (instHSub.hSub a x)) r))

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (x r : Real), Real.instLT.1 Zero.toOfNat0.1 r → Exists fun a => (Set.instMembership.1 A a ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 a x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 a x))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 a x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 a x))) r))

Logical form (Lean):

```lean
def IsLimitPoint (A : Set ℝ) (x : ℝ) : Prop := ∀ r > 0, ∃ a ∈ A, 0 < |a - x| ∧ |a - x| < r
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
def IsLimitPoint (A : Set ℝ) (x : ℝ) : Prop := ∀ r > 0, ∃ a ∈ A, 0 < |a - x| ∧ |a - x| < r

/--
`IsIsolatedPoint` TODO

Predicate logic:

  ∀ (A : Set Real) (x : Real), (Set.instMembership.mem A x ∧ Exists fun r => (GT.gt r 0 ∧ Set.instInter.inter (LRA.Analysis.StructureOfRealLine.OpenBall x r) A = Set.instSingletonSet.singleton x))

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (x : Real), (Set.instMembership.1 A x ∧ Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instInter.1 (fun y => Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))) r) A = Set.instSingletonSet.1 x))

Logical form (Lean):

```lean
def IsIsolatedPoint (A : Set ℝ) (x : ℝ) : Prop :=
  x ∈ A ∧ ∃ r > 0, OpenBall x r ∩ A = {x}
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
def IsIsolatedPoint (A : Set ℝ) (x : ℝ) : Prop :=
  x ∈ A ∧ ∃ r > 0, OpenBall x r ∩ A = {x}

/--
`ClosedSetClosureOperations` TODO

Predicate logic:

  IsClosedSet ∅ ∈ Set ℝ ∧ IsClosedSet Set.univ ∈ Set ℝ ∧ (∀ ι ∈ Type F ∈ ι → Set ℝ, (∀ i, IsClosedSet (F i)) → IsClosedSet (⋂ i, F i)) ∧ (∀ n ∈ ℕ F ∈ Fin n → Set ℝ, (∀ i, IsClosedSet (F i)) → IsClosedSet (⋃ i, F i))

Predicate logic (unfolded):

  (∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 Set.instEmptyCollection.1) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 Set.instEmptyCollection.1)) ∧ (∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 fun _a => True) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 fun _a => True)) ∧ (∀ (ι : Type) (F : ι → Real → Prop), (∀ (i : ι) (x : Real), Set.instMembership.1 (Set.instCompl.1 (F i)) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 (F i)))) → ∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 (Set.instInfSet.sInf (Set.range fun i => F i))) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 (Set.instInfSet.sInf (Set.range fun i => F i)))) ∧ ∀ (n : Nat) (F : Fin n → Real → Prop), (∀ (i : Fin n) (x : Real), Set.instMembership.1 (Set.instCompl.1 (F i)) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 (F i)))) → ∀ (x : Real), Set.instMembership.1 (Set.instCompl.1 (Set.instSupSet.sSup (Set.range fun i => F i))) x → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ Set.instLE.1 (fun y => Real.instLT.1 (abs (instHSub.hSub x y)) r) (Set.instCompl.1 (Set.instSupSet.sSup (Set.range fun i => F i)))))))

Logical form (Lean):

```lean
theorem ClosedSetClosureOperations :
    IsClosedSet (∅ : Set ℝ) ∧ IsClosedSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (F : ι → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋂ i, F i)) ∧
    (∀ (n : ℕ) (F : Fin n → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋃ i, F i))
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
theorem ClosedSetClosureOperations :
    IsClosedSet (∅ : Set ℝ) ∧ IsClosedSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (F : ι → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋂ i, F i)) ∧
    (∀ (n : ℕ) (F : Fin n → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋃ i, F i)) := by
  sorry
end LRA.Analysis.StructureOfRealLine
