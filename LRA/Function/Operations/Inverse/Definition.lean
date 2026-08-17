import LRA.Function.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Function

universe u v

/-- The inverse of a bijective function, presented by the converse graph relation. -/
def Inverse
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (_bijective : Bijective function) :
    RelationalFunction Codomain Domain where
  graph := LRA.Relation.Converse function.graph
  total := by
    sorry
  singleValued := by
    sorry

end LRA.Function
