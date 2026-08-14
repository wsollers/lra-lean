import LRA.VolumeI.Operations.Operations
import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Relations.Basic.Properties

/-!
Order-specific relation constructions.

Generic relation predicates such as reflexivity, antisymmetry, transitivity,
totality, and density remain in `LRA.VolumeI.Relations`. This module contains
the order-facing relations derived from a chosen comparison.
-/

namespace LRA.VolumeI.Order

universe u

/--
Greater-than relation derived from a strict order.

Logical form:

```lean
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation right left
```
-/
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation right left

/--
Non-strict relation derived from a strict order.

Logical form:

```lean
def LessThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right
```
-/
def LessThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right

/--
Greater-than-or-equal relation derived from a strict order.

Logical form:

```lean
def GreaterThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => GreaterThan strictRelation left right \/ left = right
```
-/
def GreaterThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => GreaterThan strictRelation left right \/ left = right

/--
The strict part of a non-strict order.

Logical form:

```lean
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right
```
-/
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right

/--
The cover relation induced by a strict order relation.

Logical form:

```lean
def CoverRelation {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle, Not (strictRelation lower middle /\ strictRelation middle upper)
```
-/
def CoverRelation {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle, Not (strictRelation lower middle /\ strictRelation middle upper)

/--
Two elements are comparable with respect to a relation.

Logical form:

```lean
def Comparable {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left
```
-/
def Comparable {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left

/--
Strict order is preserved by right translation under a binary operation.

Logical form:

```lean
def StrictlyPreservesRightTranslation {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (operation : LRA.VolumeI.Operations.BinaryOperation alpha) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)
```
-/
def StrictlyPreservesRightTranslation {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (operation : LRA.VolumeI.Operations.BinaryOperation alpha) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)

/--
Positive right multiplication preserves strict order.

Logical form:

```lean
def PreservesPositiveRightMultiplication {alpha : Type u}
    (strictOrderRelation : LRA.VolumeI.Relations.Endorelation alpha)
    (mul : LRA.VolumeI.Operations.BinaryOperation alpha)
    (zero : alpha) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)
```
-/
def PreservesPositiveRightMultiplication {alpha : Type u}
    (strictOrderRelation : LRA.VolumeI.Relations.Endorelation alpha)
    (mul : LRA.VolumeI.Operations.BinaryOperation alpha)
    (zero : alpha) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)

end LRA.VolumeI.Order
