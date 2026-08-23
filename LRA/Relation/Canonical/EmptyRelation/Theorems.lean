import LRA.Relation.Canonical.EmptyRelation.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Relation

universe u v

                                                    
theorem EmptyRelationIsRightUnique {Domain : Type u} {Codomain : Type v} :
    RightUnique (fun _input : Domain => fun _output : Codomain => False) := by
  sorry

end LRA.Relation
