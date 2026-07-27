import LRA.VolumeI.Operations.Operations
import LRA.VolumeI.Relations.Relations
import LRA.VolumeI.Relations.NamedRelations

namespace LRA.VolumeI.Relations
namespace Order

universe u v

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

/-- Total-order laws for a non-strict endorelation. -/
def totalOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation alpha) : Prop :=
  partialOrder relation /\ connex relation

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
