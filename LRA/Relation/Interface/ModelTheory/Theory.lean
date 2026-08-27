import LRA.Relation.Interface.Laws
import LRA.Relation.Interface.ModelTheory.LStructure

namespace LRA.Relation.ModelTheory

universe u

structure RelationTheory {Carrier : Type u}
    (relationInterpretation : Carrier → Carrier → Prop) : Prop where
  reflexive : LRA.Relation.Reflexive relationInterpretation
  symmetric : LRA.Relation.Symmetric relationInterpretation
  transitive : LRA.Relation.Transitive relationInterpretation

end LRA.Relation.ModelTheory
