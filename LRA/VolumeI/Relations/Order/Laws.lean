import LRA.VolumeI.Operations.Operations
import LRA.VolumeI.Relations.Relations
import LRA.VolumeI.Relations.NamedRelations

namespace LRA.VolumeI.Relations
namespace Order

universe u v

/-- Omnibus Definition 4.1, O1: no element is strictly below itself. -/
def orderIrreflexivity {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : Endorelation alpha) : Prop :=
  irreflexive strictRelation

/-- Omnibus Definition 4.1, O2: strict order is transitive. -/
def orderTransitivity {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : Endorelation alpha) : Prop :=
  transitive strictRelation

/-- Omnibus Definition 4.1, O3: exactly one of `<`, `=`, and `>` holds. -/
def orderTrichotomy {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : Endorelation alpha) : Prop :=
  exactlyTrichotomous strictRelation

/-- Preorder laws for an endorelation. -/
def preorder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  reflexive relation /\ transitive relation

/-- Partial-order laws for an endorelation. -/
def partialOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  reflexive relation /\ antisymmetric relation /\ transitive relation

/-- Strict-order laws for an endorelation. -/
def strictOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  irreflexive relation /\ transitive relation

/-- Strict linear order laws: O1, O2, and O3 from the omnibus. -/
def strictLinearOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  orderIrreflexivity relation /\
    orderTransitivity relation /\
      orderTrichotomy relation

/-- Compatibility synonym for strict linear order. -/
def strictTotalOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  strictLinearOrder relation

/-- Total-order laws for a non-strict endorelation. -/
def totalOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  partialOrder relation /\ total relation

/-- Greater-than relation derived from a strict order. -/
def greaterThan {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => strictRelation right left

/-- Less-than-or-equal relation derived from a strict order. -/
def lessThanOrEqual {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right

/-- Greater-than-or-equal relation derived from a strict order. -/
def greaterThanOrEqual {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : Endorelation alpha) : Endorelation alpha :=
  fun left right => greaterThan strictRelation left right \/ left = right

/-- A minimum element of a predicate-set with respect to a non-strict order. -/
def isMinimum {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (minimum : alpha) : Prop :=
  LRA.VolumeI.Set.LRASet.member minimum subset /\
    forall element,
      LRA.VolumeI.Set.LRASet.member element subset ->
      relation minimum element

/-- Well-order laws for a non-strict endorelation. -/
def wellOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  totalOrder relation /\
    forall subset : LRA.VolumeI.Set.LRASet alpha,
      LRA.VolumeI.Set.LRASet.nonempty subset ->
      exists minimum, isMinimum relation subset minimum

/-- Strict order is preserved by right translation under a binary operation. -/
def strictlyPreservesRightTranslation {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha)
    (operation : LRA.VolumeI.Algebra.Operations.BinaryOperation alpha) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)

/-- Positive right multiplication preserves strict order. -/
def preservesPositiveRightMultiplication {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictOrder : Endorelation alpha)
    (mul : LRA.VolumeI.Algebra.Operations.BinaryOperation alpha)
    (zero : alpha) : Prop :=
  forall first second positive,
    strictOrder zero positive ->
    strictOrder first second ->
    strictOrder (mul first positive) (mul second positive)

end Order
end LRA.VolumeI.Relations
