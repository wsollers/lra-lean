import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

/--
`TendstoIffOneSidedAgree` TODO

Predicate logic:

  (ℝ → ℝ) → TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ↔ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε))

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

  (ℝ → ℝ) → TendsTo f A c L ↔ ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c → ∀ ε > 0, ∃ N ∈ ℕ, ∀ n ≥ N, |f (xs n) - L| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ↔ ∀ (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (n : Nat), xs n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f (xs n)) L))) ε

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

  (ℝ → ℝ) → TendsTo f A c L ↔ ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) → ∃ δNbhd ∈ Set ℝ, (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧ ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε) ↔ ∀ (εNbhd : Real → Prop), (Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ εNbhd = funx => (Real.instPreorder.toLT.1 (instHSub.1 L ε) x ∧ Real.instPreorder.toLT.1 x (instHAdd.1 L ε)))) → Exists fun δNbhd => (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ δNbhd = Set.instSDiff.1 (fun x => (Real.instPreorder.toLT.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLT.1 x (instHAdd.1 c δ))) (Set.instSingletonSet.1 c)) ∧ ∀ (x : Real), Set.instMembership.1 (Set.instInter.1 δNbhd A) x → Set.instMembership.1 εNbhd (f x))

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

  (ℝ → ℝ) → [TendsTo f A c L, TendsToLeft f A c L ∧ TendsToRight f A c L, ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c → ∀ ε > 0, ∃ N ∈ ℕ, ∀ n ≥ N, |f (xs n) - L| < ε, ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) → ∃ δNbhd ∈ Set ℝ, (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧ ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd].TFAE

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L : Real) (x : Prop), List.instMembership.1 (List.cons (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε)) (List.cons ((∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε))) (List.cons (∀ (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (n : Nat), xs n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (xs n) c))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f (xs n)) L))) ε) (List.cons (∀ (εNbhd : Real → Prop), (Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ εNbhd = funx => (Real.instPreorder.toLT.1 (instHSub.1 L ε) x ∧ Real.instPreorder.toLT.1 x (instHAdd.1 L ε)))) → Exists fun δNbhd => (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ δNbhd = Set.instSDiff.1 (fun x => (Real.instPreorder.toLT.1 (instHSub.hSub c δ) x ∧ Real.instPreorder.toLT.1 x (instHAdd.hAdd c δ))) (Set.instSingletonSet.1 c)) ∧ ∀ (x : Real), Set.instMembership.1 (Set.instInter.1 δNbhd A) x → Set.instMembership.1 εNbhd (f x))) List.nil)))) x → ∀ (y : Prop), List.instMembership.1 (List.cons (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε)) (List.cons ((∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε))) (List.cons (∀ (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (n : Nat), xs n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (xs n) c))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f (xs n)) L))) ε) (List.cons (∀ (εNbhd : Real → Prop), (Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ εNbhd = funx => (Real.instPreorder.toLT.1 (instHSub.1 L ε) x ∧ Real.instPreorder.toLT.1 x (instHAdd.1 L ε)))) → Exists fun δNbhd => (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ δNbhd = Set.instSDiff.1 (fun x => (Real.instPreorder.toLT.1 (instHSub.hSub c δ) x ∧ Real.instPreorder.toLT.1 x (instHAdd.hAdd c δ))) (Set.instSingletonSet.1 c)) ∧ ∀ (x : Real), Set.instMembership.1 (Set.instInter.1 δNbhd A) x → Set.instMembership.1 εNbhd (f x))) List.nil)))) y → x ↔ y

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
