import LRA.VolumeI.AlgebraicStructures.Additive
import LRA.VolumeI.AlgebraicStructures.Multiplicative
import LRA.VolumeI.AlgebraicStructures.Distributive
import LRA.VolumeI.AlgebraicStructures.Order

namespace LRA.AlgebraicStructures

universe u

/-!
Named bundles as `class abbrev` conjunctions of the mixins.

Each bundle is spelled out **flat**, directly as its leaf mixins, rather
than as an abbrev of smaller abbrevs: nesting `class abbrev`s builds a
constructor tower whose definitional unfolding grows exponentially with
depth (instance synthesis times out around depth five), while flat
conjunctions stay one level deep and synthesize instantly. The flatness
is also self-documenting -- each bundle's definition *is* the complete
list of laws it asserts.

Bundles carry no new fields, and instances flow freely: a
`CommutativeRingLaws` context synthesizes `RingLaws` (and every other
sub-bundle) through the leaf instances, one constructor application
deep. The pedagogically preferred style at theorem sites remains listing
exactly the mixins the proof uses.
-/

/--
`AdditiveMonoidLaws` packages the class contract for additive monoid laws.

Logical form:

```lean
class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R
```
-/
class abbrev AdditiveMonoidLaws (R : Type u) [Add R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R

/--
`AdditiveGroupLaws` packages the class contract for additive group laws.

Logical form:

```lean
class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R
```
-/
class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R

/--
`AbelianGroupLaws` packages the class contract for abelian group laws.

Logical form:

```lean
class abbrev AbelianGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R,
  AdditiveCommutativeLaws R
```
-/
class abbrev AbelianGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R,
  AdditiveCommutativeLaws R

/--
`MonoidLaws` packages the class contract for monoid laws.

Logical form:

```lean
class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R
```
-/
class abbrev MonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R

/--
`CommutativeMonoidLaws` packages the class contract for commutative monoid laws.

Logical form:

```lean
class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R
```
-/
class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R

/--
`SemiringLaws` packages the class contract for semiring laws.

Logical form:

```lean
class abbrev SemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R
```
-/
class abbrev SemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

/--
`CommutativeSemiringLaws` packages the class contract for commutative semiring laws.

Logical form:

```lean
class abbrev CommutativeSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R
```
-/
class abbrev CommutativeSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

/--
`RingLaws` packages the class contract for ring laws.

Logical form:

```lean
class abbrev RingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R
```
-/
class abbrev RingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

/--
`CommutativeRingLaws` packages the class contract for commutative ring laws.

Logical form:

```lean
class abbrev CommutativeRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R
```
-/
class abbrev CommutativeRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

/--
`IntegralDomainLaws` packages the class contract for integral domain laws.

Logical form:

```lean
class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, NoZeroDivisorsLaw R
```
-/
class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, NoZeroDivisorsLaw R

/--
`FieldLaws` packages the class contract for field laws.

Logical form:

```lean
class abbrev FieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R
```
-/
class abbrev FieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R

/--
`LinearOrderLaws` packages the class contract for linear order laws.

Logical form:

```lean
class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
  PartialOrderLaws R, TotalOrderLaw R
```
-/
class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
  PartialOrderLaws R, TotalOrderLaw R

/--
`OrderedRingLaws` packages the class contract for ordered ring laws.

Logical form:

```lean
class abbrev OrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  PartialOrderLaws R, TotalOrderLaw R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R
```
-/
class abbrev OrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  PartialOrderLaws R, TotalOrderLaw R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

/--
`OrderedFieldLaws` packages the class contract for ordered field laws.

Logical form:

```lean
class abbrev OrderedFieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R,
  PartialOrderLaws R, TotalOrderLaw R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R
```
-/
class abbrev OrderedFieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R,
  PartialOrderLaws R, TotalOrderLaw R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
