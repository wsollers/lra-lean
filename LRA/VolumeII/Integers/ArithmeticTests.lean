-- LRA/VolumeII/Integers/ArithmeticTests.lean
-- Shared arithmetic smoke tests, stated once over any certified carrier.

import LRA.VolumeII.Integers.Implementation

namespace LRA.NumberSystems.Integers.ArithmeticTests

open LRA.Algebra.Structure

universe u

/-!
Volume II label: integers-arithmetic-tests
Lean module: LRA.NumberSystems.Integers.ArithmeticTests
Verification status: checked smoke tests

The suite is a single polymorphic statement over the mixin vocabulary,
instantiated once per construction. Running the same tests against
another construction is one more `example` line naming its carrier --
no switch edits, no rebuilds of anything else.
-/

/-- The shared integer arithmetic suite: every clause is a fluent
wrapper application, so any carrier with the listed certificates
passes.

Logical form:

```lean
theorem integerSuite (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R]
    [HasSuccessor R] [HasPredecessor R]
    [CommutativeRingLaws R] [PartialOrderLaws R]
    [SuccessorLaws R] [SuccessorMultiplicationLaws R]
    (a b c : R) :
    Pred (Succ a) = a ∧
    Succ (Pred a) = a ∧
    a + 0 = a ∧
    0 + a = a ∧
    (a + b) + c = a + (b + c) ∧
    a + b = b + a ∧
    -a + a = 0 ∧
    a * 0 = 0 ∧
    1 * a = a ∧
    (a * b) * c = a * (b * c) ∧
    a * b = b * a ∧
    a * (b + c) = a * b + a * c ∧
    (a + b) * c = a * c + b * c ∧
    a * Succ b = a * b + a ∧
    a * Pred b = a * b + -a ∧
    a ≤ a
```
-/
theorem integerSuite (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R]
    [HasSuccessor R] [HasPredecessor R]
    [CommutativeRingLaws R] [PartialOrderLaws R]
    [SuccessorLaws R] [SuccessorMultiplicationLaws R]
    (a b c : R) :
    Pred (Succ a) = a ∧
    Succ (Pred a) = a ∧
    a + 0 = a ∧
    0 + a = a ∧
    (a + b) + c = a + (b + c) ∧
    a + b = b + a ∧
    -a + a = 0 ∧
    a * 0 = 0 ∧
    1 * a = a ∧
    (a * b) * c = a * (b * c) ∧
    a * b = b * a ∧
    a * (b + c) = a * b + a * c ∧
    (a + b) * c = a * c + b * c ∧
    a * Succ b = a * b + a ∧
    a * Pred b = a * b + -a ∧
    a ≤ a :=
  ⟨PredSucc a, SuccPred a, AddZero a, ZeroAdd a, AddAssociative a b c,
   AddCommutative a b, NegAddCancel a, MulZero a, OneMul a,
   MulAssociative a b c, MulCommutative a b, LeftDistributive a b c,
   RightDistributive a b c, MulSucc a b, MulPred a b, LeRefl a⟩

/-- The active carrier passes the suite. -/
example (a b c : Z) := integerSuite Z a b c

/-- The Polish construction passes the suite, named directly -- the
local-swap pattern: instances resolve from the carrier in the binder,
independent of the active switch. -/
example (a b c : Polish.TwoSidedSuccessor.Z) :=
  integerSuite Polish.TwoSidedSuccessor.Z a b c

section IntInstantiation

/-!
Mathlib's `Int` passes the same suite through the Mathlib bridge, once
its discrete machines are registered here. These instances are on the
Mathlib side of the fence, so they are proved outright under the
standing Mathlib-bridge exception.
-/

instance : HasSuccessor Int := ⟨fun n => n + 1⟩
instance : HasPredecessor Int := ⟨fun n => n - 1⟩

instance : SuccessorLaws Int where
  PredSucc := fun a => by simp [Succ, Pred, HasSuccessor.Succ, HasPredecessor.Pred]
  SuccPred := fun a => by simp [Succ, Pred, HasSuccessor.Succ, HasPredecessor.Pred]
  SuccInjective := fun a b h => by
    simpa [Succ, HasSuccessor.Succ] using h
  PredInjective := fun a b h => by
    simpa [Pred, HasPredecessor.Pred] using h

instance : SuccessorAdditionLaw Int := ⟨fun _ => rfl⟩

instance : SuccessorMultiplicationLaws Int where
  MulSucc := fun a b => by
    show a * (b + 1) = a * b + a
    ring
  MulPred := fun a b => by
    show a * (b - 1) = a * b + -a
    ring

example (a b c : Int) := integerSuite Int a b c

end IntInstantiation

/-! ## Concrete computations on the active carrier -/

section Concrete

/--
`two` defines the displayed object for two.

Logical form:

```lean
def two : Z := Succ 1
```
-/
def two : Z := Succ 1
/--
`minusOne` defines the displayed object for minus one.

Logical form:

```lean
def minusOne : Z := Pred 0
```
-/
def minusOne : Z := Pred 0
/--
`minusTwo` defines the displayed object for minus two.

Logical form:

```lean
def minusTwo : Z := Pred minusOne
```
-/
def minusTwo : Z := Pred minusOne

example : Pred (Succ two) = two := PredSucc two
example : two + minusOne = (1 : Z) := rfl
example : -(0 : Z) = 0 := rfl
example : -(1 : Z) = minusOne := rfl
example : -minusOne = (1 : Z) := rfl
example : Succ minusOne = (0 : Z) := rfl
example : (1 : Z) ≤ 1 := LeRefl 1

/-- Backend-specific facts stay reachable by qualified name. -/
example : ¬ (1 : Z) < 1 := Polish.TwoSidedSuccessor.lt_irrefl 1
example : (0 : Z) < 1 := Polish.TwoSidedSuccessor.lt_succ_self 0

end Concrete

/-! ## Reverse substitution: Mathlib automation on the project carrier

The opt-in adapter assembles `CommRing Z` from the certificates, and
Mathlib's lemma library and `ring` tactic land on the Polish
integers. -/

section MathlibAutomation

example (a b : Z) : a * b = b * a := by
  letI : CommRing Z := toMathlibCommRing Z
  exact mul_comm a b

example (a b : Z) : (a + b) * (a + b) = a * a + (1 + 1) * (a * b) + b * b := by
  letI : CommRing Z := toMathlibCommRing Z
  ring

end MathlibAutomation

end LRA.NumberSystems.Integers.ArithmeticTests
