import LRA.Relation.Constructions.Mathlib.PredicateSetRelation
import LRA.Relation.Interface.Satisfy_Generic

/-!
Mathlib's predicate-set relation backend satisfies the generic relation
interface by interpreting membership of `(left, right)` as the generic
predicate relation.
-/

namespace LRA.Relation.Constructions.Mathlib

universe u

instance : LRA.Relation.GenericSemantics (PredicateSetRelation (Carrier := Carrier)) Carrier where
  toEndorelation := PredicateSetRelation.toEndorelation

theorem predicateSetRelation_interpret_eq_toEndorelation
    {Carrier : Type u}
    (relation : PredicateSetRelation Carrier) :
    LRA.Relation.interpret relation =
      PredicateSetRelation.toEndorelation relation :=
  rfl

end LRA.Relation.Constructions.Mathlib
