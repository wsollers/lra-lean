
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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {S : Real}, (LRA.Analysis.Sequences.IsIncreasing x ∧ (LRA.Analysis.Sequences.BoundedAboveSeq x ∧ LRA.Analysis.Bounds.IsSupremum S (Set.range x))) → LRA.Analysis.Sequences.ConvergesTo x S

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    S : ℝ
    hbdd : BoundedAboveSeq x
  Prove
    ((∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) ∧ ((Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M) ∧ ((∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le x_1 S) ∧ (∀ (u : Real), (∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le x_1 u) → Real.instPreorder.1.le S u)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) S)) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {I : Real}, (LRA.Analysis.Sequences.IsDecreasing x ∧ (LRA.Analysis.Sequences.BoundedBelowSeq x ∧ LRA.Analysis.Bounds.IsInfimum I (Set.range x))) → LRA.Analysis.Sequences.ConvergesTo x I

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    I : ℝ
    hbdd : BoundedBelowSeq x
  Prove
    ((∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) ∧ ((Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n)) ∧ ((∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le I x_1) ∧ (∀ (l : Real), (∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le l x_1) → Real.instPreorder.1.le l I)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) I)) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → (Exists fun hSup => Exists fun S => LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.TailSupSeq x hSup) S ∧ Exists fun hInf => Exists fun I => LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.TailInfSeq x hInf) I)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : BoundedSeq x
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → ((Exists fun hSup => Exists fun S => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) S)) ε) ∧ (Exists fun hInf => Exists fun I => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) I)) ε))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → (Exists fun S => LRA.Analysis.Sequences.LimsupSeq x S ∧ Exists fun I => LRA.Analysis.Sequences.LiminfSeq x I)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : BoundedSeq x
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → ((Exists fun S => Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) S)) ε) ∧ (Exists fun I => Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) I)) ε))

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
