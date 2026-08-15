namespace LRA.Algebra.Structure

universe u

/-!
Order mixins over the core `LE`/`LT` machines, and the compatibility
laws tying order to the algebraic operations. "Ordered X" is not a new
structure anywhere in this layer: it is X's bundle plus these brackets.
-/

/--
`PartialOrderLaws` packages the class contract for partial order laws.

Logical form:

```lean
class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : ∀ a : R, a ≤ a
  LeAntisymm : ∀ a b : R, a ≤ b → b ≤ a → a = b
  LeTrans : ∀ a b c : R, a ≤ b → b ≤ c → a ≤ c
```
-/
class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : ∀ a : R, a ≤ a
  LeAntisymm : ∀ a b : R, a ≤ b → b ≤ a → a = b
  LeTrans : ∀ a b c : R, a ≤ b → b ≤ c → a ≤ c

/--
`TotalOrderLaw` packages the class contract for total order law.

Logical form:

```lean
class TotalOrderLaw (R : Type u) [LE R] : Prop where
  LeTotal : ∀ a b : R, a ≤ b ∨ b ≤ a
```
-/
class TotalOrderLaw (R : Type u) [LE R] : Prop where
  LeTotal : ∀ a b : R, a ≤ b ∨ b ≤ a

/-- The strict order, where registered, is the standard reflection of the
non-strict one.

Logical form:

```lean
class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : ∀ a b : R, a < b ↔ a ≤ b ∧ ¬ b ≤ a
```
-/
class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : ∀ a b : R, a < b ↔ a ≤ b ∧ ¬ b ≤ a

/--
`AdditionRespectsOrderLaws` packages the class contract for addition respects order laws.

Logical form:

```lean
class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : ∀ a b : R, a ≤ b → ∀ c : R, c + a ≤ c + b
  AddLeAddRight : ∀ a b : R, a ≤ b → ∀ c : R, a + c ≤ b + c
```
-/
class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : ∀ a b : R, a ≤ b → ∀ c : R, c + a ≤ c + b
  AddLeAddRight : ∀ a b : R, a ≤ b → ∀ c : R, a + c ≤ b + c

/--
`MultiplicationRespectsOrderLaws` packages the class contract for multiplication respects order laws.

Logical form:

```lean
class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : ∀ a b : R, 0 ≤ a → 0 ≤ b → 0 ≤ a * b
```
-/
class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : ∀ a b : R, 0 ≤ a → 0 ≤ b → 0 ≤ a * b

/--
Strict order is preserved by right translation under a binary operation.

Logical form:

```lean
def StrictlyPreservesRightTranslation {R : Type u}
    (relation : R → R → Prop)
    (operation : R → R → R) : Prop :=
  ∀ first second translation,
    relation first second →
    relation (operation first translation) (operation second translation)
```
-/
def StrictlyPreservesRightTranslation {R : Type u}
    (relation : R → R → Prop)
    (operation : R → R → R) : Prop :=
  ∀ first second translation,
    relation first second →
    relation (operation first translation) (operation second translation)

/--
Positive right multiplication preserves strict order.

Logical form:

```lean
def PreservesPositiveRightMultiplication {R : Type u}
    (strictOrderRelation : R → R → Prop)
    (mul : R → R → R)
    (zero : R) : Prop :=
  ∀ first second positive,
    strictOrderRelation zero positive →
    strictOrderRelation first second →
    strictOrderRelation (mul first positive) (mul second positive)
```
-/
def PreservesPositiveRightMultiplication {R : Type u}
    (strictOrderRelation : R → R → Prop)
    (mul : R → R → R)
    (zero : R) : Prop :=
  ∀ first second positive,
    strictOrderRelation zero positive →
    strictOrderRelation first second →
    strictOrderRelation (mul first positive) (mul second positive)

/-- The strict order is dense: between any two elements lies a third.
`ℚ` and `ℝ` register this; discrete carriers (`ℤ`) register
`OrderDiscretenessLaw` instead -- the two are mutually exclusive on
nontrivial carriers, and a carrier registers at most one.

Logical form:

```lean
class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    ∀ a b : R, a < b → ∃ middle : R, a < middle ∧ middle < b
```
-/
class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    ∀ a b : R, a < b → ∃ middle : R, a < middle ∧ middle < b

section Wrappers

variable {R : Type u}

/-- The order is reflexive.

Logical form:

```lean
theorem LeRefl [LE R] [PartialOrderLaws R] : ∀ a : R, a ≤ a
```
-/
theorem LeRefl [LE R] [PartialOrderLaws R] : ∀ a : R, a ≤ a :=
  PartialOrderLaws.LeRefl

/-- The order is antisymmetric.

Logical form:

```lean
theorem LeAntisymm [LE R] [PartialOrderLaws R] :
    ∀ a b : R, a ≤ b → b ≤ a → a = b
```
-/
theorem LeAntisymm [LE R] [PartialOrderLaws R] :
    ∀ a b : R, a ≤ b → b ≤ a → a = b :=
  PartialOrderLaws.LeAntisymm

/-- The order is transitive.

Logical form:

```lean
theorem LeTrans [LE R] [PartialOrderLaws R] :
    ∀ a b c : R, a ≤ b → b ≤ c → a ≤ c
```
-/
theorem LeTrans [LE R] [PartialOrderLaws R] :
    ∀ a b c : R, a ≤ b → b ≤ c → a ≤ c :=
  PartialOrderLaws.LeTrans

/-- The order is total.

Logical form:

```lean
theorem LeTotal [LE R] [TotalOrderLaw R] :
    ∀ a b : R, a ≤ b ∨ b ≤ a
```
-/
theorem LeTotal [LE R] [TotalOrderLaw R] :
    ∀ a b : R, a ≤ b ∨ b ≤ a :=
  TotalOrderLaw.LeTotal

/-- The strict order reflects the non-strict order.

Logical form:

```lean
theorem LtIffLeNotLe [LT R] [LE R] [StrictOrderCompatibilityLaw R] :
    ∀ a b : R, a < b ↔ a ≤ b ∧ ¬ b ≤ a
```
-/
theorem LtIffLeNotLe [LT R] [LE R] [StrictOrderCompatibilityLaw R] :
    ∀ a b : R, a < b ↔ a ≤ b ∧ ¬ b ≤ a :=
  StrictOrderCompatibilityLaw.LtIffLeNotLe

/-- Addition preserves the order on the left.

Logical form:

```lean
theorem AddLeAddLeft [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    ∀ a b : R, a ≤ b → ∀ c : R, c + a ≤ c + b
```
-/
theorem AddLeAddLeft [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    ∀ a b : R, a ≤ b → ∀ c : R, c + a ≤ c + b :=
  AdditionRespectsOrderLaws.AddLeAddLeft

/-- Addition preserves the order on the right.

Logical form:

```lean
theorem AddLeAddRight [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    ∀ a b : R, a ≤ b → ∀ c : R, a + c ≤ b + c
```
-/
theorem AddLeAddRight [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    ∀ a b : R, a ≤ b → ∀ c : R, a + c ≤ b + c :=
  AdditionRespectsOrderLaws.AddLeAddRight

/-- Products of nonnegatives are nonnegative.

Logical form:

```lean
theorem MulNonneg [Mul R] [LE R] [OfNat R 0]
    [MultiplicationRespectsOrderLaws R] :
    ∀ a b : R, 0 ≤ a → 0 ≤ b → 0 ≤ a * b
```
-/
theorem MulNonneg [Mul R] [LE R] [OfNat R 0]
    [MultiplicationRespectsOrderLaws R] :
    ∀ a b : R, 0 ≤ a → 0 ≤ b → 0 ≤ a * b :=
  MultiplicationRespectsOrderLaws.MulNonneg

/-- Between any two strictly ordered elements lies a third.

Logical form:

```lean
theorem ExistsBetween [LT R] [DenseOrderLaw R] :
    ∀ a b : R, a < b → ∃ middle : R, a < middle ∧ middle < b
```
-/
theorem ExistsBetween [LT R] [DenseOrderLaw R] :
    ∀ a b : R, a < b → ∃ middle : R, a < middle ∧ middle < b :=
  DenseOrderLaw.ExistsBetween

end Wrappers

end LRA.Algebra.Structure
