
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Continuity

/--
`RelativeNeighborhood` TODO

Predicate logic:

  ∀ (A : Set Real) (c ε a : Real), (Set.instMembership.mem A a ∧ Real.instLT.lt (abs (instHSub.hSub a c)) ε)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (c ε a : Real), (Set.instMembership.1 A a ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 a c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 a c))) ε)

Logical form (Lean):

```lean
def RelativeNeighborhood (A : Set ℝ) (c ε : ℝ) : Set ℝ :=
  {x ∈ A | |x - c| < ε}
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
def RelativeNeighborhood (A : Set ℝ) (c ε : ℝ) : Set ℝ :=
  {x ∈ A | |x - c| < ε}

/--
`ContinuousAtPoint` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε)

Logical form (Lean):

```lean
def ContinuousAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → |f x - f c| < ε
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
def ContinuousAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → |f x - f c| < ε

/--
`ContinuousAtPointNbhd` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood A c δ) x → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε)

Logical form (Lean):

```lean
def ContinuousAtPointNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ RelativeNeighborhood A c δ, |f x - f c| < ε
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
def ContinuousAtPointNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ RelativeNeighborhood A c δ, |f x - f c| < ε

/--
`ContinuousAtPointIffNbhd` TODO

Predicate logic:

  (ℝ → ℝ) → ContinuousAtPoint f A c ↔ ContinuousAtPointNbhd f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε) ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε)

Logical form (Lean):

```lean
theorem ContinuousAtPointIffNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointNbhd f A c
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
theorem ContinuousAtPointIffNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointNbhd f A c := by
  sorry

/--
`ContinuousAtPointSeq` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real) (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.mem A (xs n) ∧ ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) c)) ε) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) (f c))) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real) (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f (xs n)) (f c)))) ε

Logical form (Lean):

```lean
def ContinuousAtPointSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε
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
def ContinuousAtPointSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε

/--
`ContinuousAtPointIffSeq` TODO

Predicate logic:

  (ℝ → ℝ ∧ c ∈ A) → ContinuousAtPoint f A c ↔ ContinuousAtPointSeq f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Set.instMembership.1 A c → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε) ↔ ∀ (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n)) → (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f (xs n)) (f c)))) ε

Logical form (Lean):

```lean
theorem ContinuousAtPointIffSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointSeq f A c
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
theorem ContinuousAtPointIffSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointSeq f A c := by
  sorry

/--
`PointOfDiscontinuity` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ ¬ LRA.Analysis.Continuity.ContinuousAtPoint f A c)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) (f c)))) ε)) → False)

Logical form (Lean):

```lean
def PointOfDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ¬ ContinuousAtPoint f A c
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
def PointOfDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ¬ ContinuousAtPoint f A c

/--
`SequentialDiscontinuity` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ Exists fun xs => (∀ (n : Nat), Set.instMembership.mem A (xs n) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) c)) ε ∧ ¬ ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) (f c))) ε)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ Exists fun xs => (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f (xs n)) (f c)))) ε) → False)))

Logical form (Lean):

```lean
def SequentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ xs : ℕ → ℝ, (∀ n, xs n ∈ A) ∧
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) ∧
    ¬ (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε)
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
def SequentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ xs : ℕ → ℝ, (∀ n, xs n ∈ A) ∧
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) ∧
    ¬ (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε)

/--
`DiscontinuityIffSequential` TODO

Predicate logic:

  (ℝ → ℝ) → PointOfDiscontinuity f A c ↔ SequentialDiscontinuity f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) (f c)))) ε)) → False) ↔ (Set.instMembership.1 A c ∧ Exists fun xs => (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f (xs n)) (f c)))) ε) → False)))

Logical form (Lean):

```lean
theorem DiscontinuityIffSequential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ SequentialDiscontinuity f A c
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
theorem DiscontinuityIffSequential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ SequentialDiscontinuity f A c := by
  sorry

/--
`NeighborhoodDiscontinuity` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ Exists fun ε => (GT.gt ε 0 ∧ ∀ (δ : Real), GT.gt δ 0 → Exists fun x => (Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood A c δ) x ∧ GE.ge (abs (instHSub.hSub (f x) (f c))) ε)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x ∧ Real.instLE.1 ε (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))))))

Logical form (Lean):

```lean
def NeighborhoodDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ ε > 0, ∀ δ > 0, ∃ x ∈ RelativeNeighborhood A c δ, |f x - f c| ≥ ε
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
def NeighborhoodDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ ε > 0, ∀ δ > 0, ∃ x ∈ RelativeNeighborhood A c δ, |f x - f c| ≥ ε

/--
`DiscontinuityIffNeighborhood` TODO

Predicate logic:

  (ℝ → ℝ) → PointOfDiscontinuity f A c ↔ NeighborhoodDiscontinuity f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) (f c)))) ε)) → False) ↔ (Set.instMembership.1 A c ∧ Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x ∧ Real.instLE.1 ε (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) (f c)))))))

Logical form (Lean):

```lean
theorem DiscontinuityIffNeighborhood (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ NeighborhoodDiscontinuity f A c
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
theorem DiscontinuityIffNeighborhood (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ NeighborhoodDiscontinuity f A c := by
  sorry

/--
`IsRemovableDiscontinuity` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ Exists fun L => (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε) ∧ Ne (f c) L)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ Exists fun L => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ∧ f c = L → False)))

Logical form (Lean):

```lean
def IsRemovableDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε) ∧
    f c ≠ L
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
def IsRemovableDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε) ∧
    f c ≠ L

/--
`IsJumpDiscontinuity` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L₁)) ε) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L₂)) ε) ∧ Or (Ne L₁ L₂) (Ne (f c) L₁))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε) ∧ Or (L₁ = L₂ → False) (f c = L₁ → False))))

Logical form (Lean):

```lean
def IsJumpDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L₂| < ε) ∧
    (L₁ ≠ L₂ ∨ f c ≠ L₁)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use, unfold

-/
def IsJumpDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L₂| < ε) ∧
    (L₁ ≠ L₂ ∨ f c ≠ L₁)

/--
`IsEssentialDiscontinuity` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (LRA.Analysis.Continuity.PointOfDiscontinuity f A c ∧ (¬ LRA.Analysis.Continuity.IsRemovableDiscontinuity f A c ∧ ¬ LRA.Analysis.Continuity.IsJumpDiscontinuity f A c))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), ((Set.instMembership.1 A c ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) (f c)))) ε)) → False) ∧ ((Set.instMembership.1 A c ∧ Exists fun L => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L))) ε) ∧ f c = L → False))) → False ∧ (Set.instMembership.1 A c ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L₂))) ε) ∧ Or (L₁ = L₂ → False) (f c = L₁ → False)))) → False))

Logical form (Lean):

```lean
def IsEssentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  PointOfDiscontinuity f A c ∧
    ¬ IsRemovableDiscontinuity f A c ∧
    ¬ IsJumpDiscontinuity f A c
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
def IsEssentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  PointOfDiscontinuity f A c ∧
    ¬ IsRemovableDiscontinuity f A c ∧
    ¬ IsJumpDiscontinuity f A c

/--
`JumpDiscontinuityNotEssential` TODO

Predicate logic:

  (ℝ → ℝ ∧ IsJumpDiscontinuity f A c) → ¬ IsEssentialDiscontinuity f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), ((Set.instMembership.1 A c ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε) ∧ Or (L₁ = L₂ → False) (f c = L₁ → False)))) ∧ ((Set.instMembership.1 A c ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (abs (instHSub.hSub x c)) δ → Real.instLT.1 (abs (instHSub.hSub (f x) (f c))) ε)) → False) ∧ ((Set.instMembership.1 A c ∧ Exists fun L => (∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε) ∧ (∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε) ∧ f c = L → False))) → False ∧ (Set.instMembership.1 A c ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L₂))) ε) ∧ Or (L₁ = L₂ → False) (f c = L₁ → False)))) → False))) → False

Logical form (Lean):

```lean
theorem JumpDiscontinuityNotEssential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsJumpDiscontinuity f A c) : ¬ IsEssentialDiscontinuity f A c
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
theorem JumpDiscontinuityNotEssential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsJumpDiscontinuity f A c) : ¬ IsEssentialDiscontinuity f A c := by
  sorry

/--
`OscillationOnSet` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (ω : Real), (Real.instLE.le 0 ω ∧ (∀ (x : Real), Set.instMembership.mem A x → ∀ (y : Real), Set.instMembership.mem A y → Real.instLE.le (abs (instHSub.hSub (f x) (f y))) ω ∧ ∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b ω → Exists fun x => (Set.instMembership.mem A x ∧ Exists fun y => (Set.instMembership.mem A y ∧ Real.instLT.lt b (abs (instHSub.hSub (f x) (f y)))))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (ω : Real), (Real.instLE.1 Zero.toOfNat0.1 ω ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ω ∧ ∀ (b : Real), Real.instLE.1 Zero.toOfNat0.1 b → Real.instLT.1 b ω → Exists fun x => (Set.instMembership.1 A x ∧ Exists fun y => (Set.instMembership.1 A y ∧ Real.instLT.1 b (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y))))))))

Logical form (Lean):

```lean
def OscillationOnSet (f : ℝ → ℝ) (A : Set ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ ω) ∧
    ∀ b, 0 ≤ b → b < ω -> ∃ x ∈ A, ∃ y ∈ A, b < |f x - f y|
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
def OscillationOnSet (f : ℝ → ℝ) (A : Set ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ ω) ∧
    ∀ b, 0 ≤ b → b < ω -> ∃ x ∈ A, ∃ y ∈ A, b < |f x - f y|

/--
`OscillationAtPoint` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c ω : Real), (Real.instLE.le 0 ω ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ Exists fun Ω => (LRA.Analysis.Continuity.OscillationOnSet f (LRA.Analysis.Continuity.RelativeNeighborhood A c δ) Ω ∧ Real.instLT.lt Ω (instHAdd.hAdd ω ε))) ∧ ∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b ω → ∀ (δ : Real), GT.gt δ 0 → Exists fun Ω => (LRA.Analysis.Continuity.OscillationOnSet f (LRA.Analysis.Continuity.RelativeNeighborhood A c δ) Ω ∧ Real.instLT.lt b Ω)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c ω : Real), (Real.instLE.1 Zero.toOfNat0.1 ω ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun Ω => ((Real.instLE.1 Zero.toOfNat0.1 Ω ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) Ω ∧ ∀ (b : Real), Real.instLE.1 Zero.toOfNat0.1 b → Real.instLT.1 b Ω → Exists fun x => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x ∧ Exists fun y => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) y ∧ Real.instLT.1 b (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))))))) ∧ Real.instLT.1 Ω (instHAdd.1 ω ε))) ∧ ∀ (b : Real), Real.instLE.1 Zero.toOfNat0.1 b → Real.instLT.1 b ω → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun Ω => ((Real.instLE.1 Zero.toOfNat0.1 Ω ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) Ω ∧ ∀ (b : Real), Real.instLE.1 Zero.toOfNat0.1 b → Real.instLT.1 b Ω → Exists fun x => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) x ∧ Exists fun y => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) y ∧ Real.instLT.1 b (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))))))) ∧ Real.instLT.1 b Ω)))

Logical form (Lean):

```lean
def OscillationAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ ε > 0, ∃ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ Ω < ω + ε) ∧
    (∀ b, 0 ≤ b → b < ω -> ∀ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ b < Ω)
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
def OscillationAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ ε > 0, ∃ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ Ω < ω + ε) ∧
    (∀ b, 0 ≤ b → b < ω -> ∀ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ b < Ω)

/--
`ContinuousAtPointIffZeroOscillation` TODO

Predicate logic:

  (ℝ → ℝ ∧ c ∈ A) → ContinuousAtPoint f A c ↔ OscillationAtPoint f A c 0

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Set.instMembership.1 A c → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε) ↔ (Real.instLE.1 Zero.toOfNat0.1 Zero.toOfNat0.1 ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun Ω => ((Real.instLE.1 Zero.toOfNat0.1 Ω ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) (f y)))) Ω ∧ ∀ (b : Real), Real.instLE.1 Zero.toOfNat0.1 b → Real.instLT.1 b Ω → Exists fun x => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) x ∧ Exists fun y => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) y ∧ Real.instLT.1 b (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) (f y)))))))) ∧ Real.instLT.1 Ω (instHAdd.1 Zero.toOfNat0.1 ε))) ∧ ∀ (b : Real), Real.instLE.1 Zero.toOfNat0.1 b → Real.instLT.1 b Zero.toOfNat0.1 → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun Ω => ((Real.instLE.1 Zero.toOfNat0.1 Ω ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) (f y)))) Ω ∧ ∀ (b : Real), Real.instLE.1 Zero.toOfNat0.1 b → Real.instLT.1 b Ω → Exists fun x => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) x ∧ Exists fun y => (Set.instMembership.1 (fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 (abs (instHSub.hSub x c)) δ)) y ∧ Real.instLT.1 b (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) (f y)))))))) ∧ Real.instLT.1 b Ω)))

Logical form (Lean):

```lean
theorem ContinuousAtPointIffZeroOscillation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ OscillationAtPoint f A c 0
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
theorem ContinuousAtPointIffZeroOscillation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ OscillationAtPoint f A c 0 := by
  sorry

/--
`DiscontinuitySetEqUnionOscillationBounded` TODO

Predicate logic:

  (ℝ → ℝ) → {c ∈ A | PointOfDiscontinuity f A c} = ⋃ n : ℕ, {c ∈ A | ∃ ω ∈ ℝ, OscillationAtPoint f A c ω ∧ 1 / n + 1 ∈ ℝ ≤ ω}

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), fun c => (Set.instMembership.1 A c ∧ (Set.instMembership.1 A c ∧ (∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) (f c)))) ε)) → False)) = Set.instSupSet.1 fun x => Exists fun y => (fun n c => (Set.instMembership.mem A c ∧ Exists fun ω => (LRA.Analysis.Continuity.OscillationAtPoint f A c ω ∧ Real.instLE.le (instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1)) ω))) y = x

Logical form (Lean):

```lean
theorem DiscontinuitySetEqUnionOscillationBounded (f : ℝ → ℝ) (A : Set ℝ) :
    {c ∈ A | PointOfDiscontinuity f A c} =
      ⋃ n : ℕ, {c ∈ A | ∃ ω : ℝ,
        OscillationAtPoint f A c ω ∧ 1 / (n + 1 : ℝ) ≤ ω}
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
theorem DiscontinuitySetEqUnionOscillationBounded (f : ℝ → ℝ) (A : Set ℝ) :
    {c ∈ A | PointOfDiscontinuity f A c} =
      ⋃ n : ℕ, {c ∈ A | ∃ ω : ℝ,
        OscillationAtPoint f A c ω ∧ 1 / (n + 1 : ℝ) ≤ ω} := by
  sorry

end LRA.Analysis.Continuity
