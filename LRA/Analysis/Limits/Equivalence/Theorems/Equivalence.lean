import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

/--
`TendstoIffOneSidedAgree` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), LRA.Analysis.Limits.TendsTo f A c L ↔ (LRA.Analysis.Limits.TendsToLeft f A c L ∧ LRA.Analysis.Limits.TendsToRight f A c L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c L : ℝ
  Prove
    LRA.Analysis.Limits.TendsTo f A c L ↔ (LRA.Analysis.Limits.TendsToLeft f A c L ∧ LRA.Analysis.Limits.TendsToRight f A c L)

Logical form (Lean):

```lean
theorem TendstoIffOneSidedAgree (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L
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
theorem TendstoIffOneSidedAgree (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L := by
  sorry
/--
`SequentialCriterionTendsto` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), LRA.Analysis.Limits.TendsTo f A c L ↔ ∀ (xs : Nat → Real), LRA.Analysis.Limits.ApproachesButNotEqual xs A c → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) L)) ε

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c L : ℝ
  Prove
    LRA.Analysis.Limits.TendsTo f A c L ↔ ∀ (xs : Nat → Real), LRA.Analysis.Limits.ApproachesButNotEqual xs A c → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) L)) ε

Logical form (Lean):

```lean
theorem SequentialCriterionTendsto (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem SequentialCriterionTendsto (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε := by
  sorry
/--
`TendstoIffNeighbourhood` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), LRA.Analysis.Limits.TendsTo f A c L ↔ ∀ (εNbhd : Set Real), (Exists fun ε => (GT.gt ε 0 ∧ εNbhd = Set.Ioo (instHSub.hSub L ε) (instHAdd.hAdd L ε))) → Exists fun δNbhd => ((Exists fun δ => (GT.gt δ 0 ∧ δNbhd = Set.Ioo (instHSub.hSub c δ) (instHAdd.hAdd c δ) \ Set.instSingletonSet.singleton c)) ∧ (∀ (x : Real), x ∈ δNbhd ∩ A → f x ∈ εNbhd))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c L : ℝ
  Prove
    LRA.Analysis.Limits.TendsTo f A c L ↔ ∀ (εNbhd : Set Real), (Exists fun ε => (GT.gt ε 0 ∧ εNbhd = Set.Ioo (instHSub.hSub L ε) (instHAdd.hAdd L ε))) → Exists fun δNbhd => ((Exists fun δ => (GT.gt δ 0 ∧ δNbhd = Set.Ioo (instHSub.hSub c δ) (instHAdd.hAdd c δ) \ Set.instSingletonSet.singleton c)) ∧ (∀ (x : Real), x ∈ δNbhd ∩ A → f x ∈ εNbhd))

Logical form (Lean):

```lean
theorem TendstoIffNeighbourhood (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd
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
theorem TendstoIffNeighbourhood (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd := by
  sorry
/--
`TendstoCharacterizationsTFAE` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L : Real), (List.cons (LRA.Analysis.Limits.TendsTo f A c L) (List.cons ((LRA.Analysis.Limits.TendsToLeft f A c L ∧ LRA.Analysis.Limits.TendsToRight f A c L)) (List.cons (∀ (xs : Nat → Real), LRA.Analysis.Limits.ApproachesButNotEqual xs A c → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) L)) ε) (List.cons (∀ (εNbhd : Set Real), (Exists fun ε => (GT.gt ε 0 ∧ εNbhd = Set.Ioo (instHSub.hSub L ε) (instHAdd.hAdd L ε))) → Exists fun δNbhd => ((Exists fun δ => (GT.gt δ 0 ∧ δNbhd = Set.Ioo (instHSub.hSub c δ) (instHAdd.hAdd c δ) \ Set.instSingletonSet.singleton c)) ∧ (∀ (x : Real), x ∈ δNbhd ∩ A → f x ∈ εNbhd))) List.nil)))).TFAE

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c L : ℝ
  Prove
    List.x ∈ List.cons (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) (List.cons (((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))))) (List.cons (∀ (xs : Nat → Real), ((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (n : Nat), xs n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f (xs n)) L)) ε) (List.cons (∀ (εNbhd : Real → Prop), (Exists fun ε => (Real.instLT.lt 0 ε ∧ (εNbhd = funx => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub L ε) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L ε))))) → Exists fun δNbhd => ((Exists fun δ => (Real.instLT.lt 0 δ ∧ (δNbhd = fun x => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ)) \ Set.instSingletonSet.1 c))) ∧ (∀ (x : Real), x ∈ δNbhd ∩ A → f x ∈ εNbhd))) List.nil))) → ∀ (y : Prop), List.y ∈ List.cons (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) (List.cons (((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))))) (List.cons (∀ (xs : Nat → Real), ((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (n : Nat), xs n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f (xs n)) L)) ε) (List.cons (∀ (εNbhd : Real → Prop), (Exists fun ε => (Real.instLT.lt 0 ε ∧ (εNbhd = funx => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub L ε) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L ε))))) → Exists fun δNbhd => ((Exists fun δ => (Real.instLT.lt 0 δ ∧ (δNbhd = fun x => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ)) \ Set.instSingletonSet.1 c))) ∧ (∀ (x : Real), x ∈ δNbhd ∩ A → f x ∈ εNbhd))) List.nil))) → x ↔ y

Logical form (Lean):

```lean
theorem TendstoCharacterizationsTFAE (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    [TendsTo f A c L,
      TendsToLeft f A c L ∧ TendsToRight f A c L,
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε,
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd].TFAE
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
theorem TendstoCharacterizationsTFAE (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    [TendsTo f A c L,
      TendsToLeft f A c L ∧ TendsToRight f A c L,
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε,
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd].TFAE := by
  sorry
end LRA.Analysis.Limits
