import LRA.VolumeI.Operations.Operations
import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Relations.Basic.Properties

/-!
Order-specific relation constructions.

Generic relation predicates such as reflexivity, antisymmetry, transitivity,
totality, and density remain in `LRA.VolumeI.Relations`. This module contains
the order-facing relations derived from a chosen comparison.
-/

namespace LRA.VolumeI.Relations.Order

universe u

/-- Greater-than relation derived from a strict order. -/
def GreaterThan {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation right left

/-- Non-strict relation derived from a strict order. -/
def LessThanOrEqual {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right

/-- Greater-than-or-equal relation derived from a strict order. -/
def GreaterThanOrEqual {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => GreaterThan strictRelation left right \/ left = right

/-- The strict part of a non-strict order. -/
def StrictPart {alpha : LRA.VolumeI.Set.LRACarrier}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right

/-- The cover relation induced by a strict order relation. -/
def CoverRelation {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle, Not (strictRelation lower middle /\ strictRelation middle upper)

/-- Two elements are comparable with respect to a relation. -/
def Comparable {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left

/-- Strict order is preserved by right translation under a binary operation. -/
def StrictlyPreservesRightTranslation {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (operation : LRA.VolumeI.Operations.BinaryOperation alpha) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)

/-- Positive right multiplication preserves strict order. -/
def PreservesPositiveRightMultiplication {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictOrderRelation : LRA.VolumeI.Relations.Endorelation alpha)
    (mul : LRA.VolumeI.Operations.BinaryOperation alpha)
    (zero : alpha) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)

end LRA.VolumeI.Relations.Order
