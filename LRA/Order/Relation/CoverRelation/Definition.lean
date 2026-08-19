import LRA.Relation.Definition

namespace LRA.Order

universe u

/-- The cover relation induced by a strict order relation. -/
def CoverRelation {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle,
        Not (strictRelation lower middle /\ strictRelation middle upper)

end LRA.Order
