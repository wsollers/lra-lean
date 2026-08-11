namespace LRA.VolumeI.AlgebraicStructures

universe u

/-!
Additive law mixins.

The algebraic-structures layer follows the Set chapter's
machine/certificate split. The *machines* are Lean core's own notation
classes -- `Add`, `Neg`, `Sub`, and numerals via `OfNat R 0` -- so `a + b`,
`-a`, `a - b`, and `0` resolve for any carrier that registers, exactly as
`A ∪ B` does for any set backend. The *certificates* are the small
`Prop`-classes below: one law family per concept, so "abelian" is one
more `[...]` bracket rather than a new node in a bundled hierarchy.

Capability honesty comes for free: a carrier without additive inverses
(a semiring like `ℕ`) simply never registers `Neg`, and `-a` fails to
elaborate -- the same enforcement as `Aᶜ` at `Enderton.Set`.
-/

/--
`AdditiveSemigroupLaws` packages the class contract for additive semigroup laws.

Logical form:

```lean
class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative : ∀ a b c : R, (a + b) + c = a + (b + c)
```
-/
class AdditiveSemigroupLaws (R : Type u) [Add R] : Prop where
  AddAssociative : ∀ a b c : R, (a + b) + c = a + (b + c)

/--
`AdditiveCommutativeLaws` packages the class contract for additive commutative laws.

Logical form:

```lean
class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
  AddCommutative : ∀ a b : R, a + b = b + a
```
-/
class AdditiveCommutativeLaws (R : Type u) [Add R] : Prop where
  AddCommutative : ∀ a b : R, a + b = b + a

/--
`AdditiveIdentityLaws` packages the class contract for additive identity laws.

Logical form:

```lean
class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd : ∀ a : R, 0 + a = a
  AddZero : ∀ a : R, a + 0 = a
```
-/
class AdditiveIdentityLaws (R : Type u) [Add R] [OfNat R 0] : Prop where
  ZeroAdd : ∀ a : R, 0 + a = a
  AddZero : ∀ a : R, a + 0 = a

/--
`AdditiveInverseLaws` packages the class contract for additive inverse laws.

Logical form:

```lean
class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel : ∀ a : R, -a + a = 0
  AddNegCancel : ∀ a : R, a + -a = 0
```
-/
class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel : ∀ a : R, -a + a = 0
  AddNegCancel : ∀ a : R, a + -a = 0

/-- Subtraction, where registered, is addition of the negation. Ties the
independently registered `Sub` machine to `Add`/`Neg`.

Logical form:

```lean
class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b
```
-/
class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b

section Wrappers

variable {R : Type u}

/-- Addition is associative.

Logical form:

```lean
theorem AddAssociative [Add R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c)
```
-/
theorem AddAssociative [Add R] [AdditiveSemigroupLaws R] :
    ∀ a b c : R, (a + b) + c = a + (b + c) :=
  AdditiveSemigroupLaws.AddAssociative

/-- Addition is commutative.

Logical form:

```lean
theorem AddCommutative [Add R] [AdditiveCommutativeLaws R] :
    ∀ a b : R, a + b = b + a
```
-/
theorem AddCommutative [Add R] [AdditiveCommutativeLaws R] :
    ∀ a b : R, a + b = b + a :=
  AdditiveCommutativeLaws.AddCommutative

/-- Zero is a left identity for addition.

Logical form:

```lean
theorem ZeroAdd [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, 0 + a = a
```
-/
theorem ZeroAdd [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, 0 + a = a :=
  AdditiveIdentityLaws.ZeroAdd

/-- Zero is a right identity for addition.

Logical form:

```lean
theorem AddZero [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, a + 0 = a
```
-/
theorem AddZero [Add R] [OfNat R 0] [AdditiveIdentityLaws R] :
    ∀ a : R, a + 0 = a :=
  AdditiveIdentityLaws.AddZero

/-- The negation is a left additive inverse.

Logical form:

```lean
theorem NegAddCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, -a + a = 0
```
-/
theorem NegAddCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, -a + a = 0 :=
  AdditiveInverseLaws.NegAddCancel

/-- The negation is a right additive inverse.

Logical form:

```lean
theorem AddNegCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, a + -a = 0
```
-/
theorem AddNegCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, a + -a = 0 :=
  AdditiveInverseLaws.AddNegCancel

/-- Subtraction is addition of the negation.

Logical form:

```lean
theorem SubEqAddNeg [Sub R] [Add R] [Neg R]
    [SubtractionCompatibilityLaw R] :
    ∀ a b : R, a - b = a + -b
```
-/
theorem SubEqAddNeg [Sub R] [Add R] [Neg R]
    [SubtractionCompatibilityLaw R] :
    ∀ a b : R, a - b = a + -b :=
  SubtractionCompatibilityLaw.SubEqAddNeg

end Wrappers

end LRA.VolumeI.AlgebraicStructures
