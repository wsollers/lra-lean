import LRA.Function.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Function

universe u

/-- The identity function on a carrier, presented by the identity relation. -/
def IdentityFunction (Carrier : Type u) : Endofunction Carrier where
  graph := LRA.Relation.IdentityRelation Carrier
  total := by
    sorry
  singleValued := by
    sorry

end LRA.Function
