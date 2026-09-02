namespace LRA.AlgebraicStructures

universe u

/-- A type has a distinguished successor step `Succ`. Named distinctly from
`Add`/`OfNat 1` since not every carrier of these laws needs a full ring
structure just to have a successor. -/
class HasSuccessor (R : Type u) where
  Succ : R → R

/-- A type has a distinguished predecessor step `Pred`, dual to
`HasSuccessor`. -/
class HasPredecessor (R : Type u) where
  Pred : R → R

def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ

def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred

/-- `n`-fold self-composition of `Succ`, i.e. `Sⁿ`. -/
def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)

/-- Invertibility (dual stepping): `Succ` and `Pred` are mutually inverse.
`SuccInjective`/`PredInjective` are consequences of the two cancellation laws
(if `Succ a = Succ b` then `a = Pred (Succ a) = Pred (Succ b) = b`), kept here
as bundled fields for interface convenience rather than derived separately. -/
class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b

/-- Connects `Succ` to the ring's own `+ 1`, matching definition 3's "immediate
successor `x + 1`" framing. -/
class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1

/-- How `Succ`/`Pred` interact with multiplication — a consequence of
distributivity once `Succ a = a + 1` (`a * (b + 1) = a * b + a`), stated here
as its own atomic law since `HasSuccessor`/`HasPredecessor` don't presuppose a
full ring. -/
class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a

/-- Discreteness, per the user's two-sided-Peano axiomatization:

1. Acyclicity — *every* element's `Succ`-orbit is aperiodic, not just `0`'s
   (`∀ x, ∀ n > 0, Sⁿ(x) ≠ x`). Quantifying only over `x = 0` would be a
   strictly weaker, different statement: it typechecks and looks plausible,
   but silently drops the universal quantifier over `x` that the spec states
   — exactly the D2 risk this audit pass exists to catch.
2. Bidirectional induction — the only `Succ`/`Pred`-closed, `0`-containing
   subset of `R` is all of `R`, stated via a motive predicate (standard Lean
   encoding of "for all subsets `A ⊆ R`"). -/
class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ (x : R) (n : Nat), 0 < n → SuccIterate n x ≠ x
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a

section Wrappers

variable {R : Type u}

theorem PredSucc [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Pred (Succ a) = a := by
  sorry
theorem SuccPred [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Succ (Pred a) = a := by
  sorry
theorem SuccInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Succ a = Succ b → a = b := by
  sorry
theorem PredInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Pred a = Pred b → a = b := by
  sorry
theorem SuccEqAddOne [HasSuccessor R] [Add R] [OfNat R 1]
    [SuccessorAdditionLaw R] :
    ∀ a : R, Succ a = a + 1 := by
  sorry
theorem MulSucc [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Succ b = a * b + a := by
  sorry
theorem MulPred [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Pred b = a * b + -a := by
  sorry
theorem SuccAperiodic [HasSuccessor R] [HasPredecessor R] [OfNat R 0]
    [DiscretenessLaw R] :
    ∀ (x : R) (n : Nat), 0 < n → SuccIterate n x ≠ x := by
  sorry
theorem TwoSidedInduction [HasSuccessor R] [HasPredecessor R]
    [OfNat R 0] [DiscretenessLaw R] :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a := by
  sorry
end Wrappers

end LRA.AlgebraicStructures
