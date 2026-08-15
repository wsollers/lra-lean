namespace LRA.Algebra.Structure

universe u

/-!
Multiplicative law mixins, including the field-specific inverse laws.

The multiplicative inverse is *total* (`Inv R` gives `a⁻¹` for every
`a`), with the standard `0⁻¹ = 0` convention recorded as a law -- the
honest alternative (partial inversion on a nonzero subtype) makes every
downstream statement carry nonzeroness proofs. This convention is the
formal residue of a real mathematical fact: fields are not a variety
(inversion is not a total equational operation), so *some* concession is
forced; this is the least intrusive one, and it is stated rather than
hidden.
-/

/--
`MultiplicativeSemigroupLaws` packages the class contract for multiplicative semigroup laws.

Logical form:

```lean
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative : ∀ a b c : R, (a * b) * c = a * (b * c)
```
-/
class MultiplicativeSemigroupLaws (R : Type u) [Mul R] : Prop where
  MulAssociative : ∀ a b c : R, (a * b) * c = a * (b * c)

/--
`MultiplicativeCommutativeLaws` packages the class contract for multiplicative commutative laws.

Logical form:

```lean
class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative : ∀ a b : R, a * b = b * a
```
-/
class MultiplicativeCommutativeLaws (R : Type u) [Mul R] : Prop where
  MulCommutative : ∀ a b : R, a * b = b * a

/--
`MultiplicativeIdentityLaws` packages the class contract for multiplicative identity laws.

Logical form:

```lean
class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul : ∀ a : R, 1 * a = a
  MulOne : ∀ a : R, a * 1 = a
```
-/
class MultiplicativeIdentityLaws (R : Type u) [Mul R] [OfNat R 1] : Prop where
  OneMul : ∀ a : R, 1 * a = a
  MulOne : ∀ a : R, a * 1 = a

/-- Zero absorbs multiplication. Independent of the additive laws: in a
semiring it is an axiom, not a consequence.

Logical form:

```lean
class ZeroAbsorbingLaws (R : Type u) [Mul R] [OfNat R 0] : Prop where
  ZeroMul : ∀ a : R, 0 * a = 0
  MulZero : ∀ a : R, a * 0 = 0
```
-/
class ZeroAbsorbingLaws (R : Type u) [Mul R] [OfNat R 0] : Prop where
  ZeroMul : ∀ a : R, 0 * a = 0
  MulZero : ∀ a : R, a * 0 = 0

/-- The carrier is nontrivial: `1 ≠ 0`.

Logical form:

```lean
class NontrivialityLaw (R : Type u) [OfNat R 0] [OfNat R 1] : Prop where
  OneNeZero : (1 : R) ≠ 0
```
-/
class NontrivialityLaw (R : Type u) [OfNat R 0] [OfNat R 1] : Prop where
  OneNeZero : (1 : R) ≠ 0

/-- No zero divisors: a product vanishes only if a factor does.

Logical form:

```lean
class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0
```
-/
class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0

/-- Multiplicative inverses for nonzero elements, with the total-`Inv`
`0⁻¹ = 0` convention stated explicitly.

Logical form:

```lean
class MultiplicativeInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
  MulInvCancel : ∀ a : R, a ≠ 0 → a * a⁻¹ = 1
  InvZero : (0 : R)⁻¹ = 0
```
-/
class MultiplicativeInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
  MulInvCancel : ∀ a : R, a ≠ 0 → a * a⁻¹ = 1
  InvZero : (0 : R)⁻¹ = 0

/-- Division, where registered, is multiplication by the inverse.

Logical form:

```lean
class DivisionCompatibilityLaw (R : Type u)
    [Div R] [Mul R] [Inv R] : Prop where
  DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹
```
-/
class DivisionCompatibilityLaw (R : Type u)
    [Div R] [Mul R] [Inv R] : Prop where
  DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹

section Wrappers

variable {R : Type u}

/-- Multiplication is associative.

Logical form:

```lean
theorem MulAssociative [Mul R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c)
```
-/
theorem MulAssociative [Mul R] [MultiplicativeSemigroupLaws R] :
    ∀ a b c : R, (a * b) * c = a * (b * c) :=
  MultiplicativeSemigroupLaws.MulAssociative

/-- Multiplication is commutative.

Logical form:

```lean
theorem MulCommutative [Mul R] [MultiplicativeCommutativeLaws R] :
    ∀ a b : R, a * b = b * a
```
-/
theorem MulCommutative [Mul R] [MultiplicativeCommutativeLaws R] :
    ∀ a b : R, a * b = b * a :=
  MultiplicativeCommutativeLaws.MulCommutative

/-- One is a left identity for multiplication.

Logical form:

```lean
theorem OneMul [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, 1 * a = a
```
-/
theorem OneMul [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, 1 * a = a :=
  MultiplicativeIdentityLaws.OneMul

/-- One is a right identity for multiplication.

Logical form:

```lean
theorem MulOne [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, a * 1 = a
```
-/
theorem MulOne [Mul R] [OfNat R 1] [MultiplicativeIdentityLaws R] :
    ∀ a : R, a * 1 = a :=
  MultiplicativeIdentityLaws.MulOne

/-- Zero absorbs multiplication on the left.

Logical form:

```lean
theorem ZeroMul [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, 0 * a = 0
```
-/
theorem ZeroMul [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, 0 * a = 0 :=
  ZeroAbsorbingLaws.ZeroMul

/-- Zero absorbs multiplication on the right.

Logical form:

```lean
theorem MulZero [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, a * 0 = 0
```
-/
theorem MulZero [Mul R] [OfNat R 0] [ZeroAbsorbingLaws R] :
    ∀ a : R, a * 0 = 0 :=
  ZeroAbsorbingLaws.MulZero

/-- One and zero are distinct.

Logical form:

```lean
theorem OneNeZero [OfNat R 0] [OfNat R 1] [NontrivialityLaw R] :
    (1 : R) ≠ 0
```
-/
theorem OneNeZero [OfNat R 0] [OfNat R 1] [NontrivialityLaw R] :
    (1 : R) ≠ 0 :=
  NontrivialityLaw.OneNeZero

/-- A vanishing product has a vanishing factor.

Logical form:

```lean
theorem EqZeroOfMulEqZero [Mul R] [OfNat R 0] [NoZeroDivisorsLaw R] :
    ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0
```
-/
theorem EqZeroOfMulEqZero [Mul R] [OfNat R 0] [NoZeroDivisorsLaw R] :
    ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0 :=
  NoZeroDivisorsLaw.EqZeroOfMulEqZero

/-- Nonzero elements cancel against their inverses.

Logical form:

```lean
theorem MulInvCancel [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    ∀ a : R, a ≠ 0 → a * a⁻¹ = 1
```
-/
theorem MulInvCancel [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    ∀ a : R, a ≠ 0 → a * a⁻¹ = 1 :=
  MultiplicativeInverseLaws.MulInvCancel

/-- The inverse of zero is zero, by convention.

Logical form:

```lean
theorem InvZero [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    (0 : R)⁻¹ = 0
```
-/
theorem InvZero [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    (0 : R)⁻¹ = 0 :=
  MultiplicativeInverseLaws.InvZero

/-- Division is multiplication by the inverse.

Logical form:

```lean
theorem DivEqMulInv [Div R] [Mul R] [Inv R]
    [DivisionCompatibilityLaw R] :
    ∀ a b : R, a / b = a * b⁻¹
```
-/
theorem DivEqMulInv [Div R] [Mul R] [Inv R]
    [DivisionCompatibilityLaw R] :
    ∀ a b : R, a / b = a * b⁻¹ :=
  DivisionCompatibilityLaw.DivEqMulInv

end Wrappers

end LRA.Algebra.Structure
