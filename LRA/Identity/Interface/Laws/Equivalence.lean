import LRA.Identity.Interface.Definitions.Equality
import LRA.Relation.Structures.Definition

namespace LRA.Identity

universe u

theorem EqualityIsEquivalenceRelation (Carrier : Type u) :
    LRA.Relation.EquivalenceRelation (EqualityRelation Carrier) := by
  constructor
  . -- left
    intro x
    rfl
  . -- right
    constructor
    . -- right.left
      intro x
      intro y
      intro xEqualsY
      exact xEqualsY.symm
    . -- right.right
      intro x
      intro y
      intro z
      intro xEqualsY
      intro yEqualsZ
      exact xEqualsY.trans yEqualsZ

end LRA.Identity
