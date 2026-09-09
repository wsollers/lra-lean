
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Continuity

/--
`RelativeNeighborhood` TODO

Predicate logic:

  ∀ (A : Set Real) (c ε a : Real), (a ∈ A ∧ Real.instLT.lt (abs (instHSub.hSub a c)) ε)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub a c)) ε)

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

  ∀ (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))

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

  ∀ (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ LRA.Analysis.Continuity.RelativeNeighborhood A c δ → Real.instLT.lt (abs (instHSub.hSub (f x) (f c))) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Continuity.ContinuousAtPoint f A c ↔ LRA.Analysis.Continuity.ContinuousAtPointNbhd f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    LRA.Analysis.Continuity.ContinuousAtPoint f A c ↔ LRA.Analysis.Continuity.ContinuousAtPointNbhd f A c

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real) (xs : Nat → Real), ((∀ (n : Nat), xs n ∈ A) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) c)) ε)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) (f c))) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (n : Nat), xs n ∈ A) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f (xs n)) (f c))) ε

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), c ∈ A → LRA.Analysis.Continuity.ContinuousAtPoint f A c ↔ LRA.Analysis.Continuity.ContinuousAtPointSeq f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    c ∈ A → LRA.Analysis.Continuity.ContinuousAtPoint f A c ↔ LRA.Analysis.Continuity.ContinuousAtPointSeq f A c

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ A ∧ ¬ LRA.Analysis.Continuity.ContinuousAtPoint f A c)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (c ∈ A ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))) → False))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ A ∧ (Exists fun xs => ((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) c)) ε) ∧ (¬ ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) (f c))) ε)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (c ∈ A ∧ (Exists fun xs => ((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f (xs n)) (f c))) ε) → False)))))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Continuity.PointOfDiscontinuity f A c ↔ LRA.Analysis.Continuity.SequentialDiscontinuity f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    LRA.Analysis.Continuity.PointOfDiscontinuity f A c ↔ LRA.Analysis.Continuity.SequentialDiscontinuity f A c

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ A ∧ (Exists fun ε => (GT.gt ε 0 ∧ (∀ (δ : Real), GT.gt δ 0 → Exists fun x => (x ∈ LRA.Analysis.Continuity.RelativeNeighborhood A c δ ∧ GE.ge (abs (instHSub.hSub (f x) (f c))) ε)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (c ∈ A ∧ (Exists fun ε => (Real.instLT.lt 0 ε ∧ (∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun x => ((x ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ)) ∧ Real.instLE.le ε (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))))))))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Continuity.PointOfDiscontinuity f A c ↔ LRA.Analysis.Continuity.NeighborhoodDiscontinuity f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    LRA.Analysis.Continuity.PointOfDiscontinuity f A c ↔ LRA.Analysis.Continuity.NeighborhoodDiscontinuity f A c

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ A ∧ (Exists fun L => ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε))) ∧ ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε))) ∧ Ne (f c) L))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (c ∈ A ∧ (Exists fun L => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (f c = L → False)))))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ A ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L₂)) ε))) ∧ Or (Ne L₁ L₂) (Ne (f c) L₁)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (c ∈ A ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ (Or (L₁ = L₂ → False) (f c = L₁ → False))))))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((c ∈ A ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))) → False)) ∧ (((c ∈ A ∧ (Exists fun L => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (f c = L → False))))) → False) ∧ ((c ∈ A ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ (Or (L₁ = L₂ → False) (f c = L₁ → False)))))) → False)))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Continuity.IsJumpDiscontinuity f A c → ¬ LRA.Analysis.Continuity.IsEssentialDiscontinuity f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    ((c ∈ A ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ (Or (L₁ = L₂ → False) (f c = L₁ → False)))))) ∧ ((c ∈ A ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))) → False)) ∧ (((c ∈ A ∧ (Exists fun L => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (f c = L → False))))) → False) ∧ ((c ∈ A ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ (Or (L₁ = L₂ → False) (f c = L₁ → False)))))) → False)))) → False

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

  ∀ (f : Real → Real) (A : Set Real) (ω : Real), (Real.instLE.le 0 ω ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le (abs (instHSub.hSub (f x) (f y))) ω) ∧ (∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b ω → Exists fun x => (x ∈ A ∧ (Exists fun y => (y ∈ A ∧ Real.instLT.lt b (abs (instHSub.hSub (f x) (f y)))))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le 0 ω ∧ ((∀ (x : Real), x ∈ A → ∀ (y : Real), y ∈ A → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ω) ∧ (∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b ω → Exists fun x => (x ∈ A ∧ (Exists fun y => (y ∈ A ∧ Real.instLT.lt b (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y)))))))))

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

  ∀ (f : Real → Real) (A : Set Real) (c ω : Real), (Real.instLE.le 0 ω ∧ ((∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (Exists fun Ω => (LRA.Analysis.Continuity.OscillationOnSet f (LRA.Analysis.Continuity.RelativeNeighborhood A c δ) Ω ∧ Real.instLT.lt Ω (instHAdd.hAdd ω ε))))) ∧ (∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b ω → ∀ (δ : Real), GT.gt δ 0 → Exists fun Ω => (LRA.Analysis.Continuity.OscillationOnSet f (LRA.Analysis.Continuity.RelativeNeighborhood A c δ) Ω ∧ Real.instLT.lt b Ω))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le 0 ω ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (Exists fun Ω => ((Real.instLE.le 0 Ω ∧ ((∀ (x : Real), x ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → ∀ (y : Real), y ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) Ω) ∧ (∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b Ω → Exists fun x => ((x ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ)) ∧ (Exists fun y => ((y ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ)) ∧ Real.instLT.lt b (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))))))))) ∧ Real.instLT.lt Ω ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ω ε))))) ∧ (∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b ω → ∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun Ω => ((Real.instLE.le 0 Ω ∧ ((∀ (x : Real), x ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → ∀ (y : Real), y ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) Ω) ∧ (∀ (b : Real), Real.instLE.le 0 b → Real.instLT.lt b Ω → Exists fun x => ((x ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ)) ∧ (Exists fun y => ((y ∈ fun x => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ)) ∧ Real.instLT.lt b (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))))))))) ∧ Real.instLT.lt b Ω))))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), c ∈ A → LRA.Analysis.Continuity.ContinuousAtPoint f A c ↔ LRA.Analysis.Continuity.OscillationAtPoint f A c 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    c ∈ A → LRA.Analysis.Continuity.ContinuousAtPoint f A c ↔ LRA.Analysis.Continuity.OscillationAtPoint f A c 0

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

  ∀ (f : Real → Real) (A : Set Real), setOf fun c => (c ∈ A ∧ LRA.Analysis.Continuity.PointOfDiscontinuity f A c) = Set.iUnion fun n => setOf fun c => (c ∈ A ∧ (Exists fun ω => (LRA.Analysis.Continuity.OscillationAtPoint f A c ω ∧ Real.instLE.le (instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1)) ω)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
  Prove
    fun c => (c ∈ A ∧ (c ∈ A ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))) → False))) = Set.instSupSet.1 fun x => Exists fun y => (fun n c => (c ∈ A ∧ (Exists fun ω => (LRA.Analysis.Continuity.OscillationAtPoint f A c ω ∧ Real.instLE.le (instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1)) ω)))) y = x

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
