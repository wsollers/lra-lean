import LRA.Foundation.Order.Laws

namespace LRA.Foundation
namespace Order

universe u

structure Preorder where
  carrier : LRACarrier
  relation : Endorelation carrier
  relation_reflexive : reflexive relation
  relation_transitive : transitive relation

structure PartialOrder extends Preorder where
  relation_antisymmetric : antisymmetric relation

structure TotalOrder extends PartialOrder where
  relation_total : total relation

structure StrictOrder where
  carrier : LRACarrier
  relation : Endorelation carrier
  relation_irreflexive : irreflexive relation
  relation_transitive : transitive relation

structure OrderedAdditiveStructure where
  carrier : LRACarrier
  le : Endorelation carrier
  lt : Endorelation carrier
  add : BinaryOperation carrier
  le_is_reflexive : reflexive le
  le_is_antisymmetric : antisymmetric le
  lt_is_irreflexive : irreflexive lt
  lt_is_transitive : transitive lt
  lt_preserved_by_right_addition : strictlyPreservesRightTranslation lt add

end Order
end LRA.Foundation
