namespace LRA.Algebra.Structure

universe u

/-!
Discreteness mixins: successor and predecessor as first-class machines.

A discrete carrier -- the integers being the motivating case -- walks in
unit steps. The *machines* are `HasSuccessor` and `HasPredecessor`, one
operation each, registered exactly like `Add` or `Neg`. The
*certificates* below tie the walk together: `SuccessorLaws` makes the
two steps mutually inverse bijections, `SuccessorAdditionLaw` and
`SuccessorMultiplicationLaws` tie the walk to the ring operations, and
`DiscretenessLaw` is the second-order heart -- the walk from zero never
returns (aperiodicity) and reaches everything (two-sided induction).

Capability honesty as always: a dense carrier like `ℚ` or `ℝ` simply
never registers `HasSuccessor`, and `Succ x` fails to elaborate. The
categoricity content -- any carrier with these laws is a copy of `ℤ` --
is proved concretely in
`LRA.NumberSystems.Integers.Polish.DiscreteIntegerStructure`.
-/

/--
`HasSuccessor` packages the class contract for has successor.

Logical form:

```lean
class HasSuccessor (R : Type u) where
  Succ : R → R
```
-/
class HasSuccessor (R : Type u) where
  Succ : R → R

/--
`HasPredecessor` packages the class contract for has predecessor.

Logical form:

```lean
class HasPredecessor (R : Type u) where
  Pred : R → R
```
-/
class HasPredecessor (R : Type u) where
  Pred : R → R

/-- The successor step, resolved from the carrier type.

Logical form:

```lean
def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ
```
-/
def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ

/-- The predecessor step, resolved from the carrier type.

Logical form:

```lean
def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred
```
-/
def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred

/-- The n-fold iterate of the successor step.

Logical form:

```lean
def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)
```
-/
def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)

/--
`SuccessorLaws` packages the class contract for successor laws.

Logical form:

```lean
class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b
```
-/
class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b

/-- The successor step, where addition and a unit are registered, is
addition of one. Ties the discrete walk to the additive structure.

Logical form:

```lean
class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1
```
-/
class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1

/-- Multiplication interacts with the discrete walk by accumulation:
one more step of the multiplier adds (or removes) one copy of the
multiplicand. This is the recursive heart of integer multiplication.

Logical form:

```lean
class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a
```
-/
class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a

/-- The two second-order discreteness axioms: the forward walk from
zero is aperiodic, and the two-sided walk from zero exhausts the
carrier. Together with `SuccessorLaws` these force the carrier to be a
copy of `ℤ` (categoricity).

Logical form:

```lean
class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a
```
-/
class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a

/-- Order-theoretic discreteness: the unit step has no interior. Stated
against `LT` and `+ 1` rather than `Succ`, so it applies to any ordered
carrier with a unit -- `Int` satisfies it, `ℚ` and `ℝ` refute it.

Logical form:

```lean
class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    ∀ a : R, ¬ ∃ middle : R, a < middle ∧ middle < a + 1
```
-/
class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    ∀ a : R, ¬ ∃ middle : R, a < middle ∧ middle < a + 1

section Wrappers

variable {R : Type u}

/-- Predecessor undoes successor.

Logical form:

```lean
theorem PredSucc [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Pred (Succ a) = a
```
-/
theorem PredSucc [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Pred (Succ a) = a :=
  SuccessorLaws.PredSucc

/-- Successor undoes predecessor.

Logical form:

```lean
theorem SuccPred [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Succ (Pred a) = a
```
-/
theorem SuccPred [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Succ (Pred a) = a :=
  SuccessorLaws.SuccPred

/-- The successor step is injective.

Logical form:

```lean
theorem SuccInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Succ a = Succ b → a = b
```
-/
theorem SuccInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Succ a = Succ b → a = b :=
  SuccessorLaws.SuccInjective

/-- The predecessor step is injective.

Logical form:

```lean
theorem PredInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Pred a = Pred b → a = b
```
-/
theorem PredInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Pred a = Pred b → a = b :=
  SuccessorLaws.PredInjective

/-- The successor step is addition of one.

Logical form:

```lean
theorem SuccEqAddOne [HasSuccessor R] [Add R] [OfNat R 1]
    [SuccessorAdditionLaw R] :
    ∀ a : R, Succ a = a + 1
```
-/
theorem SuccEqAddOne [HasSuccessor R] [Add R] [OfNat R 1]
    [SuccessorAdditionLaw R] :
    ∀ a : R, Succ a = a + 1 :=
  SuccessorAdditionLaw.SuccEqAddOne

/-- Multiplying into a successor accumulates one more copy.

Logical form:

```lean
theorem MulSucc [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Succ b = a * b + a
```
-/
theorem MulSucc [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Succ b = a * b + a :=
  SuccessorMultiplicationLaws.MulSucc

/-- Multiplying into a predecessor removes one copy.

Logical form:

```lean
theorem MulPred [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Pred b = a * b + -a
```
-/
theorem MulPred [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Pred b = a * b + -a :=
  SuccessorMultiplicationLaws.MulPred

/-- The forward walk from zero never returns to zero.

Logical form:

```lean
theorem SuccAperiodic [HasSuccessor R] [HasPredecessor R] [OfNat R 0]
    [DiscretenessLaw R] :
    ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
```
-/
theorem SuccAperiodic [HasSuccessor R] [HasPredecessor R] [OfNat R 0]
    [DiscretenessLaw R] :
    ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0 :=
  DiscretenessLaw.SuccAperiodic

/-- Two-sided induction from zero reaches every element.

Logical form:

```lean
theorem TwoSidedInduction [HasSuccessor R] [HasPredecessor R]
    [OfNat R 0] [DiscretenessLaw R] :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a
```
-/
theorem TwoSidedInduction [HasSuccessor R] [HasPredecessor R]
    [OfNat R 0] [DiscretenessLaw R] :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a :=
  DiscretenessLaw.TwoSidedInduction

/-- No element lies strictly between an element and its unit translate.

Logical form:

```lean
theorem NoStrictBetweenAddOne [LT R] [Add R] [OfNat R 1]
    [OrderDiscretenessLaw R] :
    ∀ a : R, ¬ ∃ middle : R, a < middle ∧ middle < a + 1
```
-/
theorem NoStrictBetweenAddOne [LT R] [Add R] [OfNat R 1]
    [OrderDiscretenessLaw R] :
    ∀ a : R, ¬ ∃ middle : R, a < middle ∧ middle < a + 1 :=
  OrderDiscretenessLaw.NoStrictBetweenAddOne

end Wrappers

end LRA.Algebra.Structure
