-- LRA/VolumeI/UniversalAlgebra/Models/FirstOrderBuilders.lean
-- Generic first-order model builders over instance-carrying carriers.

import LRA.VolumeI.UniversalAlgebra.Models.Signatures
import LRA.VolumeI.AlgebraicStructures.DiscreteInteger.Laws.Definition

namespace LRA.UniversalAlgebra.Models

open LRA.AlgebraicStructures

universe u

/-!
Volume I label: generic-first-order-builders
Lean module: LRA.UniversalAlgebra.Models.FirstOrderBuilders
Verification status: checked definitions

One generic builder per first-order language: any carrier whose
operations are registered as instances becomes a `FirstOrder.Model` of
the corresponding symbol signature, with the interpretation read off the
instances. These supersede the per-system builder pattern (construct an
operation bundle by hand, then `Build…Model` it): the bundle is now
assembled from the instances inside the builder, so `Z`, `Int`, `ℚ`,
`ℝ`, and any future certified carrier all use the same seven lines.

The builders need no law certificates — a first-order model is an
interpretation of symbols; which sentences it satisfies is a separate
question for the satisfaction layer.
-/

/-- Any carrier with a unit and a successor step interprets the Peano
language.

Logical form:

```lean
def peanoFirstOrderModel (R : Type u) [OfNat R 1] [HasSuccessor R] :
    LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature :=
  BuildPeanoModel { carrier := R, one := 1, successor := Succ }
```
-/
def peanoFirstOrderModel (R : Type u) [OfNat R 1] [HasSuccessor R] :
    LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature :=
  BuildPeanoModel { carrier := R, one := 1, successor := Succ }

/-- Any additively ordered carrier interprets the Presburger language
`(0, 1, +, <, ≤)`.

Logical form:

```lean
def additiveOrderedFirstOrderModel (R : Type u)
    [Add R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature :=
  BuildAdditiveOrderedModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }
```
-/
def additiveOrderedFirstOrderModel (R : Type u)
    [Add R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature :=
  BuildAdditiveOrderedModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

/-- Any additive-multiplicative carrier interprets the arithmetic ring
language `(0, 1, +, *)`.

Logical form:

```lean
def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) }
```
-/
def arithmeticRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·) }

/-- Any ordered semiring-style carrier interprets the ordered semiring
language.

Logical form:

```lean
def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }
```
-/
def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      multiplication := (· * ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

/-- Any ordered ring-style carrier interprets the ordered ring
language.

Logical form:

```lean
def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }
```
-/
def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

/-- Any field-style carrier (with a totalized inverse) interprets the
field language.

Logical form:

```lean
def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·), inverse := (·⁻¹) }
```
-/
def fieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·), inverse := (·⁻¹) }

/-- Any ordered field-style carrier interprets the ordered field
language.

Logical form:

```lean
def orderedFieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }
```
-/
def orderedFieldFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel
    { carrier := R, zero := 0, one := 1, addition := (· + ·),
      negation := (- ·), multiplication := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

/-! ## Smoke tests: Mathlib carriers through the generic builders -/

example : LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  orderedRingFirstOrderModel Int

example : LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  orderedFieldFirstOrderModel Rat

example : LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel Nat

end LRA.UniversalAlgebra.Models
