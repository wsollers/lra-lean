
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Monotonicity
import LRA.Analysis.Sequences.LiminfLimsup
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Sequences

open LRA.Analysis.Bounds (IsSupremum IsInfimum)

/--
`IncreasingSequenceLimitAsSupremum` TODO

Predicate logic:

  (IsIncreasing x ∧ IsSupremum S (Set.range x)) → ConvergesTo x S

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {S : Real}, (∀ (n : Nat), Real.instLE.1 (x n) (x (instHAdd.1 n (instOfNatNat 1).1)) ∧ (Exists fun M => ∀ (n : Nat), Real.instLE.1 (x n) M ∧ (∀ (x_1 : Real), Set.instMembership.1 (fun x_2 => Exists fun y => x y = x_2)x_1 → Real.instPreorder.toLE.1 x_1 S ∧ ∀ (u : Real), (∀ (x_1 : Real), Set.instMembership.1 (fun x_2 => Exists fun y => x y = x_2)x_1 → Real.instPreorder.toLE.1 x_1 u) → Real.instPreorder.toLE.1 S u))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) S))) ε

Logical form (Lean):

```lean
theorem IncreasingSequenceLimitAsSupremum {x : RealSequence} {S : ℝ}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x)
    (hS : IsSupremum S (Set.range x)) : ConvergesTo x S
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
theorem IncreasingSequenceLimitAsSupremum {x : RealSequence} {S : ℝ}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x)
    (hS : IsSupremum S (Set.range x)) : ConvergesTo x S := by
  sorry

/--
`DecreasingSequenceLimitAsInfimum` TODO

Predicate logic:

  (IsDecreasing x ∧ IsInfimum I (Set.range x)) → ConvergesTo x I

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {I : Real}, (∀ (n : Nat), Real.instLE.1 (x (instHAdd.1 n (instOfNatNat 1).1)) (x n) ∧ (Exists fun m => ∀ (n : Nat), Real.instLE.1 m (x n) ∧ (∀ (x_1 : Real), Set.instMembership.1 (fun x_2 => Exists fun y => x y = x_2)x_1 → Real.instPreorder.toLE.1 I x_1 ∧ ∀ (l : Real), (∀ (x_1 : Real), Set.instMembership.1 (fun x_2 => Exists fun y => x y = x_2)x_1 → Real.instPreorder.toLE.1 l x_1) → Real.instPreorder.toLE.1 l I))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) I))) ε

Logical form (Lean):

```lean
theorem DecreasingSequenceLimitAsInfimum {x : RealSequence} {I : ℝ}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x)
    (hI : IsInfimum I (Set.range x)) : ConvergesTo x I
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
theorem DecreasingSequenceLimitAsInfimum {x : RealSequence} {I : ℝ}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x)
    (hI : IsInfimum I (Set.range x)) : ConvergesTo x I := by
  sorry

/--
`TailSupremaInfimaConverge` TODO

Predicate logic:

  ∃ hSup ∈ BoundedAboveSeq x, ∃ S ∈ ℝ, ConvergesTo (TailSupSeq x hSup S) ∧ ∃ hInf ∈ BoundedBelowSeq x, ∃ I ∈ ℝ, ConvergesTo (TailInfSeq x hInf I)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → (Exists fun hSup => Exists fun S => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Real.instSupSet.sSup (Set.image x (setOf fun k => instLENat.le n k))) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x hSup n) S))) ε ∧ Exists fun hInf => Exists fun I => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Real.instInfSet.sInf (Set.image x (setOf fun k => instLENat.le n k))) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x hInf n) I))) ε)

Logical form (Lean):

```lean
theorem TailSupremaInfimaConverge {x : RealSequence} (h : BoundedSeq x) :
    (∃ hSup : BoundedAboveSeq x, ∃ S : ℝ, ConvergesTo (TailSupSeq x hSup) S) ∧
      (∃ hInf : BoundedBelowSeq x, ∃ I : ℝ, ConvergesTo (TailInfSeq x hInf) I)
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
theorem TailSupremaInfimaConverge {x : RealSequence} (h : BoundedSeq x) :
    (∃ hSup : BoundedAboveSeq x, ∃ S : ℝ, ConvergesTo (TailSupSeq x hSup) S) ∧
      (∃ hInf : BoundedBelowSeq x, ∃ I : ℝ, ConvergesTo (TailInfSeq x hInf) I) := by
  sorry

/--
`BoundedSequenceLimsupLiminf` TODO

Predicate logic:

  ∃ S ∈ ℝ, LimsupSeq x S ∧ ∃ I ∈ ℝ, LiminfSeq x I

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → (Exists fun S => Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) S))) ε ∧ Exists fun I => Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) I))) ε)

Logical form (Lean):

```lean
theorem BoundedSequenceLimsupLiminf {x : RealSequence} (h : BoundedSeq x) :
    (∃ S : ℝ, LimsupSeq x S) ∧ (∃ I : ℝ, LiminfSeq x I)
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
theorem BoundedSequenceLimsupLiminf {x : RealSequence} (h : BoundedSeq x) :
    (∃ S : ℝ, LimsupSeq x S) ∧ (∃ I : ℝ, LiminfSeq x I) := by
  sorry

end LRA.Analysis.Sequences
